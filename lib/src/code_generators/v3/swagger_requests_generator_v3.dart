import 'dart:convert';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_models_generator.dart';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_requests_generator.dart';
import 'package:swagger_dart_code_generator/src/extensions/string_extension.dart';
import 'package:swagger_dart_code_generator/src/models/generator_options.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/requests/swagger_request.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/requests/swagger_request_parameter.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/responses/swagger_response.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/swagger_path.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/swagger_root.dart';
import 'package:recase/recase.dart';
import 'package:meta/meta.dart';
import 'package:swagger_dart_code_generator/src/exception_words.dart';

class SwaggerRequestsGeneratorV3 extends SwaggerRequestsGenerator {
  List<String> successDescriptions = <String>[
    'Success',
    'OK',
    'default response'
  ];
  static const String requestTypeOptions = 'options';
  static const String defaultMethodName = 'unnamedMethod';
  static const String successResponseCode = '200';
  int _unnamedMethodsCounter = 0;

  @override
  String generate(String code, String className, String fileName,
      GeneratorOptions options) {
    _unnamedMethodsCounter = 0;
    final map = jsonDecode(code) as Map<String, dynamic>;
    final swaggerRoot = SwaggerRoot.fromJson(map);

    //Link defined parameters with requests
    swaggerRoot.paths.forEach((SwaggerPath swaggerPath) {
      swaggerPath.requests.forEach((SwaggerRequest swaggerRequest) {
        swaggerRequest.parameters = swaggerRequest.parameters
            .map((SwaggerRequestParameter parameter) =>
                getNeededRequestParameter(
                    parameter, swaggerRoot.components?.parameters))
            .toList();
      });
    });

    final components = map['components'] as Map<String, dynamic>;
    final schemes = components != null
        ? components['schemes'] as Map<String, dynamic>
        : null;

    return getFileContent(swaggerRoot, className, fileName, options,
        schemes != null && schemes.keys.isNotEmpty);
  }

  ///Get parameter from root parameters if needed
  @visibleForTesting
  SwaggerRequestParameter getNeededRequestParameter(
      SwaggerRequestParameter swaggerRequestParameter,
      List<SwaggerRequestParameter> definedParameters) {
    if (swaggerRequestParameter.ref == null) {
      return swaggerRequestParameter;
    }

    final parameterClassName = swaggerRequestParameter.ref.split('/').last;

    final neededParameter = definedParameters.firstWhere(
        (SwaggerRequestParameter element) =>
            element.name == parameterClassName);

    return neededParameter;
  }

  @visibleForTesting
  String getFileContent(SwaggerRoot swaggerRoot, String className,
      String fileName, GeneratorOptions options, bool hasModels) {
    final classContent =
        getRequestClassContent(swaggerRoot.host, className, fileName, options);
    final chopperClientContent = getChopperClientContent(
        className, swaggerRoot.host, swaggerRoot.basePath, options, hasModels);
    final allMethodsContent = getAllMethodsContent(swaggerRoot, options);
    final result = generateFileContent(
        classContent, chopperClientContent, allMethodsContent);

    return result;
  }

  @visibleForTesting
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

  @visibleForTesting
  String getAllMethodsContent(
      SwaggerRoot swaggerRoot, GeneratorOptions options) {
    final methods = StringBuffer();

    swaggerRoot.paths.forEach((SwaggerPath swaggerPath) {
      swaggerPath.requests
          .where((SwaggerRequest swaggerRequest) =>
              swaggerRequest.type.toLowerCase() != requestTypeOptions)
          .forEach((SwaggerRequest swaggerRequest) {
        final hasFormData = swaggerRequest.parameters.any(
            (SwaggerRequestParameter swaggerRequestParameter) =>
                swaggerRequestParameter.inParameter == 'formData');

        var methodName = swaggerRequest.operationId;

        if (methodName == null) {
          methodName = defaultMethodName + _unnamedMethodsCounter.toString();

          ///To avoid dublicated default method names
          _unnamedMethodsCounter++;
        }

        final requiredParameters = getRequiredParametersContent(
            listParameters: swaggerRequest.parameters,
            ignoreHeaders: options.ignoreHeaders,
            path: swaggerPath.path,
            requestType: swaggerRequest.type);

        final parameterCommentsForMethod =
            getParameterCommentsForMethod(swaggerRequest.parameters, options);

        final returnTypeName = getReturnTypeName(
            swaggerRequest.responses,
            swaggerPath.path,
            swaggerRequest.type,
            options.responseOverrideValueMap);

        final hasEnums = swaggerRequest.parameters.any((parameter) =>
            parameter.items?.enumValues != null ||
            parameter.item?.enumValues != null ||
            parameter.schema?.enumValues != null);

        final enumInBodyName = swaggerRequest.parameters.firstWhere(
            (parameter) =>
                parameter.inParameter == 'body' &&
                (parameter.items?.enumValues != null ||
                    parameter.item?.enumValues != null ||
                    parameter.schema?.enumValues != null),
            orElse: () => null);

        final generatedMethod = getMethodContent(
            summary: swaggerRequest.summary,
            typeRequest: swaggerRequest.type,
            methodName: methodName,
            requiredParameters: requiredParameters,
            parametersComments: parameterCommentsForMethod,
            requestPath: swaggerPath.path,
            hasFormData: hasFormData,
            returnType: returnTypeName,
            hasEnums: hasEnums,
            enumInBodyName: enumInBodyName?.name,
            ignoreHeaders: options.ignoreHeaders,
            parameters: swaggerRequest.parameters);

        methods.writeln(generatedMethod);
      });
    });

    return methods.toString();
  }

  @visibleForTesting
  String getReturnTypeName(List<SwaggerResponse> responses, String url,
      String methodName, List<ResponseOverrideValueMap> overridenRequests) {
    if (overridenRequests
            ?.any((ResponseOverrideValueMap element) => element.url == url) ==
        true) {
      final overridenResponse = overridenRequests
          .firstWhere((ResponseOverrideValueMap element) => element.url == url);

      if (overridenResponse.method == methodName) {
        return overridenResponse.overridenValue;
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

    if (neededResponse.schema?.originalRef != null) {
      return neededResponse.schema.originalRef;
    }

    if (neededResponse.content?.isNotEmpty == true &&
        neededResponse.content != null) {
      if (neededResponse.content.first.ref != null) {
        return neededResponse.content.first.ref.split('/').last;
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

  @visibleForTesting
  SwaggerResponse getSuccessedResponse(List<SwaggerResponse> responses) {
    return responses.firstWhere(
        (SwaggerResponse response) =>
            successDescriptions.contains(response.description) ||
            response.code == successResponseCode,
        orElse: () => null);
  }

  @visibleForTesting
  String getRequiredParametersContent(
      {List<SwaggerRequestParameter> listParameters,
      bool ignoreHeaders,
      String path,
      String requestType}) {
    return listParameters
        .map((SwaggerRequestParameter parameter) => getParameterContent(
            parameter: parameter,
            ignoreHeaders: ignoreHeaders,
            path: path,
            requestType: requestType))
        .where((String element) => element.isNotEmpty)
        .join(', ');
  }

  @visibleForTesting
  String getRequestClassContent(String host, String className, String fileName,
      GeneratorOptions options) {
    final classWithoutChopper = '''
${getBaseUrlContent(host, options.withBaseUrl)}
abstract class $className extends ChopperService''';

    return classWithoutChopper;
  }

  @visibleForTesting
  String getBaseUrlContent(String baseUrl, bool withBaseUrl) {
    if (withBaseUrl) {
      if (baseUrl != null) {
        return '''
@ChopperApi()
''';
      } else {
        return '''@ChopperApi()''';
      }
    } else {
      return '''@ChopperApi()''';
    }
  }

  @visibleForTesting
  String getChopperClientContent(String fileName, String host, String basePath,
      GeneratorOptions options, bool hasModels) {
    final baseUrlString = options.withBaseUrl
        ? "baseUrl:  'https://$host${basePath ?? ''}'"
        : '/*baseUrl: YOUR_BASE_URL*/';

    final converterString =
        options.withBaseUrl && options.withConverter && hasModels
            ? 'converter: JsonSerializableConverter(),'
            : 'converter: chopper.JsonConverter(),';

    final generatedChopperClient = '''
  static $fileName create([ChopperClient client]) {
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
}
