import 'dart:convert';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_models_generator.dart';
import 'package:swagger_dart_code_generator/src/code_generators/v2/swagger_enums_generator_v2.dart';
import 'package:swagger_dart_code_generator/src/models/generator_options.dart';

class SwaggerModelsGeneratorV2 extends SwaggerModelsGenerator {
  @override
  String generate(String dartCode, String fileName, GeneratorOptions options) {
    final dynamic map = jsonDecode(dartCode);
    final definitions = map['definitions'] as Map<String, dynamic>;
    return generateBase(dartCode, fileName, options, definitions);
  }

  @override
  List<String> getAllEnumNames(
      Map<String, dynamic> definitions, String swaggerFile) {
    final results = SwaggerEnumsGeneratorV2().getEnumNames(swaggerFile);

    if (definitions == null) {
      return results;
    }

    definitions.forEach((className, map) {
      final properties = map['properties'] as Map<String, dynamic>;

      if (properties == null) {
        return;
      }

      properties.forEach((propertyName, propertyValue) {
        var property = propertyValue as Map<String, dynamic>;

        if (property.containsKey('enum') ||
            (property['items'] != null && property['items']['enum'] != null)) {
          results.add(SwaggerEnumsGeneratorV2()
              .generateEnumName(className, propertyName));
        }
      });
    });

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

  @override
  String generateModelClassContent(
    String className,
    Map<String, dynamic> map,
    List<DefaultValueMap> defaultValues,
    bool useDefaultNullForLists,
    List<String> allEnumNames,
  ) {
    return generateModelClassString(
        className, map, defaultValues, useDefaultNullForLists, allEnumNames);
  }
}
