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

class SwaggerRequestsGeneratorV2 extends SwaggerRequestsGenerator {
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
                getNeededRequestParameter(parameter, swaggerRoot.parameters))
            .toList();
      });
    });

    final definitions = map['definitions'] as Map<String, dynamic>;

    return getFileContent(swaggerRoot, className, fileName, options,
        definitions != null && definitions.keys.isNotEmpty);
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

  @override
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

        final parameterCommentsForMethod =
            getParameterCommentsForMethod(swaggerRequest.parameters, options);

        final returnTypeName = getReturnTypeName(
            swaggerRequest.responses,
            swaggerPath.path,
            swaggerRequest.type,
            options.responseOverrideValueMap);

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
}
