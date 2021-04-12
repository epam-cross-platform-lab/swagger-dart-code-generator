import 'dart:convert';

import 'package:swagger_dart_code_generator/src/models/generator_options.dart';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_models_generator.dart';
import 'package:swagger_dart_code_generator/src/extensions/string_extension.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/requests/swagger_request.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/requests/swagger_request_parameter.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/responses/swagger_response.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/swagger_path.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/swagger_root.dart';
import 'package:recase/recase.dart';
import 'package:swagger_dart_code_generator/src/exception_words.dart';

abstract class SwaggerRequestsGenerator {
  static const String defaultBodyParameter = 'Object';
  static const String requestTypeOptions = 'options';
  static final List<String> successResponseCodes = [
    '200',
    '201',
  ];
  static final List<String> successDescriptions = [
    'Success',
    'OK',
    'default response'
  ];

  String generate(
      String code, String className, String fileName, GeneratorOptions options);

  String generateFileContent(String classContent, String chopperClientContent,
      String allMethodsContent) {
    final result = '''
$classContent
{
$chopperClientContent
$allMethodsContent
}''';

    return result;
  }

  String getFileContent(
    SwaggerRoot swaggerRoot,
    String dartCode,
    String className,
    String fileName,
    GeneratorOptions options,
    bool hasModels,
    List<String> allEnumNames,
    List<String> dynamicResponses,
    Map<String, String> basicTypesMap,
  ) {
    final classContent =
        getRequestClassContent(swaggerRoot.host, className, fileName, options);
    final chopperClientContent = getChopperClientContent(
        className, swaggerRoot.host, swaggerRoot.basePath, options, hasModels);
    final allMethodsContent = getAllMethodsContent(
      swaggerRoot,
      dartCode,
      options,
      allEnumNames,
      dynamicResponses,
      basicTypesMap,
    );
    final result = generateFileContent(
        classContent, chopperClientContent, allMethodsContent);

    return result;
  }

  static List<String> getAllDynamicResponses(String dartCode) {
    final dynamic map = jsonDecode(dartCode);

    final components = map['components'] as Map<String, dynamic>;
    final responses = components == null
        ? null
        : components['responses'] as Map<String, dynamic>;

    if (responses == null) {
      return [];
    }

    var results = <String>[];

    responses.keys.forEach((key) {
      final response = responses[key] as Map<String, dynamic>;

      final content =
          response == null ? null : response['content'] as Map<String, dynamic>;

      if (content != null && content.entries.length > 1) {
        results.add(key.capitalize);
      }
    });

    return results;
  }

  String getAllMethodsContent(
    SwaggerRoot swaggerRoot,
    String dartCode,
    GeneratorOptions options,
    List<String> allEnumNames,
    List<String> dynamicResponses,
    Map<String, String> basicTypesMap,
  ) {
    final methods = StringBuffer();

    final dynamic map = dartCode.isNotEmpty ? jsonDecode(dartCode) : {};
    final components = map['components'] as Map<String, dynamic>;
    final requestBodies =
        components == null ? null : components['requestBodies'];

    swaggerRoot.paths.forEach((SwaggerPath swaggerPath) {
      swaggerPath.requests
          .where((SwaggerRequest swaggerRequest) =>
              swaggerRequest.type.toLowerCase() != requestTypeOptions)
          .forEach((SwaggerRequest swaggerRequest) {
        swaggerRequest.parameters = swaggerRequest.parameters
            .where((element) => element?.inParameter != null)
            .toList();

        final hasFormData = swaggerRequest.parameters.any(
            (SwaggerRequestParameter swaggerRequestParameter) =>
                swaggerRequestParameter.inParameter == 'formData');

        String methodName;
        if (options.usePathForRequestNames ||
            swaggerRequest.operationId == null) {
          methodName = SwaggerModelsGenerator.generateRequestName(
              swaggerPath.path, swaggerRequest.type);
        } else {
          methodName = swaggerRequest.operationId;
        }

        if (swaggerRequest.requestBody?.content != null &&
            swaggerRequest.parameters
                .every((parameter) => parameter.inParameter != 'body')) {
          final additionalParameter = swaggerRequest.requestBody?.content;
          swaggerRequest.parameters.add(SwaggerRequestParameter(
              inParameter: 'body',
              name: 'body',
              isRequired: true,
              type: _getBodyParameterType(additionalParameter),
              ref: additionalParameter.ref ?? additionalParameter.items?.ref));
        }

        final requestBody = swaggerRequest.requestBody?.ref;
        if (requestBody != null) {
          var requestBodyType = requestBody.split('/').last;

          final bodySchema =
              requestBodies == null ? null : requestBodies[requestBodyType];

          if (bodySchema != null) {
            final content = bodySchema['content'] as Map;
            final firstContent =
                content == null ? null : content[content.keys.first];
            final schema = firstContent['schema'] as Map;
            if (schema.containsKey('\$ref')) {
              requestBodyType = schema['\$ref'].split('/').last.toString();
            }
          }

          swaggerRequest.parameters.add(SwaggerRequestParameter(
              inParameter: 'body',
              name: 'body',
              isRequired: true,
              type: requestBodyType.capitalize));
        }

        if (swaggerRequest.parameters
                .every((parameter) => parameter.inParameter != 'body') &&
            swaggerRequest.type.toLowerCase() == 'post') {
          swaggerRequest.parameters.add(SwaggerRequestParameter(
              inParameter: 'body', name: 'body', isRequired: true));
        }

        final allParametersContent = getAllParametersContent(
          listParameters: swaggerRequest.parameters,
          ignoreHeaders: options.ignoreHeaders,
          path: swaggerPath.path,
          allEnumNames: allEnumNames,
          requestType: swaggerRequest.type,
          useRequiredAttribute: options.useRequiredAttributeForHeaders,
        );

        final hasEnums = swaggerRequest.parameters.any((parameter) =>
            parameter.items?.enumValues != null ||
            parameter.item?.enumValues != null ||
            parameter.schema?.enumValues != null ||
            allEnumNames.contains(
                'enums.${parameter.ref?.split("/")?.last?.pascalCase}'));

        final enumInBodyName = swaggerRequest.parameters.firstWhere(
            (parameter) =>
                parameter.inParameter == 'body' &&
                (parameter.items?.enumValues != null ||
                    parameter.item?.enumValues != null ||
                    parameter.schema?.enumValues != null),
            orElse: () => null);

        final parameterCommentsForMethod =
            getParameterCommentsForMethod(swaggerRequest.parameters, options);

        final returnTypeName = getReturnTypeName(
            swaggerRequest.responses,
            swaggerPath.path,
            swaggerRequest.type,
            options.responseOverrideValueMap,
            dynamicResponses,
            basicTypesMap);

        final generatedMethod = getMethodContent(
            summary: swaggerRequest.summary,
            typeRequest: swaggerRequest.type,
            methodName: methodName,
            parametersContent: allParametersContent,
            parametersComments: parameterCommentsForMethod,
            requestPath: swaggerPath.path,
            hasFormData: hasFormData,
            returnType: returnTypeName,
            hasEnums: hasEnums,
            enumInBodyName: enumInBodyName?.name,
            ignoreHeaders: options.ignoreHeaders,
            allEnumNames: allEnumNames,
            parameters: swaggerRequest.parameters);

        methods.writeln(generatedMethod);
      });
    });

    return methods.toString();
  }

  String _getBodyParameterType(RequestContent content) {
    if (content == null) {
      return 'Object';
    }

    if (content.type?.toLowerCase() == 'array') {
      if (content.items.ref == null) {
        return 'Object';
      }

      final type = content.items.ref.split('/').last.capitalize;

      return 'List<$type>';
    }

    return content.type;
  }

  String getParameterCommentsForMethod(
          List<SwaggerRequestParameter> listParameters,
          GeneratorOptions options) =>
      listParameters
          .map((SwaggerRequestParameter parameter) => createSummaryParameters(
              parameter.name,
              parameter.description,
              parameter.inParameter,
              options))
          .where((String element) => element.isNotEmpty)
          .join('\n');

  String createSummaryParameters(
      String parameterName,
      String parameterDescription,
      String inParameter,
      GeneratorOptions options) {
    if (inParameter == 'header' && options.ignoreHeaders) {
      return '';
    }
    if (parameterDescription != null) {
      parameterDescription =
          parameterDescription.replaceAll(RegExp(r'\n|\r|\t'), ' ');
    } else {
      parameterDescription = '';
    }

    final comments = '''\t///@param $parameterName $parameterDescription''';
    return comments;
  }

  String abbreviationToCamelCase(String word) {
    var isLastLetterUpper = false;
    final result = word.split('').map((String e) {
      if (e.isUpper && !isLastLetterUpper) {
        isLastLetterUpper = true;
        return e;
      }

      isLastLetterUpper = e.isUpper;
      return e.toLowerCase();
    }).join();

    return result;
  }

  String generatePublicMethod(
      String methodName,
      String returnTypeString,
      String parametersPart,
      String requestType,
      String requestPath,
      bool ignoreHeaders,
      List<SwaggerRequestParameter> parameters,
      List<String> allEnumNames) {
    final filteredParameters = parameters
        .where((parameter) =>
            ignoreHeaders ? parameter.inParameter != 'header' : true)
        .toList();

    final enumParametersNames = parameters
        .where((parameter) => (parameter.items?.enumValues != null ||
            parameter.item?.enumValues != null ||
            parameter.schema?.enumValues != null ||
            allEnumNames.contains(
                'enums.${parameter.ref?.split("/")?.last?.pascalCase}')))
        .map((e) => e.name)
        .toList();

    final newParametersPart = parametersPart
        .replaceAll(RegExp(r'@\w+\(\)'), '')
        .replaceAll(RegExp(r"@\w+\(\'\w+\'\)"), '')
        .trim();

    final result =
        '''\tFuture<Response$returnTypeString> ${abbreviationToCamelCase(methodName.camelCase)}($newParametersPart){
          return _${methodName.camelCase}(${filteredParameters.map((e) => "${validateParameterName(e.name)} : ${enumParametersNames.contains(e.name) ? getEnumParameter(requestPath, requestType, e.name, filteredParameters, e.ref) : validateParameterName(e.name)}").join(', ')});
          }'''
            .replaceAll('@required', '');

    return result;
  }

  String getEnumParameter(String requestPath, String requestType,
      String parameterName, List<SwaggerRequestParameter> parameters,
      [String ref]) {
    final enumListParametersNames = parameters
        .where((parameter) =>
            parameter.type == 'array' &&
            (parameter.items?.enumValues != null ||
                parameter.item?.enumValues != null ||
                parameter.schema?.enumValues != null))
        .map((e) => e.name)
        .toList();

    final mapName = getMapName(requestPath, requestType, parameterName, ref);

    if (enumListParametersNames.contains(parameterName)) {
      return '$parameterName!.map((element) {$mapName[element];}).toList()';
    }

    return '$mapName[$parameterName]';
  }

  String validateParameterName(String parameterName) {
    if (parameterName == null) {
      return parameterName;
    }

    parameterName = parameterName.replaceAll(',', '');

    var name = <String>[];
    exceptionWords.forEach((String element) {
      if (parameterName == element) {
        final result = '\$' + parameterName;
        name.add(result);
      }
    });
    if (name.isEmpty) {
      name =
          parameterName.split('-').map((String str) => str.capitalize).toList();
      name[0] = name[0].lower;
    }

    return name.join();
  }

  String getMethodContent(
      {String summary,
      String typeRequest,
      String methodName,
      String parametersContent,
      String parametersComments,
      String requestPath,
      bool hasFormData,
      String returnType,
      bool hasEnums,
      String enumInBodyName,
      bool ignoreHeaders,
      List<SwaggerRequestParameter> parameters,
      List<String> allEnumNames}) {
    var typeReq = typeRequest.capitalize + "(path: '$requestPath')";
    if (hasFormData) {
      typeReq +=
          '\n  @FactoryConverter(request: FormUrlEncodedConverter.requestFactory)';
    }

    if (returnType != null && returnType != 'num') {
      returnType = returnType.pascalCase;
    }

    final returnTypeString = returnType != null ? '<$returnType>' : '';
    var parametersPart =
        parametersContent.isEmpty ? '' : '{$parametersContent}';

    if (summary != null) {
      summary = summary.replaceAll(RegExp(r'\n|\r|\t'), ' ');
    }

    methodName = abbreviationToCamelCase(methodName.camelCase);
    var publicMethod = '';

    if (hasEnums) {
      publicMethod = generatePublicMethod(
              methodName,
              returnTypeString,
              parametersPart,
              typeRequest,
              requestPath,
              ignoreHeaders,
              parameters,
              allEnumNames)
          .trim();

      allEnumNames.forEach((element) {
        parametersPart = parametersPart.replaceFirst('$element? ', 'String? ');
        parametersPart = parametersPart.replaceFirst('$element>?', 'String?>?');
      });

      parametersPart = parametersPart
          .replaceAll('enums.', '')
          .replaceAll('List<enums.', 'List<');

      methodName = '_$methodName';
    }

    final generatedMethod = """
\t///$summary  ${parametersComments.isNotEmpty ? """\n$parametersComments""" : ''}
\t$publicMethod

\t@$typeReq
\tFuture<chopper.Response$returnTypeString> $methodName($parametersPart);
""";

    return generatedMethod;
  }

  String validateParameterType(String parameterName) {
    var isEnum = false;

    if (parameterName == null) {
      return parameterName;
    }

    if (parameterName.startsWith('enums.')) {
      isEnum = true;
      parameterName = parameterName.replaceFirst('enums.', '');
    }

    final result = parameterName
        .split('-')
        .map((String str) => str.capitalize)
        .toList()
        .join();

    if (isEnum) {
      return 'enums.$result';
    } else {
      return result;
    }
  }

  String getParameterTypeName(String parameter, [String itemsType]) {
    switch (parameter) {
      case 'integer':
      case 'int':
        return 'int';
      case 'boolean':
        return 'bool';
      case 'string':
        return 'String';
      case 'array':
        return 'List<${getParameterTypeName(itemsType)}>';
      case 'file':
        return 'List<int>';
      case 'number':
        return 'num';
      case 'object':
        return 'Object';
      default:
        return validateParameterType(parameter) ?? 'dynamic';
    }
  }

  String getBodyParameter(SwaggerRequestParameter parameter, String path,
      String requestType, List<String> allEnumNames) {
    String parameterType;
    if (parameter.type != null) {
      parameterType = parameter.type;
    } else if (parameter.schema?.enumValues != null) {
      parameterType =
          'enums.${SwaggerModelsGenerator.generateRequestEnumName(path, requestType, parameter.name)}';
    } else if (parameter.schema?.originalRef != null) {
      parameterType = SwaggerModelsGenerator.getValidatedClassName(
          parameter.schema.originalRef.toString());
    } else if (parameter.ref != null) {
      parameterType = parameter.ref.split('/').last;
      parameterType = parameterType.split('_').map((e) => e.capitalize).join();

      if (allEnumNames.contains('enums.$parameterType')) {
        parameterType = 'enums.$parameterType';
      }

      if (parameter.type == 'array') {
        parameterType = 'List<$parameterType>';
      }
    } else if (parameter.schema?.ref != null) {
      parameterType = parameter.schema.ref.split('/').last;
    } else {
      parameterType = defaultBodyParameter;
    }

    parameterType = validateParameterType(parameterType);

    return "@${parameter.inParameter.capitalize}() ${parameter.isRequired ? "@required" : ""} $parameterType? ${validateParameterName(parameter.name)}";
  }

  String getDefaultParameter(
      SwaggerRequestParameter parameter, String path, String requestType) {
    String parameterType;
    if (parameter.schema?.enumValues != null) {
      parameterType =
          'enums.${SwaggerModelsGenerator.generateRequestEnumName(path, requestType, parameter.name)}';
    } else if (parameter.items?.enumValues != null) {
      final typeName =
          'enums.${SwaggerModelsGenerator.generateRequestEnumName(path, requestType, parameter.name)}';
      parameterType = 'List<$typeName>';
    } else {
      parameterType = getParameterTypeName(
          parameter.type ?? parameter.schema?.type, parameter.items?.type);
    }

    return "@${parameter.inParameter.capitalize}('${parameter.name}') ${parameter.isRequired ? "@required" : ""} $parameterType? ${validateParameterName(parameter.name)}";
  }

  String getParameterContent(
      {SwaggerRequestParameter parameter,
      bool ignoreHeaders,
      String requestType,
      String path,
      List<String> allEnumNames,
      bool useRequiredAttribute}) {
    final parameterType = validateParameterType(parameter.name);
    switch (parameter.inParameter) {
      case 'body':
        return getBodyParameter(parameter, path, requestType, allEnumNames);
      case 'formData':
        final isEnum = parameter.schema?.enumValues != null;

        return "@Field('${parameter.name}') ${parameter.isRequired ? "@required" : ""} ${isEnum ? 'enums.$parameterType' : getParameterTypeName(parameter.type)}? ${validateParameterName(parameter.name)}";
      case 'header':
        final needRequiredAttribute =
            parameter.isRequired && useRequiredAttribute;
        return ignoreHeaders
            ? ''
            : "@${parameter.inParameter.capitalize}('${parameter.name}') ${needRequiredAttribute ? "@required" : ""} String ${validateParameterName(parameter.name)}";
      case 'cookie':
        return '';
      default:
        return getDefaultParameter(parameter, path, requestType);
    }
  }

  String getChopperClientContent(String fileName, String host, String basePath,
      GeneratorOptions options, bool hadModels) {
    final baseUrlString = options.withBaseUrl
        ? "baseUrl:  'https://$host${basePath ?? ''}'"
        : '/*baseUrl: YOUR_BASE_URL*/';

    final converterString =
        options.withBaseUrl && options.withConverter && hadModels
            ? 'converter: JsonSerializableConverter(),'
            : 'converter: chopper.JsonConverter(),';

    final generatedChopperClient = '''
  static $fileName create([ChopperClient? client]) {
    if(client!=null){
      return _\$$fileName(client);
    }

    final newClient = ChopperClient(
      services: [_\$$fileName()],
      $converterString
      $baseUrlString);
    return _\$$fileName(newClient);
  }

''';
    return generatedChopperClient;
  }

  String getRequestClassContent(String host, String className, String fileName,
      GeneratorOptions options) {
    final classWithoutChopper = '''
@ChopperApi()
abstract class $className extends ChopperService''';

    return classWithoutChopper;
  }

  String getAllParametersContent(
      {List<SwaggerRequestParameter> listParameters,
      bool ignoreHeaders,
      String path,
      String requestType,
      List<String> allEnumNames,
      bool useRequiredAttribute}) {
    return listParameters
        .map((SwaggerRequestParameter parameter) => getParameterContent(
              parameter: parameter,
              ignoreHeaders: ignoreHeaders,
              path: path,
              allEnumNames: allEnumNames,
              requestType: requestType,
              useRequiredAttribute: useRequiredAttribute,
            ))
        .where((String element) => element.isNotEmpty)
        .join(', ');
  }

  SwaggerResponse getSuccessedResponse(List<SwaggerResponse> responses) {
    return responses.firstWhere(
        (SwaggerResponse response) =>
            successDescriptions.contains(response.description) ||
            successResponseCodes.contains(response.code),
        orElse: () => null);
  }

  String getReturnTypeName(
      List<SwaggerResponse> responses,
      String url,
      String methodName,
      List<ResponseOverrideValueMap> overriddenRequests,
      List<String> dynamicResponses,
      Map<String, String> basicTypesMap) {
    if (overriddenRequests
            ?.any((ResponseOverrideValueMap element) => element.url == url) ==
        true) {
      final overriddenResponse = overriddenRequests
          .firstWhere((ResponseOverrideValueMap element) => element.url == url);

      if (overriddenResponse.method == methodName) {
        return overriddenResponse.overriddenValue;
      }
    }

    final neededResponse = getSuccessedResponse(responses);

    if (neededResponse == null) {
      return null;
    }

    if (neededResponse.schema?.type != null) {
      return getParameterTypeName(
          neededResponse.schema.type,
          neededResponse.schema?.items?.originalRef ??
              neededResponse.schema?.items?.type ??
              neededResponse.schema.items?.ref?.split('/')?.last);
    }

    if (neededResponse.schema?.ref != null) {
      return neededResponse.schema?.ref?.split('/')?.last;
    }

    if (neededResponse.ref != null) {
      final ref = neededResponse.ref.split('/').last.capitalize;

      if (neededResponse.ref.contains('/responses') &&
          dynamicResponses.contains(ref)) {
        return 'object';
      } else {
        return ref;
      }
    }

    if (neededResponse.schema?.originalRef != null) {
      return neededResponse.schema.originalRef;
    }

    if (neededResponse.content?.isNotEmpty == true &&
        neededResponse.content != null) {
      if (neededResponse.content.first.ref != null) {
        final type = neededResponse.content.first.ref.split('/').last;

        if (basicTypesMap.containsKey(type.toString())) {
          return basicTypesMap[type];
        }
        return type;
      }
      if (neededResponse.content.first.responseType?.isNotEmpty == true) {
        return getParameterTypeName(
            neededResponse.content.first.responseType,
            neededResponse.schema?.items?.originalRef ??
                neededResponse.content?.first?.items?.ref?.split('/')?.last);
      }
    }

    return null;
  }

  String getMapName(
      String path, String requestType, String parameterName, String ref) {
    final enumName = ref?.split('/')?.last?.pascalCase ??
        SwaggerModelsGenerator.generateRequestEnumName(
            path, requestType, parameterName);

    return 'enums.\$${enumName}Map';
  }
}
