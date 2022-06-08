import 'package:code_builder/code_builder.dart';
import 'package:collection/collection.dart';
import 'package:recase/recase.dart';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_generator_base.dart';
import 'package:swagger_dart_code_generator/src/extensions/file_name_extensions.dart';
import 'package:swagger_dart_code_generator/src/extensions/parameter_extensions.dart';
import 'package:swagger_dart_code_generator/src/extensions/string_extension.dart';
import 'package:swagger_dart_code_generator/src/models/generator_options.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/requests/swagger_request.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/requests/swagger_request_parameter.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/responses/swagger_response.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/responses/swagger_schema.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/swagger_path.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/swagger_root.dart';

import 'constants.dart';

abstract class SwaggerSocketsGenerator extends SwaggerGeneratorBase {
  final GeneratorOptions _options;

  @override
  GeneratorOptions get options => _options;

  SwaggerSocketsGenerator(this._options);

  String generate(SwaggerRoot root, String fileName);

  String generateFromMap(
    SwaggerRoot root,
    String fileName,
    Map<String, SwaggerSchema> definitions,
    Map<String, SwaggerSchema> responses,
    Map<String, SwaggerSchema> requestBodies,
  ) {
    final fileImports = _generateSocketsImports(fileName);

    final socketClass = _generateClass(root, fileName);

    return '''
$fileImports

${socketClass.accept(DartEmitter()).toString()}

    ''';
  }

  Class _generateClass(SwaggerRoot swaggerRoot, String fileName) {
    final allMethodsContent = _getAllMethodsContent(swaggerRoot: swaggerRoot);

    final className = getClassNameFromFileName(fileName);

    return Class((c) => c
      ..name = className
      ..docs.add(kServiceHeader)
      ..fields.add(Field(
        (f) => f
          ..static = true
          ..modifier = FieldModifier.constant
          ..name = '_basePath'
          ..assignment = Code("'${swaggerRoot.basePath}'"),
      ))
      ..fields.add(Field(
        (f) => f
          ..name = '_service'
          ..type = Reference('${className}SocketsService')
          ..assignment = Code('${className}SocketsService()')
          ..modifier = FieldModifier.final$,
      ))
      ..methods.addAll([...allMethodsContent]));
  }

  List<Method> _getAllMethodsContent({
    required SwaggerRoot swaggerRoot,
  }) {
    final methods = <Method>[];

    swaggerRoot.paths.forEach((String path, SwaggerPath swaggerPath) {
      swaggerPath.requests
          .forEach((String requestType, SwaggerRequest swaggerRequest) {
        if (requestType.toLowerCase() == kRequestTypeOptions) {
          return;
        }

        if (options.excludePaths
            .any((excludePath) => RegExp(excludePath).hasMatch(path))) {
          return;
        }

        if (options.includePaths.isNotEmpty &&
            !options.includePaths
                .any((includePath) => RegExp(includePath).hasMatch(path))) {
          return;
        }

        final tempMethodName = _getRequestMethodName(
          requestType: requestType,
          swaggerRequest: swaggerRequest,
          path: path,
        );

        final parameters = _getAllParameters(
          swaggerRequest: swaggerRequest,
          ignoreHeaders: options.ignoreHeaders,
          modelPostfix: options.modelPostfix,
          swaggerPath: swaggerPath,
          path: path,
          requestType: requestType,
          root: swaggerRoot,
        );

        final returnTypeName = _getReturnTypeName(
          responses: swaggerRequest.responses,
          path: path,
          methodName: tempMethodName,
          modelPostfix: options.modelPostfix,
          swaggerRoot: swaggerRoot,
          overriddenResponses: options.responseOverrideValueMap
              .asMap()
              .map((key, value) => MapEntry(value.url, value)),
        );

        final isBasicType = kBasicTypesMap.containsKey(returnTypeName);

        final returns = returnTypeName.isEmpty || isBasicType
            ? kFutureGeneric
            : returnTypeName.asFuture();

        final methodName = returnTypeName.isEmpty || isBasicType
            ? tempMethodName.asGenerics()
            : tempMethodName;

        final methodCode =
            _generateSocketMethodCode(returnTypeName, path, parameters);

        final method = Method((m) => m
          ..optionalParameters.addAll(parameters)
          ..name = methodName
          ..body = Code(methodCode)
          ..returns = Reference(returns));

        final socketMethod = _getSocketMethod(method);
        methods.addAll([socketMethod]);
      });
    });

    return methods;
  }

  Method _getSocketMethod(Method method) {
    final parameters = method.optionalParameters.map((p) => p.copyWith(
        annotations: [], type: Reference(p.type?.symbol?.split('.').last)));

    return Method(
      (m) => m
        ..optionalParameters.addAll(parameters)
        ..name = method.name
        ..body = method.body
        ..docs.add('\n')
        ..returns = method.returns,
    );
  }

  String _generateSocketMethodCode(
      String returnName, String path, List<Parameter> parameters) {
    final returnType =
        returnName.isEmpty || kBasicTypesMap.containsKey(returnName)
            ? kGeneric
            : returnName;

    final socketData = _getSocketData(parameters);

    final secondGeneric = socketData.isEmpty ? 'Type' : kMapStringDynamic;
    final secondParameter = socketData.isEmpty ? '' : ', _data';

    return '''
$socketData  
return _service.send<$returnType,$secondGeneric>('\$_basePath$path'$secondParameter);    
    ''';
  }

  String _getSocketData(List<Parameter> parameters) {
    final Map<String, dynamic> data = {};

    for (final param in parameters) {
      data.putIfAbsent("'${param.name}'", () => param.name);
    }

    if (data.isEmpty) {
      return '';
    }

    return '$kFinal $kMapStringDynamic _data = $data;';
  }

  String _generateSocketsImports(String fileName) {
    return '''
// ignore_for_file: type=lint
    
import 'dart:async';

import '$fileName.swagger.dart';
import '$fileName.sockets.service.swagger.dart';
    ''';
  }

  String _getRequestMethodName({
    required SwaggerRequest swaggerRequest,
    required String path,
    required String requestType,
  }) {
    String methodName;
    if (options.usePathForRequestNames || swaggerRequest.operationId.isEmpty) {
      methodName = generateRequestName(path, requestType);
    } else {
      methodName = swaggerRequest.operationId;
    }

    return methodName;
  }

  List<Parameter> _getAllParameters({
    required SwaggerRequest swaggerRequest,
    required bool ignoreHeaders,
    required String path,
    required String requestType,
    required String modelPostfix,
    required SwaggerRoot root,
    required SwaggerPath swaggerPath,
  }) {
    final definedParameters = <String, SwaggerRequestParameter>{};
    definedParameters.addAll(root.parameters);
    definedParameters.addAll(root.components?.parameters ?? {});

    final securityParameters = swaggerRequest.security
        .map((e) => root.securityDefinitions[e])
        .whereNotNull();

    final parameters = [
      ...swaggerRequest.parameters,
      ...swaggerPath.parameters,
      ...securityParameters,
    ].map((par) => definedParameters[par.ref.split('/').last] ?? par).toList();

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
                  _getHeaderDefaultValue(swaggerParameter) == null &&
                  swaggerParameter.inParameter != kHeader
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
              ..defaultTo = _getHeaderDefaultValue(swaggerParameter),
          ),
        )
        .toList();

    final requestBody = swaggerRequest.requestBody;

    if (requestBody != null) {
      var typeName = '';

      if (requestBody.hasRef) {
        final ref = requestBody.ref;
        typeName = ref.getRef();

        final requestBodyRef =
            root.components?.requestBodies[ref.getRef()]?.ref ?? '';

        if (requestBodyRef.isNotEmpty) {
          typeName = requestBodyRef.getRef();
        }

        typeName = getValidatedClassName(typeName);
      }

      final schema = requestBody.content?.schema;

      if (schema != null) {
        if (schema.format == kBinary) {
          typeName = kObject.pascalCase;
        } else {
          typeName = _getRequestBodyTypeName(
            schema: schema,
            modelPostfix: options.modelPostfix,
            root: root,
            requestPath: path + requestType.pascalCase,
          );
        }
      }

      if (typeName.isNotEmpty) {
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

    return result.distinctParameters();
  }

  Expression _getParameterAnnotation(SwaggerRequestParameter parameter) {
    switch (parameter.inParameter) {
      case kFormData:
        return refer(kField)
            .call([literalString(parameter.name.replaceAll('\$', ''))]);
      case kBody:
        return refer(kBody.pascalCase).call([]);
      default:
        //https://github.com/lejard-h/chopper/issues/295
        return refer(parameter.inParameter.pascalCase)
            .call([literalString(parameter.name.replaceAll('\$', ''))]);
    }
  }

  String _getParameterTypeName({
    required SwaggerRequestParameter parameter,
    required String path,
    required String requestType,
    required String modelPostfix,
    required SwaggerRoot root,
  }) {
    final format = parameter.schema?.format ?? '';

    if (parameter.inParameter == kHeader) {
      return _mapParameterName(kString, format, '');
    } else if (parameter.inParameter == kPath) {
      return _mapParameterName(kString, format, '');
    } else if (parameter.items?.enumValues.isNotEmpty == true ||
        parameter.schema?.enumValues.isNotEmpty == true) {
      return _getEnumParameterTypeName(
          parameterName: parameter.name, path: path, requestType: requestType);
    } else if (parameter.items?.type.isNotEmpty == true) {
      return _mapParameterName(parameter.items!.type, format, modelPostfix)
          .asList();
    } else if (parameter.items?.hasRef == true) {
      if (_isEnumRefParameter(parameter, root)) {
        return parameter.items!.ref.getRef().asEnum();
      }
      return _mapParameterName(
              parameter.items!.ref.getRef(), format, modelPostfix)
          .asList();
    } else if (parameter.schema?.items?.hasRef == true) {
      if (_isEnumRefParameter(parameter, root)) {
        return parameter.schema!.items!.ref.getRef().asEnum();
      }
      return (parameter.schema!.items!.ref.getRef() + modelPostfix).asList();
    } else if (parameter.schema?.hasRef == true) {
      if (_isEnumRefParameter(parameter, root)) {
        return parameter.schema!.ref.getRef().asEnum();
      }

      if (_isEnumRef(parameter.schema!.ref.getUnformattedRef(), root)) {
        return parameter.schema!.ref.getRef().asEnum();
      }

      if (parameter.schema!.items != null || parameter.schema!.type == kArray) {
        return (parameter.schema!.ref.getRef() + modelPostfix).asList();
      }
      return (parameter.schema!.ref.getRef() + modelPostfix);
    } else if (parameter.schema?.type == kArray &&
        parameter.schema?.items?.type.isNotEmpty == true) {
      return _mapParameterName(parameter.schema!.items!.type, format, '')
          .asList();
    } else if (parameter.schema?.anyOf.firstOrNull?.type.isNotEmpty == true) {
      return _mapParameterName(parameter.schema!.anyOf.first.type, format, '');
    }

    var neededType = parameter.type.isNotEmpty
        ? parameter.type
        : parameter.schema?.type ?? kObject.pascalCase;

    return _mapParameterName(neededType, format, modelPostfix);
  }

  bool _isEnumRefParameter(
      SwaggerRequestParameter parameter, SwaggerRoot root) {
    final schemas = root.components?.schemas ?? {};
    schemas.addAll(root.definitions);

    final refs = [
      parameter.schema?.items?.ref.getUnformattedRef(),
      parameter.schema?.ref.getUnformattedRef(),
      parameter.items?.ref.getUnformattedRef(),
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

  String _getEnumParameterTypeName({
    required String parameterName,
    required String path,
    required String requestType,
  }) {
    final pathString = path
        .split('/')
        .map((e) => e.replaceAll('}', '').replaceAll('{', '').pascalCase)
        .join();

    final result = getValidatedClassName(
        '$pathString ${requestType.pascalCase} $parameterName');

    return result.asEnum();
  }

  String _getRequestBodyTypeName({
    required SwaggerSchema schema,
    required String modelPostfix,
    required SwaggerRoot root,
    required String requestPath,
  }) {
    if (schema.type.isNotEmpty) {
      if (schema.type == kArray) {
        final ref = schema.items?.ref.getRef() ?? '';

        if (_isEnumRef(ref, root)) {
          return ref.asEnum().asList();
        }

        if (_isBasicTypeRef(ref, root)) {
          return kObject.pascalCase;
        }

        if (ref.isNotEmpty) {
          return getValidatedClassName(ref.withPostfix(modelPostfix)).asList();
        }

        return '';
      } else if (schema.type == kObject) {
        return getValidatedClassName('$requestPath\$$kRequestBody');
      }

      return kBasicTypesMap[schema.type] ?? schema.type;
    }

    if (schema.hasRef) {
      if (_isEnumRef(schema.ref, root)) {
        return schema.ref.getRef().asEnum();
      }

      if (_isBasicTypeRef(schema.ref, root)) {
        return kObject.pascalCase;
      }

      return getValidatedClassName(
          schema.ref.getRef().withPostfix(modelPostfix));
    }

    return '';
  }

  bool _isBasicTypeRef(String ref, SwaggerRoot root) {
    final schemas = _getAllReusableObjects(root);

    final neededSchema = schemas[ref.getUnformattedRef()];

    if (neededSchema == null) {
      return false;
    }

    return kBasicTypes.contains(neededSchema.type);
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

    if ((neededSchema.type == kString || neededSchema.type == kInteger) &&
        neededSchema.enumValues.isNotEmpty) {
      return true;
    }

    return false;
  }

  Code? _getHeaderDefaultValue(SwaggerRequestParameter swaggerParameter) {
    final overridenValue = options.defaultHeaderValuesMap.firstWhereOrNull(
        (map) =>
            map.headerName.toLowerCase() ==
            swaggerParameter.name.toLowerCase());

    if (overridenValue != null) {
      return Code('\'${overridenValue.defaultValue}\'');
    }

    return null;
  }

  SwaggerResponse? _getSuccessResponse({
    required Map<String, SwaggerResponse> responses,
  }) {
    return responses.entries
        .firstWhereOrNull((responseEntry) =>
            successResponseCodes.contains(responseEntry.key) ||
            successDescriptions.contains(responseEntry.value.description))
        ?.value;
  }

  String _getReturnTypeName({
    required Map<String, SwaggerResponse> responses,
    required Map<String, ResponseOverrideValueMap> overriddenResponses,
    required String path,
    required String methodName,
    required String modelPostfix,
    required SwaggerRoot swaggerRoot,
  }) {
    if (overriddenResponses.containsKey(path)) {
      return overriddenResponses[path]!.overriddenValue;
    }

    final neededResponse = _getSuccessResponse(
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
        _getReturnTypeFromSchema(neededResponse, modelPostfix, swaggerRoot) ??
        _getReturnTypeFromOriginalRef(neededResponse, modelPostfix) ??
        _getReturnTypeFromContent(
          swaggerResponse: neededResponse,
          modelPostfix: modelPostfix,
          swaggerRoot: swaggerRoot,
        ) ??
        '';

    if (type.isNotEmpty) {
      return type;
    }

    return '';
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

      return _mapParameterName(mappedArrayType, '', modelPostfix).asList();
    }

    return kBasicTypesMap[responseType] ?? responseType + modelPostfix;
  }

  String _mapParameterName(String name, String format, String modelPostfix) {
    if (name == kInteger && format == kInt64) {
      return kNum;
    }
    return kBasicTypesMap[name] ?? name.pascalCase + modelPostfix;
  }

  String? _getReturnTypeFromSchema(
      SwaggerResponse swaggerResponse, String modelPostfix, SwaggerRoot root) {
    final listRef = swaggerResponse.schema?.items?.ref ?? '';

    if (listRef.isNotEmpty) {
      return (listRef.getRef() + modelPostfix).asList();
    }

    final ref = swaggerResponse.schema?.ref ?? swaggerResponse.ref;

    if (ref.isNotEmpty) {
      final allReusableObjects = _getAllReusableObjects(root);
      final neededResponse = allReusableObjects[ref.getUnformattedRef()];

      if (neededResponse == null) {
        return kObject.pascalCase;
      }

      if (neededResponse.ref.isNotEmpty) {
        return kObject.pascalCase;
      }

      if (kBasicTypes.contains(neededResponse.type)) {
        return kBasicTypesMap[neededResponse.type]!;
      }

      return getValidatedClassName(ref.getRef() + modelPostfix);
    }

    return null;
  }

  Map<String, SwaggerSchema> _getAllReusableObjects(SwaggerRoot root) {
    final results = <String, SwaggerSchema>{};
    results.addAll(root.definitions);
    results.addAll(root.components?.schemas ?? {});
    results.addAll(root.components?.responses ?? {});
    results.addAll(root.components?.requestBodies ?? {});

    return results;
  }

  String? _getReturnTypeFromOriginalRef(
      SwaggerResponse swaggerResponse, String modelPostfix) {
    if (swaggerResponse.schema?.hasOriginalRef == true) {
      return swaggerResponse.schema!.originalRef + modelPostfix;
    }

    return null;
  }

  String? _getReturnTypeFromContent({
    required SwaggerResponse swaggerResponse,
    required String modelPostfix,
    required SwaggerRoot swaggerRoot,
  }) {
    final content = swaggerResponse.content;

    if (content == null) {
      return null;
    }

    if (content.hasRef) {
      final ref = content.ref;
      final type = ref.getRef().withPostfix(modelPostfix);
      return kBasicTypesMap[type] ?? type;
    }

    final schemaRef = content.schema?.ref ?? '';
    if (schemaRef.isNotEmpty) {
      final allRefs = _getAllReusableObjects(swaggerRoot);
      final neededSchema = allRefs[schemaRef.getUnformattedRef()];

      if (neededSchema == null) {
        return kObject.pascalCase;
      }

      if (kBasicTypes.contains(neededSchema.type)) {
        return kObject.pascalCase;
      }

      final typeName =
          getValidatedClassName(schemaRef.getRef()).withPostfix(modelPostfix);

      return typeName;
    }

    final responseType = content.responseType;

    if (responseType.isNotEmpty) {
      if (responseType == kArray) {
        final originalRef = swaggerResponse.schema?.items?.originalRef ?? '';

        if (originalRef.isNotEmpty) {
          return kBasicTypesMap[originalRef]?.asList();
        }
      }
    }

    final itemsRef = content.items?.ref ?? '';
    if (itemsRef.isNotEmpty) {
      return kBasicTypesMap[itemsRef]?.withPostfix(modelPostfix).asList();
    }

    final schemaItemsRef = content.schema?.items?.ref ?? '';
    if (schemaItemsRef.isNotEmpty) {
      final result = getValidatedClassName(schemaItemsRef.getRef())
          .withPostfix(modelPostfix)
          .asList();

      return result;
    }

    if (content.schema?.type == kArray) {
      final itemsType = content.schema?.items?.type ?? '';
      final itemsFormat = content.schema?.items?.format ?? '';

      if (itemsType == kArray && content.schema?.items?.items?.ref != null) {
        final itemsItemsType = content.schema?.items?.items?.ref.getRef() ??
            content.schema?.items?.items?.type ??
            kObject;

        return itemsItemsType.asList().asList();
      } else if (itemsType.isNotEmpty) {
        final parameterType = _mapParameterName(itemsType, itemsFormat, '');
        return parameterType.asList();
      }
    }

    final contentSchemaType = content.schema?.type ?? '';
    if (contentSchemaType.isNotEmpty == true) {
      return kBasicTypesMap[contentSchemaType];
    }

    if (responseType.isEmpty) {
      return '';
    }

    return kBasicTypesMap[responseType] ?? responseType + modelPostfix;
  }
}
