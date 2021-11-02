import 'dart:convert';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_enums_generator.dart';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_models_generator.dart';
import 'package:swagger_dart_code_generator/src/code_generators/v2/swagger_enums_generator_v2.dart';
import 'package:swagger_dart_code_generator/src/extensions/string_extension.dart';
import 'package:swagger_dart_code_generator/src/models/generator_options.dart';

class SwaggerModelsGeneratorV2 extends SwaggerModelsGenerator {
  @override
  String generate(String dartCode, String fileName, GeneratorOptions options) {
    final dynamic map = jsonDecode(dartCode);
    final definitions = map['definitions'] as Map<String, dynamic>?;
    return generateBase(dartCode, fileName, options, definitions ?? {}, true);
  }

  @override
  String generateResponses(
      String dartCode, String fileName, GeneratorOptions options) {
    return '';
  }

  @override
  String generateRequestBodies(
      String dartCode, String fileName, GeneratorOptions options) {
    return '';
  }

  @override
  List<String> getAllEnumNames(String swaggerFile) {
    final results = SwaggerEnumsGenerator.getEnumNamesFromRequests(swaggerFile);

    final swagger = jsonDecode(swaggerFile);

    final definitions = swagger['definitions'] as Map<String, dynamic>? ?? {};

    if (definitions.isNotEmpty) {
      definitions.forEach((className, map) {
        final mapMap = map as Map<String, dynamic>;
        if (mapMap.containsKey('enum')) {
          results.add(SwaggerModelsGenerator.getValidatedClassName(
              className.capitalize));
          return;
        }

        if (mapMap['type'] == 'array' &&
            mapMap['items'] != null &&
            mapMap['items']['enum'] != null) {
          results.add(SwaggerModelsGenerator.getValidatedClassName(
              className.capitalize));
          return;
        }

        final properties = map['properties'] as Map<String, dynamic>?;

        if (properties == null) {
          return;
        }

        properties.forEach((propertyName, propertyValue) {
          var property = propertyValue as Map<String, dynamic>;

          if (property.containsKey('enum') ||
              (property['items'] != null &&
                  property['items']['enum'] != null)) {
            results.add(SwaggerEnumsGeneratorV2().generateEnumName(
                SwaggerModelsGenerator.getValidatedClassName(className),
                propertyName));
          }
        });
      });
    }

    final resultsWithPrefix = results.map((element) {
      return 'enums.$element';
    }).toList();

    return resultsWithPrefix;
  }

  @override
  List<String> getAllListEnumNames(String swaggerFile) {
    final results = SwaggerEnumsGenerator.getEnumNamesFromRequests(swaggerFile);

    final swagger = jsonDecode(swaggerFile);

    final definitions = swagger['definitions'] as Map<String, dynamic>?;

    if (definitions != null) {
      definitions.forEach((className, map) {
        final mapMap = map as Map<String, dynamic>;

        if (mapMap['type'] == 'array' &&
            mapMap['items'] != null &&
            mapMap['items']['enum'] != null) {
          results.add(SwaggerModelsGenerator.getValidatedClassName(
              className.capitalize));
          return;
        }
      });
    }

    final resultsWithPrefix = results.map((element) {
      return 'enums.$element';
    }).toList();

    return resultsWithPrefix;
  }

  @override
  String getExtendsString(Map<String, dynamic> map) {
    return '';
  }
}
