import 'dart:convert';

import 'package:code_builder/code_builder.dart';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_additions_generator.dart';
import 'package:swagger_dart_code_generator/src/models/generator_options.dart';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_models_generator.dart';
import 'package:swagger_dart_code_generator/src/extensions/string_extension.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/requests/swagger_request.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/requests/swagger_request_parameter.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/responses/swagger_response.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/responses/swagger_schema.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/swagger_path.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/swagger_root.dart';
import 'package:recase/recase.dart';
import 'package:collection/collection.dart';
import 'package:swagger_dart_code_generator/src/extensions/parameter_extensions.dart';

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

    return service.accept(DartEmitter()).toString();
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
        ..methods.addAll([
          _generateCreateMethod(className, chopperClient),
          ...allMethodsContent
        ])
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
        ..static = true
        ..optionalParameters.add(
          Parameter(
            (p) => p
              ..named = false
              ..type = Reference('ChopperClient?')
              ..name = 'client',
          ),
        )
        ..body = Code(body),
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
          swaggerRequest: swaggerRequest,
          ignoreHeaders: options.ignoreHeaders,
          modelPostfix: options.modelPostfix,
          path: path,
          requestType: requestType,
          root: swaggerRoot,
          options: options,
        );

        final returnTypeName = _getReturnTypeName(
          responses: swaggerRequest.responses,
          path: path,
          methodName: methodName,
          modelPostfix: options.modelPostfix,
          overridenResponses: options.responseOverrideValueMap
              .asMap()
              .map((key, value) => MapEntry(value.url, value)),
        );

        final returns = returnTypeName.isEmpty
            ? kFutureResponse
            : returnTypeName.asFutureResponse();

        final method = Method((m) => m
          ..optionalParameters.addAll(parameters)
          ..docs.add(_getCommentsForMethod(
            methodDescription: swaggerRequest.summary,
            parameters: swaggerRequest.parameters,
            options: options,
          ))
          ..name = methodName
          ..annotations.add(_getMethodAnnotation(requestType, path))
          ..returns = Reference(returns));

        if (_hasEnumProperties(method)) {
          final privateMethod = _getPrivateMethod(method);
          final publicMethod = _getPublicMethod(method);
          methods.addAll([publicMethod, privateMethod]);
        } else {
          methods.add(method);
        }
      });
    });

    return methods;
  }

  bool _hasEnumProperties(Method method) {
    return method.optionalParameters
        .any((p) => p.type!.symbol!.startsWith('enums') == true);
  }

  Method _getPrivateMethod(Method method) {
    final parameters = method.optionalParameters.map((p) {
      if (p.type!.symbol!.startsWith('enums.')) {
        return p.copyWith(type: Reference('String?'));
      }

      return p;
    });

    return Method(
      (m) => m
        ..optionalParameters.addAll(parameters)
        ..docs.addAll(method.docs)
        ..name = '_${method.name}'
        ..annotations.addAll(method.annotations)
        ..returns = method.returns,
    );
  }

  Method _getPublicMethod(Method method) {
    final parameters =
        method.optionalParameters.map((p) => p.copyWith(annotations: []));

    return Method(
      (m) => m
        ..optionalParameters.addAll(parameters)
        ..docs.addAll(method.docs)
        ..name = method.name
        ..returns = method.returns
        ..body = _generatePublicMethodReturn(parameters, method.name!),
    );
  }

  Code _generatePublicMethodReturn(
      Iterable<Parameter> parameters, String publicMethodName) {
    final parametersListString = parameters.map((p) {
      if (p.type!.symbol!.startsWith('enums.')) {
        final enumName =
            p.type!.symbol!.replaceFirst('enums.', '').replaceAll('?', '');

        return '${p.name} : enums.\$${enumName}Map[${p.name}]';
      }
      return '${p.name} : ${p.name}';
    }).join(', ');

    return Code('return _$publicMethodName($parametersListString);');
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

    final formattedDescription = methodDescription.split('\n').join('\n///');

    return ['///$formattedDescription', ...parametersComments]
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
      case kBody:
        return refer(kBody.pascalCase).call([]);
      default:
        return refer(parameter.inParameter.pascalCase)
            .call([literalString(parameter.name)]);
    }
  }

  String _getEnumParameterTypeName({
    required String parameterName,
    required String path,
    required String requestType,
  }) {
    final pathString = path
        .split('/')
        .map((e) => e.replaceAll('}', '').replaceAll('{', '').pascalCase)
        .join();

    final result =
        '$pathString${requestType.pascalCase}${parameterName.pascalCase}';

    return result.asEnum();
  }

  bool _isEnumRefParameter(
      SwaggerRequestParameter parameter, SwaggerRoot root) {
    final schemas = root.components?.schemas ?? {};
    schemas.addAll(root.definitions);

    final refs = [
      parameter.schema?.items?.ref.getRef(),
      parameter.schema?.ref.getRef(),
      parameter.items?.ref.getRef(),
    ];
    final schema =
        schemas[refs.firstWhereOrNull((ref) => ref?.isNotEmpty == true)];

    if (schema == null) {
      return false;
    }

    if (schema.type == kString && schema.enumValues.isNotEmpty) {
      return true;
    }

    return false;
  }

  String _getParameterTypeName({
    required SwaggerRequestParameter parameter,
    required String path,
    required String requestType,
    required String modelPostfix,
    required SwaggerRoot root,
  }) {
    if (parameter.inParameter == kHeader) {
      return _mapParameterName(kString, '');
    } else if (parameter.items?.enumValues.isNotEmpty == true ||
        parameter.schema?.enumValues.isNotEmpty == true) {
      return _getEnumParameterTypeName(
          parameterName: parameter.name, path: path, requestType: requestType);
    } else if (parameter.items?.type.isNotEmpty == true) {
      return _mapParameterName(parameter.items!.type, modelPostfix).asList();
    } else if (parameter.items?.ref.isNotEmpty == true) {
      if (_isEnumRefParameter(parameter, root)) {
        return parameter.items!.ref.getRef().asEnum();
      }
      return _mapParameterName(parameter.items!.ref.getRef(), modelPostfix)
          .asList();
    } else if (parameter.schema?.items?.ref.isNotEmpty == true) {
      if (_isEnumRefParameter(parameter, root)) {
        return parameter.schema!.items!.ref.getRef().asEnum();
      }
      return (parameter.schema!.items!.ref.getRef() + modelPostfix).asList();
    } else if (parameter.schema?.ref.isNotEmpty == true) {
      if (_isEnumRefParameter(parameter, root)) {
        return parameter.schema!.ref.getRef().asEnum();
      }
      return (parameter.schema!.ref.getRef() + modelPostfix).asList();
    } else if (parameter.schema?.ref.isNotEmpty == true) {
      return parameter.schema!.ref.getRef() + modelPostfix;
    } else if (parameter.schema?.type == kArray &&
        parameter.schema?.items?.type.isNotEmpty == true) {
      return _mapParameterName(parameter.schema!.items!.type, '').asList();
    } else if (parameter.schema?.anyOf.firstOrNull?.type.isNotEmpty == true) {
      return _mapParameterName(parameter.schema!.anyOf.first.type, '');
    }

    final neededType = parameter.type.isNotEmpty
        ? parameter.type
        : parameter.schema?.type ?? '';

    return _mapParameterName(neededType, modelPostfix);
  }

  String _mapParameterName(String name, String modelPostfix) {
    return kBasicTypesMap[name] ?? name.pascalCase + modelPostfix;
  }

  List<Parameter> _getAllParameters({
    required SwaggerRequest swaggerRequest,
    required bool ignoreHeaders,
    required String path,
    required String requestType,
    required String modelPostfix,
    required SwaggerRoot root,
    required GeneratorOptions options,
  }) {
    final definedParameters = <String, SwaggerRequestParameter>{};
    definedParameters.addAll(root.parameters);
    definedParameters.addAll(root.components?.parameters ?? {});

    final parameters = swaggerRequest.parameters
        .map((par) => definedParameters[par.ref.split('/').last] ?? par)
        .toList();

    final result = parameters
        .where((swaggerParameter) =>
            ignoreHeaders ? swaggerParameter.inParameter != kHeader : true)
        .where((swaggerParameter) => swaggerParameter.inParameter != kCookie)
        .where((swaggerParameter) => swaggerParameter.inParameter.isNotEmpty)
        .map(
          (swaggerParameter) => Parameter(
            (p) => p
              ..name = swaggerParameter.name.asParameterName()
              ..named = true
              ..required = swaggerParameter.isRequired &&
                  _getHeaderDefaultValue(swaggerParameter, options) == null
              ..type = Reference(
                _getParameterTypeName(
                  parameter: swaggerParameter,
                  path: path,
                  requestType: requestType,
                  modelPostfix: modelPostfix,
                  root: root,
                ).makeNullable(),
              )
              ..named = true
              ..annotations.add(
                _getParameterAnnotation(swaggerParameter),
              )
              ..defaultTo = _getHeaderDefaultValue(swaggerParameter, options),
          ),
        )
        .toList();

    final requestBody = swaggerRequest.requestBody;

    if (requestBody != null) {
      final schema = requestBody.content?.schema;

      if (schema != null) {
        final typeName = _getRequestBodyTypeName(
          schema: schema,
          modelPostfix: options.modelPostfix,
          root: root,
        );

        result.add(
          Parameter(
            (p) => p
              ..name = kBody
              ..named = true
              ..required = true
              ..type = Reference(
                typeName.makeNullable(),
              )
              ..named = true
              ..annotations.add(
                refer(kBody.pascalCase).call([]),
              ),
          ),
        );
      }
    }

    return result;
  }

  bool _isEnumRef(String ref, SwaggerRoot root) {
    final schemas = root.components?.schemas ?? <String, SwaggerSchema>{};
    schemas.addAll(root.definitions);

    final neededSchemaKey =
        schemas.keys.firstWhereOrNull((key) => key.getRef() == ref.getRef());

    if (neededSchemaKey == null) {
      return false;
    }

    final neededSchema = schemas[neededSchemaKey]!;

    if (neededSchema.type == kString && neededSchema.enumValues.isNotEmpty) {
      return true;
    }

    return false;
  }

  String _getRequestBodyTypeName({
    required SwaggerSchema schema,
    required String modelPostfix,
    required SwaggerRoot root,
  }) {
    if (schema.type.isNotEmpty) {
      if (schema.type == kArray) {
        final ref = schema.items?.ref.getRef() ?? '';

        if (_isEnumRef(ref, root)) {
          return ref.asEnum().asList();
        }

        if (ref.isNotEmpty) {
          return ref.withPostfix(modelPostfix).asList();
        }

        return '';
      }

      return kBasicTypesMap[schema.type] ?? schema.type;
    }

    if (schema.ref.isNotEmpty) {
      if (_isEnumRef(schema.ref, root)) {
        return schema.ref.getRef().asEnum();
      }

      return schema.ref.getRef().withPostfix(modelPostfix);
    }

    return '';
  }

  Code? _getHeaderDefaultValue(
      SwaggerRequestParameter swaggerParameter, GeneratorOptions options) {
    final overridenValue = options.defaultHeaderValuesMap.firstWhereOrNull(
        (map) =>
            map.headerName.toLowerCase() ==
            swaggerParameter.name.toLowerCase());

    if (overridenValue != null) {
      return Code('\'${overridenValue.defaultValue}\'');
    }

    return null;
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
    required String modelPostfix,
  }) {
    return '${methodName.pascalCase}\$$kResponse$modelPostfix';
  }

  String? _getReturnTypeFromType(
      SwaggerResponse swaggerResponse, String modelPostfix) {
    final responseType = swaggerResponse.schema?.type ?? '';
    if (responseType.isEmpty) {
      return null;
    }

    if (responseType == kArray) {
      final itemsOriginalRef = swaggerResponse.schema?.items?.originalRef;
      final itemsType = swaggerResponse.schema?.items?.type;
      final itemsRef = swaggerResponse.schema?.items?.ref.getRef();

      final arrayType = [itemsRef, itemsOriginalRef, itemsType, kObject]
          .firstWhere((element) => element?.isNotEmpty == true)!;

      final mappedArrayType = kBasicTypesMap[arrayType] ?? arrayType;

      if (mappedArrayType.isEmpty) {
        return null;
      }

      return _mapParameterName(mappedArrayType, modelPostfix).asList();
    }

    return kBasicTypesMap[responseType] ?? responseType + modelPostfix;
  }

  String? _getReturnTypeFromSchema(
      SwaggerResponse swaggerResponse, String modelPostfix) {
    final listRef = swaggerResponse.schema?.items?.ref ?? '';

    if (listRef.isNotEmpty) {
      return (listRef.getRef() + modelPostfix).asList();
    }

    final ref = swaggerResponse.schema?.ref ?? swaggerResponse.ref;

    if (ref.isNotEmpty) {
      return ref.getRef() + modelPostfix;
    }

    return null;
  }

  String? _getReturnTypeFromOriginalRef(
      SwaggerResponse swaggerResponse, String modelPostfix) {
    if (swaggerResponse.schema?.originalRef.isNotEmpty == true) {
      return swaggerResponse.schema!.originalRef + modelPostfix;
    }

    return null;
  }

  String? _getReturnTypeFromContent(
      SwaggerResponse swaggerResponse, String modelPostfix) {
    final content = swaggerResponse.content;

    if (content == null) {
      return null;
    }

    final ref = content.ref;
    if (ref.isNotEmpty) {
      final type = ref.getRef().withPostfix(modelPostfix);
      return kBasicTypesMap[type] ?? type;
    }

    final schemaRef = content.schema?.ref ?? '';
    if (schemaRef.isNotEmpty) {
      final type = schemaRef.getRef().withPostfix(modelPostfix);
      return kBasicTypesMap[type] ?? type;
    }

    final responseType = content.responseType;

    if (responseType.isNotEmpty) {
      if (responseType == kArray) {
        final originalRef = swaggerResponse.schema?.items?.originalRef ?? '';

        if (originalRef.isNotEmpty) {
          return kBasicTypesMap[originalRef]!.asList();
        }
      }
    }

    final itemsRef = content.items?.ref ?? '';
    if (itemsRef.isNotEmpty) {
      return kBasicTypesMap[itemsRef]!.withPostfix(modelPostfix).asList();
    }

    final schemaItemsRef = content.schema?.items?.ref ?? '';
    if (schemaItemsRef.isNotEmpty) {
      return schemaItemsRef.getRef().withPostfix(modelPostfix).asList();
    }

    if (responseType.isEmpty) {
      return '';
    }

    return kBasicTypesMap[responseType] ?? responseType + modelPostfix;
  }

  String _getReturnTypeName({
    required Map<String, SwaggerResponse> responses,
    required Map<String, ResponseOverrideValueMap> overridenResponses,
    required String path,
    required String methodName,
    required String modelPostfix,
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
      return _getResponseModelName(
        path: path,
        methodName: methodName,
        modelPostfix: modelPostfix,
      );
    }

    final type = _getReturnTypeFromType(neededResponse, modelPostfix) ??
        _getReturnTypeFromSchema(neededResponse, modelPostfix) ??
        _getReturnTypeFromOriginalRef(neededResponse, modelPostfix) ??
        _getReturnTypeFromContent(neededResponse, modelPostfix);

    return type ?? '';
  }
}
