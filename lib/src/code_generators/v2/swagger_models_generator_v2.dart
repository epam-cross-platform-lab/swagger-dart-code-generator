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
    final definitions = map['definitions'] as Map<String, dynamic>;
    return generateBase(dartCode, fileName, options, definitions, true);
  }

  @override
  String generateResponses(
      String dartCode, String fileName, GeneratorOptions options) {
    return '';
  }

  @override
  List<String> getAllEnumNames(String swaggerFile) {
    final results = SwaggerEnumsGenerator.getEnumNamesFromRequests(swaggerFile);

    final swagger = jsonDecode(swaggerFile);

    final definitions = swagger['definitions'] as Map<String, dynamic>;

    if (definitions != null) {
      definitions.forEach((className, map) {
        if ((map as Map<String, dynamic>).containsKey('enum')) {
          results.add(className.capitalize);
          return;
        }

        final properties = map['properties'] as Map<String, dynamic>;

        if (properties == null) {
          return;
        }

        properties.forEach((propertyName, propertyValue) {
          var property = propertyValue as Map<String, dynamic>;

          if (property.containsKey('enum') ||
              (property['items'] != null &&
                  property['items']['enum'] != null)) {
            results.add(SwaggerEnumsGeneratorV2()
                .generateEnumName(className, propertyName));
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
  Map<String, dynamic> getModelProperties(Map<String, dynamic> modelMap) {
    return modelMap['properties'] as Map<String, dynamic>;
  }

  @override
  String getExtendsString(Map<String, dynamic> map) {
    return '';
  }
}
