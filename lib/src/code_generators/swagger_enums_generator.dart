import 'dart:convert';
import 'package:recase/recase.dart';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_models_generator.dart';
import 'package:swagger_dart_code_generator/src/exception_words.dart';
import 'package:swagger_dart_code_generator/src/extensions/string_extension.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/requests/swagger_request.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/requests/swagger_request_parameter.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/swagger_path.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/swagger_root.dart';
import 'package:collection/collection.dart';

abstract class SwaggerEnumsGenerator {
  static const String defaultEnumFieldName = 'value_';
  static const String defaultEnumValueName = 'swaggerGeneratedUnknown';

  String generate(String swagger, String fileName);

  String generateFromMap(
      String dartCode,
      String fileName,
      Map<String, dynamic> definitions,
      Map<String, dynamic> responses,
      Map<String, dynamic> requestBodies) {
    final enumsFromRequests =
        generateEnumsContentFromRequests(dartCode, fileName);

    final enumsFromResponses = generateEnumsFromResponses(responses);

    final enumsFromRequestBodies =
        generateEnumsFromRequestBodies(requestBodies);

    if (definitions.isEmpty) {
      return '$enumsFromRequests$enumsFromResponses$enumsFromRequestBodies';
    }

    final enumsFromClasses = definitions.keys
        .map((String className) {
          return generateEnumsFromClasses(
              SwaggerModelsGenerator.getValidatedClassName(
                  className.pascalCase),
              definitions[className] as Map<String, dynamic>);
        })
        .where((element) => element.isNotEmpty)
        .join('\n');

    if (enumsFromClasses.isEmpty &&
        enumsFromRequests.isEmpty &&
        enumsFromResponses.isEmpty &&
        enumsFromRequestBodies.isEmpty) {
      return '';
    }

    return '''
import 'package:json_annotation/json_annotation.dart';
$enumsFromClasses

$enumsFromRequests

$enumsFromResponses

$enumsFromRequestBodies
''';
  }

  String generateEnumsFromResponses(Map<String, dynamic> responses) {
    if (responses.isEmpty) {
      return '';
    }

    final enumsFromResponses = responses.keys
        .map((String className) {
          final response = responses[className];
          final content = response['content'] as Map<String, dynamic>?;
          final firstContent = content != null && content.entries.isNotEmpty
              ? content.entries.first.value
              : null;
          final schema = firstContent == null ? null : firstContent['schema'];

          if (schema == null) {
            return '';
          }

          return generateEnumsFromClasses(
              SwaggerModelsGenerator.getValidatedClassName(
                  className.pascalCase),
              schema as Map<String, dynamic>);
        })
        .where((element) => element.isNotEmpty)
        .join('\n');

    return enumsFromResponses;
  }

  String generateEnumsFromRequestBodies(Map<String, dynamic> requestBodies) {
    if (requestBodies.isEmpty) {
      return '';
    }

    final enumsFromRequestBodies = requestBodies.keys
        .map((String className) {
          final response = requestBodies[className];
          final content = response['content'] as Map<String, dynamic>?;
          final firstContent = content != null && content.entries.isNotEmpty
              ? content.entries.first.value
              : null;
          final schema = firstContent == null ? null : firstContent['schema'];

          if (schema == null) {
            return '';
          }

          return generateEnumsFromClasses(
              SwaggerModelsGenerator.getValidatedClassName(
                  className.pascalCase),
              schema as Map<String, dynamic>);
        })
        .where((element) => element.isNotEmpty)
        .join('\n');

    return enumsFromRequestBodies;
  }

  static SwaggerRequestParameter getOriginalOrOverriddenRequestParameter(
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

  String generateEnumsContentFromRequests(String swagger, String fileName) {
    final enumNames = <String>[];
    final result = StringBuffer();
    final map = jsonDecode(swagger) as Map<String, dynamic>;
    final swaggerRoot = SwaggerRoot.fromJson(map);

    //Link defined parameters with requests
    swaggerRoot.paths.forEach((String path, SwaggerPath swaggerPath) {
      swaggerPath.requests
          .forEach((String requestType, SwaggerRequest swaggerRequest) {
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

          var name = SwaggerModelsGenerator.generateRequestEnumName(
              path, requestType, swaggerRequestParameter.name);

          name = SwaggerModelsGenerator.getValidatedClassName(name);

          if (enumNames.contains(name)) {
            continue;
          }

          final enumValues = swaggerRequestParameter.schema?.enumValues ??
              swaggerRequestParameter.items?.enumValues ??
              [];

          if (enumValues.isNotEmpty) {
            final enumContent = generateEnumContent(name, enumValues);

            result.writeln(enumContent);
            enumNames.add(swaggerRequestParameter.name);
          }
        }
      });
    });

    return result.toString();
  }

  String generateEnumContent(String enumName, List<String> enumValues) {
    final enumValuesContent = getEnumValuesContent(enumValues);

    final enumMap = '''
\n\tconst \$${enumName}Map = {
\t${getEnumValuesMapContent(enumName, enumValues)}
      };
      ''';

    final result = """
enum $enumName{
\t@JsonValue('swaggerGeneratedUnknown')
\tswaggerGeneratedUnknown,
$enumValuesContent
}

$enumMap
 """;

    return result;
  }

  String getEnumValuesContent(List<String> enumValues) {
    final result = enumValues
        .map((String enumFieldName) =>
            "\t@JsonValue('${enumFieldName.replaceAll("\$", "\\\$")}')\n\t${getValidatedEnumFieldName(enumFieldName)}")
        .join(',\n');

    return result;
  }

  String getEnumValuesMapContent(String enumName, List<String> enumValues) {
    final neededValues = <String>[];
    neededValues.addAll(enumValues);

    final unknownEnumPart = ',\n\t$enumName.swaggerGeneratedUnknown: \'\'';

    final result = neededValues
            .map((String enumFieldName) =>
                '\t$enumName.${getValidatedEnumFieldName(enumFieldName)}: \'${enumFieldName.replaceAll('\$', '\\\$')}\'')
            .join(',\n') +
        unknownEnumPart;

    return result;
  }

  static String getValidatedEnumFieldName(String name) {
    if (name.isEmpty) {
      name = 'null';
    }

    var result = name
        .replaceAll(RegExp(r'[^\w|\_|)]'), '_')
        .split('_')
        .where((element) => element.isNotEmpty)
        .map((String word) => word.toLowerCase().capitalize)
        .join();

    if (result.startsWith(RegExp('[0-9]+'))) {
      result = defaultEnumFieldName + result;
    }

    if (exceptionWords.contains(result.toLowerCase())) {
      return '\$' + result.lower;
    }

    return result.lower;
  }

  static List<String> getEnumNamesFromRequests(String swagger) {
    final enumNames = <String>[];
    final map = jsonDecode(swagger) as Map<String, dynamic>;
    final swaggerRoot = SwaggerRoot.fromJson(map);

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

          var name = SwaggerModelsGenerator.generateRequestEnumName(
              path, requestType, swaggerRequestParameter.name);

          if (enumNames.contains(name)) {
            continue;
          }

          final enumValues = swaggerRequestParameter.schema?.enumValues ??
              swaggerRequestParameter.items?.enumValues ??
              [];

          if (enumValues.isNotEmpty) {
            enumNames.add(name);
          }
        }
      });
    });

    return enumNames;
  }

  String generateEnumsContentFromModelProperties(
      Map<String, dynamic> map, String className) {
    if (map.isEmpty) {
      return '';
    }

    final gemeratedEnumsContent = map.keys
        .map((String key) {
          final enumValuesMap = map[key] as Map<String, dynamic>;

          if (enumValuesMap.containsKey('type')) {
            return generateEnumContentIfPossible(
                enumValuesMap, generateEnumName(className, key));
          }

          return '';
        })
        .where((String generatedEnum) => generatedEnum.isNotEmpty)
        .join('\n');

    return gemeratedEnumsContent;
  }

  String generateEnumContentIfPossible(
      Map<String, dynamic> map, String enumName) {
    enumName = SwaggerModelsGenerator.getValidatedClassName(enumName);

    if (map['enum'] != null) {
      final enumValues = map['enum'] as List<dynamic>;
      final stringValues = enumValues.map((e) => e.toString()).toList();
      final enumMap = '''
\n\tconst \$${enumName}Map = {
\t${getEnumValuesMapContent(enumName, stringValues)}
      };
      ''';

      return """
enum ${enumName.capitalize} {
\t@JsonValue('$defaultEnumValueName')\n  $defaultEnumValueName,
${generateEnumValuesContent(enumValues)}
}

$enumMap
""";
    } else if (map['items'] != null) {
      return generateEnumContentIfPossible(
          map['items'] as Map<String, dynamic>, enumName);
    } else {
      return '';
    }
  }

  String generateEnumName(String className, String enumName) {
    return '${className.capitalize}${enumName.capitalize}';
  }

  String generateEnumValuesContent(List<dynamic> values) {
    return values
        .map((dynamic e) =>
            "\t@JsonValue('${e.toString().replaceAll("\$", "\\\$")}')\n  ${getValidatedEnumFieldName(e.toString())}")
        .join(',\n');
  }

  String generateEnumsFromClasses(
    String className,
    Map<String, dynamic> map,
  ) {
    if (map['enum'] != null) {
      return generateEnumContentIfPossible(map, className);
    }

    if (map['items'] != null && map['items']['enum'] != null) {
      return generateEnumContentIfPossible(
          map['items'] as Map<String, dynamic>, className);
    }
    Map<String, dynamic> properties;

    if (map.containsKey('allOf')) {
      final allOf = map['allOf'] as List<dynamic>;
      var propertiesContainer = allOf.firstWhereOrNull(
            (e) => (e as Map<String, dynamic>).containsKey('properties'),
          ) as Map<String, dynamic>? ??
          {};

      if (propertiesContainer.isNotEmpty) {
        properties =
            propertiesContainer['properties'] as Map<String, dynamic>? ?? {};
      } else {
        properties = map['properties'] as Map<String, dynamic>? ?? {};
      }
    } else {
      properties = map['properties'] as Map<String, dynamic>? ?? {};
    }

    if (properties.isEmpty) {
      return '';
    }

    return generateEnumsContentFromModelProperties(properties, className);
  }
}
