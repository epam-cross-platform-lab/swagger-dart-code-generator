import 'dart:convert';
import 'package:recase/recase.dart';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_enums_generator.dart';
import 'package:swagger_dart_code_generator/src/code_generators/v2/swagger_models_generator_v2.dart';
import 'package:swagger_dart_code_generator/src/exception_words.dart';
import 'package:swagger_dart_code_generator/src/extensions/string_extension.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/v2/swagger_root.dart';
import 'package:meta/meta.dart';

class SwaggerEnumsGeneratorV2 implements SwaggerEnumsGenerator {
  static const String defaultEnumFieldName = 'value_';
  static const String defaultEnumValueName = 'swaggerGeneratedUnknown';

  @override
  String generate(String dartCode, String fileName) {
    final enumsFromRequests = generateEnumsFromRequests(dartCode, fileName);

    final dynamic map = jsonDecode(dartCode);

    final definitions = map['definitions'] as Map<String, dynamic>;

    if (definitions == null) {
      return enumsFromRequests;
    }

    final enumsFromClasses = definitions.keys.map((String className) {
      return generateEnumsFromClasses(
          className.pascalCase, definitions[className] as Map<String, dynamic>);
    }).join('\n');

    if (enumsFromClasses.isEmpty && enumsFromRequests.isEmpty) {
      return '';
    }

    return '''
import 'package:json_annotation/json_annotation.dart';
$enumsFromClasses\n$enumsFromRequests''';
  }

  String generateEnumsFromRequests(String swagger, String fileName) {
    final enumNames = <String>[];
    final result = StringBuffer();
    final map = jsonDecode(swagger) as Map<String, dynamic>;
    final swaggerRoot = SwaggerRoot.fromJson(map);

    for (var i = 0; i < swaggerRoot.paths.length; i++) {
      final swaggerPath = swaggerRoot.paths[i];

      for (var j = 0; j < swaggerPath.requests.length; j++) {
        final swaggerRequest = swaggerPath.requests[j];

        if (swaggerRequest.parameters == null) {
          continue;
        }

        for (var p = 0; p < swaggerRequest.parameters.length; p++) {
          final swaggerRequestParameter = swaggerRequest.parameters[p];

          var name = SwaggerModelsGeneratorV2.generateRequestEnumName(
              swaggerPath.path,
              swaggerRequest.type,
              swaggerRequestParameter.name);

          if (enumNames.contains(name)) {
            continue;
          }

          final enumValues = swaggerRequestParameter.schema?.enumValues ??
              swaggerRequestParameter.items?.enumValues;

          if (enumValues != null) {
            final enumContent = generateEnumContent(name, enumValues);

            result.writeln(enumContent);
            enumNames.add(name);
          }
        }
      }
    }

    return result.toString();
  }

  List<String> getEnumNames(String swagger) {
    final enumNames = <String>[];
    final map = jsonDecode(swagger) as Map<String, dynamic>;
    final swaggerRoot = SwaggerRoot.fromJson(map);

    for (var i = 0; i < swaggerRoot.paths.length; i++) {
      final swaggerPath = swaggerRoot.paths[i];

      for (var j = 0; j < swaggerPath.requests.length; j++) {
        final swaggerRequest = swaggerPath.requests[j];

        if (swaggerRequest.parameters == null) {
          continue;
        }

        for (var p = 0; p < swaggerRequest.parameters.length; p++) {
          final swaggerRequestParameter = swaggerRequest.parameters[p];

          var name = SwaggerModelsGeneratorV2.generateRequestEnumName(
              swaggerPath.path,
              swaggerRequest.type,
              swaggerRequestParameter.name);

          if (enumNames.contains(name)) {
            continue;
          }

          final enumValues = swaggerRequestParameter.schema?.enumValues ??
              swaggerRequestParameter.items?.enumValues;

          if (enumValues != null) {
            enumNames.add(name);
          }
        }
      }
    }

    return enumNames;
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

  @visibleForTesting
  String getEnumValuesContent(List<String> enumValues) {
    final result = enumValues
        .map((String enumFieldName) =>
            "\t@JsonValue('${enumFieldName.replaceAll("\$", "\\\$")}')\n\t${getValidatedEnumFieldName(enumFieldName)}")
        .join(',\n');

    return result;
  }

  @visibleForTesting
  String getEnumValuesMapContent(String enumName, List<String> enumValues) {
    final neededValues = <String>[];
    neededValues.addAll(enumValues);
    neededValues.add('swaggerGeneratedUnknown');

    final result = neededValues
        .map((String enumFieldName) =>
            '\t$enumName.${getValidatedEnumFieldName(enumFieldName)}: \'${enumFieldName.replaceAll('\$', '\\\$')}\'')
        .join(',\n');

    return result;
  }

  String getValidatedEnumFieldName(String name) {
    var result = name
        .replaceAll(RegExp(r'[^\w|\_|)]'), '_')
        .split('_')
        .where((element) => element.isNotEmpty)
        .map((String word) => word.capitalize)
        .join();

    if (result.startsWith(RegExp('[0-9]+'))) {
      result = defaultEnumFieldName + result;
    }

    if (exceptionWords.contains(result.toLowerCase())) {
      return '\$' + result.lower;
    }

    return result.lower;
  }

  @visibleForTesting
  String generateEnumsContent(Map<String, dynamic> map, String className) {
    if (map == null) {
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

  @visibleForTesting
  String generateEnumContentIfPossible(
      Map<String, dynamic> map, String enumName) {
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

  @visibleForTesting
  String generateEnumValuesContent(List<dynamic> values) {
    return values
        .map((dynamic e) =>
            "\t@JsonValue('${e.toString().replaceAll("\$", "\\\$")}')\n  ${getValidatedEnumFieldName(e?.toString())}")
        .join(',\n');
  }

  @visibleForTesting
  String generateEnumsFromClasses(
    String className,
    Map<String, dynamic> map,
  ) {
    final properties = map['properties'] as Map<String, dynamic>;
    return generateEnumsContent(properties, className);
  }
}
