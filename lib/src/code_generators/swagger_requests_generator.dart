import 'dart:convert';

import 'package:code_builder/code_builder.dart';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_additions_generator.dart';
import 'package:swagger_dart_code_generator/src/models/generator_options.dart';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_models_generator.dart';
import 'package:swagger_dart_code_generator/src/extensions/string_extension.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/requests/swagger_request.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/requests/swagger_request_parameter.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/responses/swagger_response.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/swagger_path.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/swagger_root.dart';
import 'package:recase/recase.dart';
import 'package:collection/collection.dart';

import 'constants.dart';

class SwaggerRequestsGenerator {
  String generate({
    required String code,
    required String className,
    required String fileName,
    required GeneratorOptions options,
  }) {
    final map = jsonDecode(code) as Map<String, dynamic>;
    final swaggerRoot = SwaggerRoot.fromJson(map);

    final service = _generateService(
      swaggerRoot,
      className,
      fileName,
      options,
    );

    final tt = service.accept(DartEmitter()).toString();

    return tt;

    //return DartFormatter(lineEnding: '\n').format(tt);
  }

  Class _generateService(
    SwaggerRoot swaggerRoot,
    String className,
    String fileName,
    GeneratorOptions options,
  ) {
    final allMethodsContent = _getAllMethodsContent(
      swaggerRoot: swaggerRoot,
      options: options,
    );

    final chopperClient = SwaggerAdditionsGenerator.getChopperClientContent(
      className,
      swaggerRoot.host,
      swaggerRoot.basePath,
      options,
    );

    return Class(
      (c) => c
        ..methods.addAll([_generateCreateMethod(className, chopperClient), ...allMethodsContent])
        ..extend = Reference(kChopperService)
        ..docs.add(kServiceHeader)
        ..annotations.add(refer(kChopperApi).call([]))
        ..abstract = true
        ..name = className,
    );
  }

  Method _generateCreateMethod(String className, String body) {
    return Method(
      (m) => m
        ..returns = Reference(className)
        ..name = 'create'
        ..optionalParameters.add(
          Parameter(
            (p) => p
              ..named = false
              ..type = Reference('ChopperClient?')
              ..name = 'client',  
          ),
        )..body = Code(body),
    );
  }

  List<Method> _getAllMethodsContent({
    required SwaggerRoot swaggerRoot,
    required GeneratorOptions options,
  }) {
    final methods = <Method>[];

    swaggerRoot.paths.forEach((String path, SwaggerPath swaggerPath) {
      swaggerPath.requests
          .forEach((String requestType, SwaggerRequest swaggerRequest) {
        if (requestType.toLowerCase() == kRequestTypeOptions) {
          return;
        }

        final methodName = _getRequestMethodName(
            requestType: requestType,
            swaggerRequest: swaggerRequest,
            path: path,
            options: options);

        final parameters = _getAllParameters(
          parameters: swaggerRequest.parameters,
          ignoreHeaders: options.ignoreHeaders,
          path: path,
          requestType: requestType,
        );

        final returnTypeName = _getReturnTypeName(
          responses: swaggerRequest.responses,
          path: path,
          methodName: methodName,
          overridenResponses: options.responseOverrideValueMap
              .asMap()
              .map((key, value) => MapEntry(value.url, value)),
        );

        final returns = returnTypeName.isEmpty
            ? kFutureResponse
            : returnTypeName.asFutureResponse();

        methods.add(Method((m) => m
          ..optionalParameters.addAll(parameters)
          ..docs.add(_getCommentsForMethod(
            methodDescription: swaggerRequest.summary,
            parameters: swaggerRequest.parameters,
            options: options,
          ))
          ..name = methodName
          ..annotations.add(_getMethodAnnotation(requestType, path))
          ..returns = Reference(returns)));
      });
    });

    return methods;
  }

  Expression _getMethodAnnotation(String requestType, String path) {
    return refer(requestType.pascalCase).call([], {kPath: literalString(path)});
  }

  String _getCommentsForMethod({
    required String methodDescription,
    required List<SwaggerRequestParameter> parameters,
    required GeneratorOptions options,
  }) {
    final parametersComments = parameters
        .map((SwaggerRequestParameter parameter) => _createSummaryParameters(
              parameter.name,
              parameter.description,
              parameter.inParameter,
              options,
            ));

    final header = '///$methodDescription';
    return [header, ...parametersComments]
        .where((String element) => element.isNotEmpty)
        .join('\n');
  }

  String _createSummaryParameters(
      String parameterName,
      String parameterDescription,
      String inParameter,
      GeneratorOptions options) {
    if (inParameter == kHeader && options.ignoreHeaders) {
      return '';
    }
    if (parameterDescription.isNotEmpty) {
      parameterDescription =
          parameterDescription.replaceAll(RegExp(r'\n|\r|\t'), ' ');
    } else {
      parameterDescription = '';
    }

    return '///@param $parameterName $parameterDescription';
  }

  Expression _getParameterAnnotation(SwaggerRequestParameter parameter) {
    switch (parameter.inParameter) {
      case kFormData:
        return refer(kField).call([]);
      case kPath:
        return refer(parameter.inParameter.pascalCase)
            .call([literalString(parameter.name)]);
      default:
        return refer(parameter.inParameter.pascalCase).call([]);
    }
  }

  String _getEnumParameterTypeName({
    required String parameterName,
    required String path,
    required String requestType,
  }) {
    final pathString = path.split('/').map((e) => e.pascalCase).join();
    return 'enums.$pathString\$${requestType.pascalCase}\$${parameterName.pascalCase}';
  }

  String _getParameterTypeName({
    required SwaggerRequestParameter parameter,
    required String path,
    required String requestType,
  }) {
    if (parameter.items?.enumValues.isNotEmpty == true ||
        parameter.schema?.enumValues.isNotEmpty == true) {
      return _getEnumParameterTypeName(
          parameterName: parameter.name, path: path, requestType: requestType);
    } else if (parameter.items?.type.isNotEmpty == true) {
      return _mapParameterName(parameter.items!.type).asList();
    } else if(parameter.schema?.items?.ref.isNotEmpty == true)
    {
      return parameter.schema!.items!.ref.getRef().asList();
    } else if (parameter.schema?.ref.isNotEmpty == true) {
      return parameter.schema!.ref.getRef();
    }
    final neededType = parameter.type.isNotEmpty
        ? parameter.type
        : parameter.schema?.type ?? '';

    return _mapParameterName(neededType);
  }

  String _mapParameterName(String name) {
    return kBasicTypesMap[name] ?? name.pascalCase;
  }

  List<Parameter> _getAllParameters({
    required List<SwaggerRequestParameter> parameters,
    required bool ignoreHeaders,
    required String path,
    required String requestType,
  }) {
    final result = parameters
        .where((swaggerParameter) =>
            ignoreHeaders ? swaggerParameter.inParameter != kHeader : true)
        .where((swaggerParameter) => swaggerParameter.inParameter.isNotEmpty)
        .map(
          (swaggerParameter) => Parameter(
            (p) => p
              ..name = swaggerParameter.name.asParameterName()
              ..named = true
              ..required = true
              ..type = Reference(
                _getParameterTypeName(
                  parameter: swaggerParameter,
                  path: path,
                  requestType: requestType,
                ).makeNullable(),
              )
              ..named = true
              ..annotations.add(
                _getParameterAnnotation(swaggerParameter),
              ),
          ),
        )
        .toList();

    return result;
  }

  String _getRequestMethodName({
    required SwaggerRequest swaggerRequest,
    required GeneratorOptions options,
    required String path,
    required String requestType,
  }) {
    if (options.usePathForRequestNames || swaggerRequest.operationId.isEmpty) {
      return SwaggerModelsGenerator.generateRequestName(path, requestType);
    } else {
      return swaggerRequest.operationId;
    }
  }

  static SwaggerResponse? getSuccessedResponse({
    required Map<String, SwaggerResponse> responses,
  }) {
    return responses.entries
        .firstWhereOrNull((responseEntry) =>
            successResponseCodes.contains(responseEntry.key) ||
            successDescriptions.contains(responseEntry.value.description))
        ?.value;
  }

  String _getResponseModelName({
    required String path,
    required String methodName,
  }) {
    final urlString = path.split('/').map((e) => e.pascalCase).join();
    final methodNamePart = methodName.pascalCase;

    return '$urlString$methodNamePart\$Response';
  }

  String? _getReturnTypeFromType(SwaggerResponse swaggerResponse) {
    final responseType = swaggerResponse.schema?.type ?? '';
    if (responseType.isEmpty) {
      return null;
    }

    if (responseType == kArray) {
      final itemsOriginalRef = swaggerResponse.schema?.items?.originalRef;
      final itemsType = swaggerResponse.schema?.items?.type;
      final arrayType = itemsOriginalRef ?? itemsType ?? kObject;
      final mappedArrayType = kBasicTypesMap[arrayType] ?? arrayType;

      if (mappedArrayType.isEmpty) {
        return null;
      }

      return mappedArrayType.asList();
    }

    return kBasicTypesMap[responseType] ?? responseType;
  }

  String? _getReturnTypeFromSchema(SwaggerResponse swaggerResponse) {
    final listRef = swaggerResponse.schema?.items?.ref ?? '';

    if (listRef.isNotEmpty) {
      return listRef.getRef().asList();
    }

    final ref = swaggerResponse.schema?.ref ?? swaggerResponse.ref;

    if (ref.isNotEmpty) {
      return ref.getRef();
    }
    return null;
  }

  String? _getReturnTypeFromOriginalRef(SwaggerResponse swaggerResponse) {
    if (swaggerResponse.schema?.originalRef.isNotEmpty == true) {
      return swaggerResponse.schema?.originalRef;
    }

    return null;
  }

  String? _getReturnTypeFromContent(SwaggerResponse swaggerResponse) {
    if (swaggerResponse.content.isNotEmpty) {
      final ref = swaggerResponse.content.first.ref;
      if (ref.isNotEmpty) {
        final type = ref.getRef();
        return kBasicTypesMap[type] ?? type;
      }

      final responseType = swaggerResponse.content.first.responseType;

      if (responseType.isNotEmpty) {
        if (responseType == kArray) {
          final originalRef = swaggerResponse.schema?.items?.originalRef ?? '';

          if (originalRef.isNotEmpty) {
            return kBasicTypesMap[originalRef]!.asList();
          }

          final ref = swaggerResponse.content.firstOrNull?.items?.ref ?? '';
          if (ref.isNotEmpty) {
            return kBasicTypesMap[ref]!.asList();
          }
        }

        return kBasicTypesMap[responseType] ?? responseType;
      }
    }
  }

  String _getReturnTypeName({
    required Map<String, SwaggerResponse> responses,
    required Map<String, ResponseOverrideValueMap> overridenResponses,
    required String path,
    required String methodName,
  }) {
    if (overridenResponses.containsKey(path)) {
      return overridenResponses[path]!.overriddenValue;
    }

    final neededResponse = getSuccessedResponse(
      responses: responses,
    );

    if (neededResponse == null) {
      return '';
    }

    if (neededResponse.schema?.type == kObject &&
        neededResponse.schema?.properties.isNotEmpty == true) {
      return _getResponseModelName(path: path, methodName: methodName);
    }

    final type = _getReturnTypeFromType(neededResponse) ??
        _getReturnTypeFromSchema(neededResponse) ??
        _getReturnTypeFromOriginalRef(neededResponse) ??
        _getReturnTypeFromContent(neededResponse);

    return type ?? '';
  }
}
