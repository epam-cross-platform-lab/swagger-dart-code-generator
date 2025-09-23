import 'package:code_builder/code_builder.dart';
import 'package:collection/collection.dart';
import 'package:recase/recase.dart';
import 'package:swagger_dart_code_generator/src/code_generators/enum_model.dart';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_generator_base.dart';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_models_generator.dart';
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

class SwaggerRequestsGenerator extends SwaggerGeneratorBase {
  final GeneratorOptions _options;

  @override
  GeneratorOptions get options => _options;

  SwaggerRequestsGenerator(this._options);

  String generate({
    required SwaggerRoot swaggerRoot,
    required String className,
    required String fileName,
    required List<EnumModel> allEnums,
  }) {
    final service = _generateService(swaggerRoot, allEnums, className, fileName);

    return service.accept(DartEmitter()).toString();
  }

  Class _generateService(
    SwaggerRoot swaggerRoot,
    List<EnumModel> allEnums,
    String className,
    String fileName,
  ) {
    final allMethodsContent = _getAllMethodsContent(swaggerRoot: swaggerRoot, allEnums: allEnums);

    final chopperClient = getChopperClientContent(
      className,
      swaggerRoot.host,
      swaggerRoot.basePath,
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
        ..static = true
        ..optionalParameters.add(
          Parameter(
            (p) => p
              ..named = true
              ..type = Reference('ChopperClient?')
              ..name = 'client',
          ),
        )
        ..optionalParameters.add(
          Parameter(
            (p) => p
              ..named = true
              ..type = Reference('http.Client?')
              ..name = 'httpClient',
          ),
        )
        ..optionalParameters.add(
          Parameter(
            (p) => p
              ..named = true
              ..type = Reference('Authenticator?')
              ..name = 'authenticator',
          ),
        )
        ..optionalParameters.add(
          Parameter(
            (p) => p
              ..named = true
              ..type = Reference('ErrorConverter?')
              ..name = 'errorConverter',
          ),
        )
        ..optionalParameters.add(
          Parameter(
            (p) => p
              ..named = true
              ..type = Reference('Converter?')
              ..name = 'converter',
          ),
        )
        ..optionalParameters.add(
          Parameter(
            (p) => p
              ..named = true
              ..type = Reference('Uri?')
              ..name = 'baseUrl',
          ),
        )
        ..optionalParameters.add(
          Parameter(
            (p) => p
              ..named = true
              ..type = Reference('List<Interceptor>?')
              ..name = 'interceptors',
          ),
        )
        ..body = Code(body),
    );
  }

  List<Method> _getAllMethodsContent({
    required SwaggerRoot swaggerRoot,
    required List<EnumModel> allEnums,
  }) {
    final methods = <Method>[];

    swaggerRoot.paths.forEach((String path, SwaggerPath swaggerPath) {
      swaggerPath.requests.forEach((String requestType, SwaggerRequest swaggerRequest) {
        if (requestType.toLowerCase() == kRequestTypeOptions) {
          return;
        }

        if (options.excludePaths.any((excludePath) => RegExp(excludePath).hasMatch(path))) {
          return;
        }

        if (options.includePaths.isNotEmpty &&
            !options.includePaths.any((includePath) => RegExp(includePath).hasMatch(path))) {
          return;
        }

        final methodName = _getRequestMethodName(
          requestType: requestType,
          swaggerRequest: swaggerRequest,
          path: path,
        );

        final parameters = _getAllParameters(
          swaggerRequest: swaggerRequest,
          ignoreHeaders: options.ignoreHeaders,
          modelPostfix: options.modelPostfix,
          swaggerPath: swaggerPath,
          allEnums: allEnums,
          path: path,
          requestType: requestType,
          root: swaggerRoot,
        );

        final returnTypeName = _getReturnTypeName(
          responses: swaggerRequest.responses,
          path: path,
          methodName: methodName,
          method: requestType,
          modelPostfix: options.modelPostfix,
          swaggerRoot: swaggerRoot,
          overridenResponses: Map.fromEntries(
            options.responseOverrideValueMap
                .where((v) => v.method.isEmpty || v.method == requestType)
                .map((v) => MapEntry(v.url, v)),
          ),
        );

        final String returns;

        if (options.customReturnType.isNotEmpty) {
          final innerResponseType = returnTypeName.isEmpty ? 'dynamic' : returnTypeName;

          returns = '${options.customReturnType}<$innerResponseType>';
        } else {
          returns = returnTypeName.isEmpty ? kFutureResponse : returnTypeName.asFutureResponse();
        }

        final hasOptionalBody =
            ['post', 'put', 'patch'].contains(requestType) &&
            swaggerRequest.parameters.none((p) => p.inParameter == kBody);

        final isMultipart = parameters.any((p) {
          return p.annotations.any((p0) => p0.call([]).toString().contains('symbol=Part'));
        });

        final isUrlencoded = parameters.any(
          (p) => p.type != null && p.type!.symbol == options.urlencodedFileType,
        );

        var annotationPath = path;
        if (options.addBasePathToRequests) {
          annotationPath = '${swaggerRoot.basePath}$path';
        }

        final method = Method(
          (m) => m
            ..optionalParameters.addAll(parameters)
            ..docs.add(
              _getCommentsForMethod(
                methodDescription: swaggerRequest.summary,
                parameters: swaggerRequest.parameters,
                componentsParameters: swaggerRoot.components?.parameters ?? {},
              ),
            )
            ..name = methodName
            ..annotations.addAll(
              _getMethodAnnotation(
                requestType: requestType,
                path: annotationPath,
                hasOptionalBody: hasOptionalBody,
                isMultipart: isMultipart,
                isUrlencoded: isUrlencoded,
                isDeprecated: swaggerRequest.deprecated,
                includeNullQueryVars: options.includeNullQueryVars,
              ),
            )
            ..returns = Reference(returns),
        );

        final allModels = _getAllMethodModels(swaggerRoot, swaggerRequest, returnTypeName);

        // Add SwaggerMetaData parameter
        final metaDataParameter = Parameter(
          (p) => p
            ..name = kSwaggerMetaDataParameter
            ..annotations.add(refer('chopper.Tag').call([]))
            ..named = true
            ..required = false
            ..type = Reference(kSwaggerMetaData)
            ..defaultTo = _getDefaultMetaDataValue(swaggerRequest),
        );

        final privateMethod = _getPrivateMethod(
          (method.toBuilder()..optionalParameters.add(metaDataParameter)).build(),
        );
        final publicMethod = _getPublicMethod(method, allModels, swaggerRequest.deprecated);
        methods.addAll([publicMethod, privateMethod]);
      });
    });

    return methods;
  }

  List<String> _getAllMethodModels(SwaggerRoot root, SwaggerRequest request, String response) {
    final results = <String>[];

    ///Models from parameters
    for (var parameter in request.parameters) {
      final ref = parameter.anyRef;

      if (ref.isNotEmpty) {
        final schema = root.allSchemas[ref.getUnformattedRef()];

        if (schema?.type == kArray) {
          if (schema?.items?.ref.isNotEmpty == true) {
            final ref = schema!.items!.ref;

            final itemSchema = root.allSchemas[ref.getUnformattedRef()];

            if (itemSchema?.enumValues.isNotEmpty == true) {
              continue;
            }

            final itemType = getValidatedClassName(ref.getUnformattedRef());
            results.add(itemType);
          } else {
            final itemsType = schema?.items?.type;

            if (!kBasicTypes.contains(itemsType) && schema?.items?.properties != null) {
              final itemClassName = '${response.replaceAll('?', '')}\$Item';

              results.add(itemClassName);
            }
          }
        }

        if (schema == null || schema.type != kObject) {
          continue;
        }

        results.add(ref.getRef());
      }
    }

    if (request.requestBody != null) {
      final refs = [request.requestBody?.ref, request.requestBody?.content?.schema?.ref];

      final ref = refs.firstWhereOrNull((element) => element?.isNotEmpty == true) ?? '';

      final refName = ref.getUnformattedRef();

      final schema = root.allSchemas[refName] ?? root.allSchemas['$refName\$RequestBody'];

      if (schema?.type == kArray) {
        if (schema?.items?.ref.isNotEmpty == true) {
          final ref = schema!.items!.ref;
          final itemType = getValidatedClassName(ref.getUnformattedRef());
          results.add(itemType);
        } else {
          final itemsType = schema?.items?.type ?? '';

          if (!kBasicTypes.contains(itemsType) &&
              itemsType != 'object' &&
              schema?.items?.properties != null &&
              !itemsType.startsWith('List<')) {
            final itemClassName = '$itemsType\$Item';

            results.add(itemClassName);
          }
        }
      }
    }

    //Models from responses
    final successResponses = getSuccessedResponses(responses: request.responses);
    for (final successResponse in successResponses) {
      final responseRef = successResponse.anyRef;

      if (responseRef.isNotEmpty) {
        final schema = root.allSchemas[responseRef.getUnformattedRef()];

        if (schema?.type == kArray) {
          if (schema?.items?.ref.isNotEmpty == true) {
            final ref = schema!.items!.ref;
            final itemType = getValidatedClassName(ref.getUnformattedRef());
            results.add(itemType);
          } else {
            final itemsType = schema?.items?.type;

            if (!kBasicTypes.contains(itemsType) && schema?.items?.properties != null) {
              final itemClassName = '$response\$Item';

              results.add(itemClassName);
            }
          }
        } else {
          if (!response.startsWith('$kMap<')) {
            final neededResponse = response.removeListOrStream();

            if (!kBasicTypes.contains(neededResponse) && neededResponse != kDynamic) {
              results.add(getValidatedClassName(neededResponse));
            }
          }
        }
      } else if (successResponse.schema?.properties.isNotEmpty == true) {
        results.add(response);
      } else if (successResponse.content?.schema?.properties.isNotEmpty == true) {
        results.add(response);
      } else if (successResponse.content?.schema?.items?.properties.isNotEmpty == true) {
        final itemClassName = '$response\$Item';

        results.add(itemClassName);
      } else if (successResponse.content?.schema?.allOf.isNotEmpty == true &&
          successResponse.content?.schema?.title.isNotEmpty == true) {
        results.add(response);
      }
    }

    return results.where((element) => _isValidModelName(element)).toList();
  }

  bool _isValidModelName(String modelName) {
    if (modelName.isEmpty || kBasicTypes.contains(modelName) || modelName.startsWith('$kMap<')) {
      return false;
    }
    return true;
  }

  Method _getPrivateMethod(Method method) {
    final parameters = method.optionalParameters.map((p) {
      Parameter result = p;

      if (p.type!.symbol!.startsWith('enums.')) {
        if (p.annotations.any((p0) => p0.code.toString().contains('symbol=Body'))) {
          result = result.copyWith(type: Reference('dynamic'));
        } else {
          result = result.copyWith(type: Reference('String?'));
        }
      }

      if (p.annotations.first.code.toString().contains('symbol=Header')) {
        if (p.type?.symbol?.startsWith('List<') == true) {
          result = result.copyWith(type: Reference('Iterable<String>?'));
        }
        result = result.copyWith(type: Reference('String?'));
      }

      if (p.type!.symbol!.startsWith('List')) {
        final listType = p.type!.symbol!.removeListOrStream();

        if (listType.startsWith('enums.')) {
          if (p.annotations.any((p0) => p0.code.toString().contains('symbol=Body'))) {
            result = result.copyWith(type: Reference('dynamic'));
          } else {
            result = result.copyWith(type: Reference('List<Object?>?'));
          }
        }
      }

      return result;
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

  Method _getPublicMethod(Method method, List<String> allModels, bool isDeprecated) {
    final parameters = method.optionalParameters.map((p) => p.copyWith(annotations: []));

    return Method(
      (m) => m
        ..optionalParameters.addAll(parameters)
        ..docs.addAll(method.docs)
        ..name = method.name
        ..returns = method.returns
        ..annotations.addAll([if (isDeprecated) refer('deprecated')])
        ..body = _generatePublicMethodCode(method.optionalParameters, method.name!, allModels),
    );
  }

  Code _generatePublicMethodCode(
    Iterable<Parameter> parameters,
    String publicMethodName,
    List<String> allModels,
  ) {
    final parametersListString = parameters
        .map((p) {
          if (p.type!.symbol!.startsWith('enums.')) {
            return '${p.name} : ${p.name}?.value?.toString()';
          }

          if (p.annotations.firstOrNull?.code.toString().contains('symbol=Header') == true) {
            if (p.type?.symbol?.startsWith('List<') == true) {
              return '${p.name} : ${p.name}?.map((e) => e.toString())';
            }
            return '${p.name} : ${p.name}?.toString()';
          }

          if (p.type!.symbol!.startsWith('List<enums.')) {
            final typeName = p.type!.symbol!;
            final name = typeName.substring(11, typeName.length - 2).camelCase;

            return '${p.name} : ${name}ListToJson(${p.name})';
          }

          return '${p.name} : ${p.name}';
        })
        .join(', ');

    var allModelsString = '';

    allModels.toSet().forEach((model) {
      final validatedName = getValidatedClassName(model);
      allModelsString +=
          'generatedMapping.putIfAbsent($validatedName, () => $validatedName.fromJsonFactory);\n';
    });

    return Code('$allModelsString\nreturn _$publicMethodName($parametersListString);');
  }

  List<Expression> _getMethodAnnotation({
    required String requestType,
    required String path,
    required bool hasOptionalBody,
    required bool isMultipart,
    required bool isUrlencoded,
    required bool isDeprecated,
    required bool includeNullQueryVars,
  }) {
    return [
      if (isDeprecated) refer('deprecated'),
      refer(requestType.toUpperCase()).call([], {
        kPath: literalString(path),
        if (hasOptionalBody && !isUrlencoded) 'optionalBody': refer(true.toString()),
        if (isUrlencoded) 'headers': refer('{contentTypeKey: formEncodedHeaders}'),
        if (includeNullQueryVars) kIncludeNullQueryVars: refer(true.toString()),
      }),
      if (isUrlencoded)
        refer(
          kFactoryConverter.pascalCase,
        ).call([], {'request': refer('FormUrlEncodedConverter.requestFactory')}),
      if (isMultipart) refer(kMultipart.pascalCase).call([], {}),
    ];
  }

  String _getCommentsForMethod({
    required String methodDescription,
    required List<SwaggerRequestParameter> parameters,
    required Map<String, SwaggerRequestParameter> componentsParameters,
  }) {
    final parametersComments = parameters.map(
      (SwaggerRequestParameter parameter) =>
          _createSummaryParameters(parameter, componentsParameters),
    );

    final formattedDescription = methodDescription.split('\n').join('\n///');

    return [
      '///$formattedDescription',
      ...parametersComments,
    ].where((String element) => element.isNotEmpty).join('\n');
  }

  String _createSummaryParameters(
    SwaggerRequestParameter parameter,
    Map<String, SwaggerRequestParameter> componentsParameters,
  ) {
    final neededParameter = componentsParameters[parameter.ref.getUnformattedRef()] ?? parameter;

    if (neededParameter.inParameter == kHeader && options.ignoreHeaders) {
      return '';
    }

    final description = [neededParameter.description, neededParameter.schema?.description]
        .firstWhere((element) => element?.isNotEmpty == true, orElse: () => '')!
        .replaceAll(RegExp(r'\n|\r|\t'), ' ');

    return '///@param ${neededParameter.name} $description';
  }

  Expression _getParameterAnnotation(SwaggerRequestParameter parameter) {
    switch (parameter.inParameter) {
      case kFormData:
        return refer(kField).call([literalString(parameter.name.replaceAll('\$', ''))]);
      case kBody:
        return refer(kBody.pascalCase).call([]);
      default:
        //https://github.com/lejard-h/chopper/issues/295
        return refer(
          parameter.inParameter.pascalCase,
        ).call([literalString(parameter.name.replaceAll('\$', ''))]);
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

    final result = getValidatedClassName('$pathString ${requestType.pascalCase} $parameterName');

    return result.asEnum();
  }

  bool _isEnumRefParameter(SwaggerRequestParameter parameter, SwaggerRoot root) {
    final schemas = root.components?.schemas ?? {};
    schemas.addAll(root.definitions);

    final refs = [
      parameter.schema?.items?.ref.getUnformattedRef(),
      parameter.schema?.ref.getUnformattedRef(),
      parameter.items?.ref.getUnformattedRef(),
    ];
    final schema = schemas[refs.firstWhereOrNull((ref) => ref?.isNotEmpty == true)];

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
    required List<EnumModel> allEnums,
    required Map<String, SwaggerRequestParameter> definedParameters,
  }) {
    final format = parameter.format ?? parameter.schema?.format ?? '';

    if (parameter.items?.enumValues.isNotEmpty == true ||
        parameter.schema?.enumValues.isNotEmpty == true ||
        parameter.enumValues.isNotEmpty) {
      if (definedParameters.containsValue(parameter)) {
        final neededKey =
            definedParameters.entries.firstWhereOrNull((e) => e.value == parameter)?.key ?? '';
        return getValidatedClassName(neededKey).asEnum();
      }

      if (parameter.type == kArray || parameter.schema?.type == kArray) {
        final result = _getEnumParameterTypeName(
          parameterName: parameter.name,
          path: path,
          requestType: requestType,
        );

        return result.asList();
      }

      return _getEnumParameterTypeName(
        parameterName: parameter.name,
        path: path,
        requestType: requestType,
      );
    } else if (parameter.items?.type.isNotEmpty == true) {
      return _mapParameterName(parameter.items!.type, format, modelPostfix).asList();
    } else if (parameter.items?.hasRef == true) {
      if (_isEnumRefParameter(parameter, root)) {
        return parameter.items!.ref.getRef().asEnum();
      }
      return _mapParameterName(parameter.items!.ref.getRef(), format, modelPostfix).asList();
    } else if (parameter.schema?.items?.hasRef == true) {
      if (_isEnumRefParameter(parameter, root)) {
        return parameter.schema!.items!.ref.getRef().asEnum().asList().makeNullable();
      }

      var className = parameter.schema!.items!.ref.getRef();

      if (allEnums.any((e) => e.name == className)) {
        className = 'enums.$className';
      }

      return (className + modelPostfix).asList();
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

      final ref = parameter.schema?.ref;

      if (ref != null) {
        final neededSchema = root.allSchemas[ref.getUnformattedRef()];

        if (neededSchema?.type != 'object' && kBasicTypesMap.containsKey(neededSchema?.type)) {
          return kBasicTypesMap[neededSchema?.type]!;
        }
      }

      return (parameter.schema!.ref.getRef() + modelPostfix);
    } else if (parameter.schema?.type == kArray &&
        parameter.schema?.items?.type.isNotEmpty == true) {
      return _mapParameterName(parameter.schema!.items!.type, format, '').asList();
    } else if (parameter.schema?.anyOf.firstOrNull?.type.isNotEmpty == true) {
      return _mapParameterName(parameter.schema!.anyOf.first.type, format, '');
    }

    if (parameter.type.isNotEmpty) {
      return _mapParameterName(parameter.type, format, modelPostfix);
    }

    if (parameter.schema?.type.isNotEmpty == true) {
      if (parameter.schema?.format == kDateTimeFormat) {
        return kDateTimeType;
      }

      return _mapParameterName(parameter.schema!.type, format, modelPostfix);
    }

    return kObject.pascalCase;
  }

  String _mapParameterName(String name, String format, String modelPostfix) {
    if (name == kString && format == kDateTimeFormat) {
      return kDateTimeType;
    }

    if (name == kArray) {
      return 'List?';
    }

    final result = kBasicTypesMap[name] ?? '';

    if (result.isEmpty) {
      return kDynamic;
    }

    return result;
  }

  List<Parameter> _getAllParameters({
    required SwaggerRequest swaggerRequest,
    required bool ignoreHeaders,
    required String path,
    required String requestType,
    required String modelPostfix,
    required SwaggerRoot root,
    required SwaggerPath swaggerPath,
    required List<EnumModel> allEnums,
  }) {
    final definedParameters = <String, SwaggerRequestParameter>{};
    definedParameters.addAll(root.parameters);
    definedParameters.addAll(root.components?.parameters ?? {});

    final securityParameters =
        swaggerRequest.security.map((e) => root.securityDefinitions[e]).nonNulls;

    final additionalHeaders = options.additionalHeaders.map(
      (e) => SwaggerRequestParameter(inParameter: 'header', name: e, type: 'String'),
    );

    final parameters = [
      ...swaggerRequest.parameters,
      ...swaggerPath.parameters,
      ...securityParameters,
      ...additionalHeaders,
    ].map((par) => definedParameters[par.ref.split('/').last] ?? par).toList();

    final result = parameters
        .where((swaggerParameter) => ignoreHeaders ? swaggerParameter.inParameter != kHeader : true)
        .where((swaggerParameter) => swaggerParameter.inParameter != kCookie)
        .where((swaggerParameter) => swaggerParameter.inParameter.isNotEmpty)
        .map(
          (swaggerParameter) => Parameter(
            (p) => p
              ..name = swaggerParameter.name.asParameterName()
              ..named = true
              ..required =
                  swaggerParameter.isRequired &&
                  _getHeaderDefaultValue(swaggerParameter) == null &&
                  swaggerParameter.inParameter != kHeader
              ..type = Reference(
                _getParameterTypeName(
                  parameter: swaggerParameter,
                  path: path,
                  requestType: requestType,
                  definedParameters: definedParameters,
                  modelPostfix: modelPostfix,
                  allEnums: allEnums,
                  root: root,
                ).makeNullable(),
              )
              ..named = true
              ..annotations.add(_getParameterAnnotation(swaggerParameter))
              ..defaultTo = _getHeaderDefaultValue(swaggerParameter),
          ),
        )
        .toList();

    final requestBody = swaggerRequest.requestBody;

    if (requestBody != null) {
      // MULTIPART REQUESTS
      if (requestBody.content?.isMultipart == true) {
        var schema = requestBody.content?.schema;

        if (schema?.ref.isNotEmpty == true) {
          schema = root.allSchemas[schema?.ref.getUnformattedRef()];
        }

        // in case a scheme for the request is defined, we use only one param const kBody and the type of this param will be the scheme as class.
        if (requestBody.content?.schema?.ref.isNotEmpty == true) {
          result.add(
            Parameter(
              (p) => p
                ..name = kBody
                ..named = true
                ..required = true
                ..type = Reference(getValidatedClassName(requestBody.content!.schema!.ref.getRef()))
                ..named = true
                ..annotations.add(refer(kPart.pascalCase).call([])),
            ),
          );

          // early return
          return result.distinctParameters();
        }

        if (schema?.properties.isEmpty == true) {
          result.add(
            Parameter(
              (p) => p
                ..name = 'file'
                ..named = true
                ..required = true
                ..type = Reference(options.multipartFileType)
                ..named = true
                ..annotations.add(refer(kPartFile.pascalCase).call([])),
            ),
          );
        }

        // otherwise no request scheme is defined, we provide every param as a separate param.
        schema?.properties.forEach((key, value) {
          isBinary(SwaggerSchema? value) =>
              (value?.type == 'string' && value?.format == 'binary') || value?.type == 'file';
          if ((isBinary(value) || value.type == 'array' && isBinary(value.items))) {
            final isRequired = value.type == 'array' || schema!.required.contains(key);
            String typeRef = isRequired
                ? options.multipartFileType
                : options.multipartFileType.makeNullable();

            if (value.type == 'array') {
              typeRef = 'List<$typeRef>';
            }

            result.add(
              Parameter(
                (p) => p
                  ..name = key
                  ..named = true
                  ..required = isRequired
                  ..type = Reference(typeRef)
                  ..annotations.add(refer(kPartFile.pascalCase).call([])),
              ),
            );
          } else {
            final typeName = _mapParameterName(value.type, value.format, modelPostfix);

            result.add(
              Parameter(
                (p) => p
                  ..name = SwaggerModelsGenerator.getValidatedParameterName(key)
                  ..named = true
                  ..required = schema!.required.contains(key)
                  ..type = Reference(typeName.makeNullable())
                  ..named = true
                  ..annotations.add(refer(kPart.pascalCase).call([literalString(key)])),
              ),
            );
          }
        });

        return result.distinctParameters();
      }

      // URLENCODED REQUESTS
      if (requestBody.content?.isUrlencoded == true) {
        var schema = requestBody.content?.schema;

        if (schema?.ref.isNotEmpty == true) {
          schema = root.allSchemas[schema?.ref.getUnformattedRef()];
        }

        // in case a scheme for the request is defined, we use only one param const kBody and the type of this param will be the scheme as class.
        result.add(
          Parameter(
            (p) => p
              ..name = kBody
              ..named = true
              ..required = true
              ..type = Reference(options.urlencodedFileType)
              ..named = true
              ..annotations.add(refer(kBody.pascalCase).call([])),
          ),
        );

        // early return
        return result.distinctParameters();
      }

      // OTHER REQUESTS EXCEPT MULTIPART
      var typeName = '';

      if (requestBody.hasRef) {
        final ref = requestBody.ref;
        typeName = ref.getRef();

        if (root.components?.requestBodies.containsKey(ref.getUnformattedRef()) == true) {
          typeName = getValidatedClassName('${ref.getUnformattedRef()}\$RequestBody');
        }

        final requestBodyRef = root.components?.requestBodies[ref.getRef()]?.ref ?? '';

        if (requestBodyRef.isNotEmpty) {
          typeName = requestBodyRef.getRef();
        }

        typeName = getValidatedClassName(typeName);
      }

      final schema = requestBody.content?.schema;

      if (schema != null) {
        if (schema.oneOf.length == 1) {
          final oneOfRef = schema.oneOf.first.ref.getUnformattedRef();
          typeName = getValidatedClassName(oneOfRef);
        } else if (schema.format == kBinary || schema.oneOf.isNotEmpty) {
          typeName = kObject.pascalCase;
        } else if (schema.items?.type.isNotEmpty == true) {
          typeName = _mapParameterName(
            schema.items!.type,
            schema.items!.format,
            options.modelPostfix,
          ).asList();
        } else if (schema.allOf.length == 1 && schema.allOf.first.ref.isNotEmpty) {
          typeName = getValidatedClassName(schema.allOf.first.ref.getRef());
        } else {
          typeName = _getRequestBodyTypeName(
            schema: schema,
            modelPostfix: options.modelPostfix,
            root: root,
            requestPath: path + requestType.pascalCase,
          );
        }
      }

      result.add(
        Parameter(
          (p) => p
            ..name = kBody
            ..named = true
            ..required = true
            ..type = Reference((typeName.isNotEmpty ? typeName : kObject.pascalCase).makeNullable())
            ..named = true
            ..annotations.add(refer(kBody.pascalCase).call([])),
        ),
      );
    }

    return result.distinctParameters();
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

    final neededSchemaKey = schemas.keys.firstWhereOrNull((key) => key.getRef() == ref.getRef());

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
        if (schema.properties.isNotEmpty) {
          return getValidatedClassName('$requestPath\$$kRequestBody');
        }

        return kObject.pascalCase;
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

      return getValidatedClassName(schema.ref.getRef().withPostfix(modelPostfix));
    }

    return '';
  }

  Code? _getHeaderDefaultValue(SwaggerRequestParameter swaggerParameter) {
    final overridenValue = options.defaultHeaderValuesMap.firstWhereOrNull(
      (map) => map.headerName.toLowerCase() == swaggerParameter.name.toLowerCase(),
    );

    if (overridenValue != null) {
      return Code('\'${overridenValue.defaultValue}\'');
    }

    return null;
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

  static List<SwaggerResponse> getSuccessedResponses({
    required Map<String, SwaggerResponse> responses,
  }) {
    return responses.entries
        .where((responseEntry) {
          final code = int.tryParse(responseEntry.key) ?? 0;

          return code ~/ 100 == 2 || successDescriptions.contains(responseEntry.value.description);
        })
        .map((e) => e.value)
        .toList();
  }

  String _getResponseModelName({
    required String path,
    required String methodName,
    required String modelPostfix,
  }) {
    return '${methodName.pascalCase}\$$kResponse$modelPostfix';
  }

  String? _getReturnTypeFromType(SwaggerResponse swaggerResponse, String modelPostfix) {
    final responseType = swaggerResponse.schema?.type ?? '';
    if (responseType.isEmpty) {
      return null;
    }

    if (responseType == kArray) {
      final itemsOriginalRef = swaggerResponse.schema?.items?.originalRef;
      final itemsType = swaggerResponse.schema?.items?.type;
      final itemsRef = swaggerResponse.schema?.items?.ref.getRef();

      final arrayType = [
        itemsRef,
        itemsOriginalRef,
        itemsType,
        kObject,
      ].firstWhere((element) => element?.isNotEmpty == true)!;

      final mappedArrayType = kBasicTypesMap[arrayType];

      if (mappedArrayType == null) {
        return null;
      }

      return _mapParameterName(mappedArrayType, '', modelPostfix).asList();
    }

    return kBasicTypesMap[responseType] ?? responseType + modelPostfix;
  }

  String? _getReturnTypeFromSchema(
    SwaggerResponse swaggerResponse,
    String modelPostfix,
    SwaggerRoot root,
  ) {
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

      if (neededResponse.oneOf.isNotEmpty) {
        return kObject.pascalCase;
      }

      if (ref.contains('/responses/')) {
        return getValidatedClassName('${ref.getRef()}\$$kResponse$modelPostfix');
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

  String? _getReturnTypeFromOriginalRef(SwaggerResponse swaggerResponse, String modelPostfix) {
    if (swaggerResponse.schema?.hasOriginalRef == true) {
      return swaggerResponse.schema!.originalRef + modelPostfix;
    }

    return null;
  }

  String? _getReturnTypeFromContent({
    required SwaggerResponse swaggerResponse,
    required String modelPostfix,
    required SwaggerRoot swaggerRoot,
    required String requestName,
    required String path,
    required String method,
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

    final contentSchema = content.schema;

    if (contentSchema != null &&
        contentSchema.allOf.isNotEmpty == true &&
        contentSchema.title.isNotEmpty) {
      return contentSchema.title;
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

      var typeName = getValidatedClassName(schemaRef.getRef()).withPostfix(modelPostfix);

      if (neededSchema.isNullable == true) {
        typeName = typeName.makeNullable();
      }

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
      final result = getValidatedClassName(
        schemaItemsRef.getRef(),
      ).withPostfix(modelPostfix).asList();

      return result;
    }

    if (content.schema?.type == kArray) {
      final itemsType = content.schema?.items?.type ?? '';
      final itemsFormat = content.schema?.items?.format ?? '';

      if (itemsType == kArray && content.schema?.items?.items?.ref != null) {
        final itemsItemsType =
            content.schema?.items?.items?.ref.getRef() ??
            content.schema?.items?.items?.type ??
            kObject;

        return itemsItemsType.asList().asList();
      } else if (content.schema?.items?.properties.isNotEmpty == true) {
        final requestText = requestName.pascalCase;

        final typeName = getValidatedClassName('$requestText\$Response');

        return typeName;
      } else if (itemsType.isNotEmpty) {
        final parameterType = _mapParameterName(itemsType, itemsFormat, '');
        return parameterType.asList();
      }
    }

    final contentSchemaType = content.schema?.type ?? '';
    if (contentSchemaType.isNotEmpty == true) {
      if (contentSchemaType == 'string' && content.schema?.format == kDateTimeFormat) {
        return kDateTimeType;
      }

      if (content.schema?.properties.isNotEmpty == true) {
        final pathText = path.split('/').map((e) => e.pascalCase).join();
        final requestText = method.pascalCase;

        return getValidatedClassName('$pathText$requestText\$Response');
      }

      return kBasicTypesMap[contentSchemaType];
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
    required SwaggerRoot swaggerRoot,
    required String method,
  }) {
    if (overridenResponses.containsKey(path)) {
      return overridenResponses[path]!.overriddenValue;
    }

    final neededResponses = getSuccessedResponses(responses: responses);

    if (neededResponses.isEmpty) {
      return '';
    }

    if (neededResponses.length > 1 && !options.generateFirstSucceedResponse) {
      return '';
    }

    final neededResponse = neededResponses.first;

    if (neededResponse.schema?.type == kObject &&
        neededResponse.schema?.properties.isNotEmpty == true) {
      return _getResponseModelName(path: path, methodName: methodName, modelPostfix: modelPostfix);
    }

    final type =
        _getReturnTypeFromType(neededResponse, modelPostfix) ??
        _getReturnTypeFromSchema(neededResponse, modelPostfix, swaggerRoot) ??
        _getReturnTypeFromOriginalRef(neededResponse, modelPostfix) ??
        _getReturnTypeFromContent(
          swaggerResponse: neededResponse,
          modelPostfix: modelPostfix,
          swaggerRoot: swaggerRoot,
          requestName: methodName,
          path: path,
          method: method,
        ) ??
        '';

    if (type.isNotEmpty) {
      return type;
    }

    return '';
  }

  String getChopperClientContent(String className, String host, String basePath) {
    final baseUrlString = options.withBaseUrl
        ? "baseUrl:  baseUrl ?? Uri.parse('http://$host$basePath')"
        : 'baseUrl: baseUrl';

    final converterString = options.withConverter
        ? 'converter: converter ?? \$JsonSerializableConverter(),'
        : 'converter: converter ?? chopper.JsonConverter(),';

    final chopperClientBody =
        '''
    if(client!=null){
      return _\$$className(client);
    }

    final newClient = ChopperClient(
      services: [_\$$className()],
      $converterString
      interceptors: interceptors ?? [],
      client: httpClient,
      authenticator: authenticator,
      errorConverter: errorConverter,
      $baseUrlString);
    return _\$$className(newClient);
''';
    return chopperClientBody;
  }

  Code _getDefaultMetaDataValue(SwaggerRequest swaggerRequest) {
    final tagsString = swaggerRequest.tags.map((tag) => '"$tag"').join(', ');
    final tagsList = tagsString.isNotEmpty ? '[$tagsString]' : '[]';
    final description = formatMethodDescription(swaggerRequest.description);
    final summary = formatMethodDescription(swaggerRequest.summary);

    return Code('''
const $kSwaggerMetaData(
  ${description.isNotEmpty ? 'description: $description,' : ''}
  ${summary.isNotEmpty ? 'summary: $summary,' : ''}
  operationId: '${swaggerRequest.operationId}',
  consumes: ${swaggerRequest.consumes.map((c) => '"$c"').join(', ').isEmpty ? '[]' : '[${swaggerRequest.consumes.map((c) => '"$c"').join(', ')}]'},
  produces: ${swaggerRequest.produces.map((p) => '"$p"').join(', ').isEmpty ? '[]' : '[${swaggerRequest.produces.map((p) => '"$p"').join(', ')}]'},
  security: ${swaggerRequest.security.map((s) => '"$s"').join(', ').isEmpty ? '[]' : '[${swaggerRequest.security.map((s) => '"$s"').join(', ')}]'},
  tags: $tagsList,
  deprecated: ${swaggerRequest.deprecated},
)''');
  }
}

extension on SwaggerRequestParameter {
  String get anyRef => schema?.ref ?? items?.ref ?? schema?.items?.ref ?? ref;
}

extension SwaggerRootExtension on SwaggerRoot {
  Map<String, SwaggerSchema> get allSchemas => {
    ...definitions,
    ...components?.schemas ?? {},
    ...components?.responses ?? {},
    ...components?.requestBodies ?? {},
  };
}

extension on SwaggerResponse {
  String get anyRef {
    final allRefs = [
      content?.ref,
      content?.schema?.ref,
      content?.schema?.items?.ref,
      schema?.ref,
      schema?.items?.ref,
      ref,
    ];

    return allRefs.firstWhereOrNull((element) => element?.isNotEmpty == true) ?? '';
  }
}

String formatMethodDescription(String desc) {
  final formattedDesc = desc.replaceAll("'", "\\'");

  if (formattedDesc.contains('\n')) {
    return "'''$formattedDesc'''";
  }

  return "'$formattedDesc'";
}
