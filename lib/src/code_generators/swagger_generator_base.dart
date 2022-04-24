import 'package:recase/recase.dart';
import 'package:swagger_dart_code_generator/src/code_generators/constants.dart';
import 'package:swagger_dart_code_generator/src/exception_words.dart';
import 'package:swagger_dart_code_generator/src/extensions/string_extension.dart';
import 'package:swagger_dart_code_generator/src/models/generator_options.dart';
import 'package:swagger_dart_code_generator/src/models/swagger_enum.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/requests/swagger_request.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/requests/swagger_request_parameter.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/swagger_path.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/swagger_root.dart';

abstract class SwaggerGeneratorBase {
  GeneratorOptions get options;

  String getValidatedClassName(
    String className,
  ) {
    if (kBasicTypes.contains(className)) {
      return className;
    }

    if (exceptionWords.contains(className)) {
      return 'Object';
    }

    if (className.isEmpty) {
      return className;
    }

    final isEnum = className.startsWith('enums.');

    if (isEnum) {
      className = className.substring(6);
    }

    final words = className.split('\$');

    final result = words
        .map((e) => e.pascalCase
            .split(RegExp(r'\W+|\_'))
            .map((String str) => str.capitalize)
            .join())
        .join('\$')
        .replaceFirst(RegExp(options.cutFromModelNames), '');

    if (kKeyClasses.contains(result)) {
      return '$result\$';
    }

    if (isEnum) {
      return 'enums.$result';
    }

    if (result.startsWith(RegExp('[0-9]'))) {
      return '\$$result';
    }

    return result.replaceFirst(options.cutFromModelNames, '');
  }

  String generateEnumName(String className, String enumName) {
    return getValidatedClassName('${className.capitalize}_$enumName');
  }

  String generateRequestEnumName(
      String path, String requestType, String parameterName) {
    if (path == '/') {
      path = '\$';
    }

    path = path.split('{').map((e) => e.capitalize).join();
    path = path.split('}').map((e) => e.capitalize).join();

    final correctedPath = generateFieldName(path);

    final result =
        '${correctedPath.capitalize}${requestType.capitalize}${parameterName.capitalize}';

    return getValidatedClassName(result);
  }

  String generateFieldName(String jsonKey) {
    final forbiddenCharacters = <String>['#'];

    jsonKey = jsonKey.camelCase;

    for (var element in forbiddenCharacters) {
      if (jsonKey.startsWith(element)) {
        jsonKey = '\$forbiddenFieldName';
      }
    }

    if (jsonKey.startsWith(RegExp('[0-9]')) ||
        exceptionWords.contains(jsonKey)) {
      jsonKey = '\$' + jsonKey;
    }

    if (kBasicTypes.contains(jsonKey)) {
      jsonKey = '\$' + jsonKey;
    }

    return jsonKey;
  }

  List<SwaggerEnum> getEnumsFromRequests(SwaggerRoot swaggerRoot) {
    final enums = <SwaggerEnum>[];

    //Link defined parameters with requests
    swaggerRoot.paths.forEach((String path, SwaggerPath swaggerPath) {
      swaggerPath.requests.forEach((String req, SwaggerRequest swaggerRequest) {
        swaggerRequest.parameters = swaggerRequest.parameters
            .map((SwaggerRequestParameter parameter) =>
                getOriginalOrOverriddenRequestParameter(parameter,
                    swaggerRoot.components?.parameters.values.toList() ?? []))
            .toList();
      });
    });

    swaggerRoot.paths.forEach((String path, SwaggerPath swaggerPath) {
      swaggerPath.requests
          .forEach((String requestType, SwaggerRequest swaggerRequest) {
        if (swaggerRequest.parameters.isEmpty) {
          return;
        }

        for (var p = 0; p < swaggerRequest.parameters.length; p++) {
          final swaggerRequestParameter = swaggerRequest.parameters[p];

          var name = generateRequestEnumName(
              path, requestType, swaggerRequestParameter.name);

          if (enums.any((element) => element.name == name)) {
            continue;
          }

          final enumValues = swaggerRequestParameter.schema?.enumValues ??
              swaggerRequestParameter.items?.enumValues ??
              [];

          if (enumValues.isNotEmpty) {
            enums.add(
              SwaggerEnum(
                name: name,
                isInteger: kIntegerTypes.contains(
                  swaggerRequestParameter.schema?.type,
                ),
                defaultValue: swaggerRequestParameter.schema?.defaultValue,
              ),
            );
          }
        }
      });
    });

    return enums;
  }

  SwaggerRequestParameter getOriginalOrOverriddenRequestParameter(
      SwaggerRequestParameter swaggerRequestParameter,
      List<SwaggerRequestParameter> definedParameters) {
    if (swaggerRequestParameter.ref.isEmpty || definedParameters.isEmpty) {
      return swaggerRequestParameter;
    }

    final parameterClassName = swaggerRequestParameter.ref.split('/').last;

    final neededParameter = definedParameters.firstWhere(
        (SwaggerRequestParameter element) =>
            element.name == parameterClassName ||
            element.key == parameterClassName,
        orElse: () => swaggerRequestParameter);

    return neededParameter;
  }

  String generateRequestName(String path, String requestType) {
    if (path == '/') {
      path = '\$';
    }

    path = path.split('{').map((e) => e.capitalize).join();
    path = path.split('}').map((e) => e.capitalize).join();
    path = path.split(',').map((e) => e.capitalize).join();

    final correctedPath = getValidatedClassName(path);

    return '${correctedPath.capitalize}${requestType.capitalize}'.camelCase;
  }
}
