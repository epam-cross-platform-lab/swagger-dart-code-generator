import 'dart:convert';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_enums_generator.dart';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_models_generator.dart';
import 'package:swagger_dart_code_generator/src/code_generators/v3/swagger_enums_generator_v3.dart';
import 'package:swagger_dart_code_generator/src/extensions/string_extension.dart';
import 'package:swagger_dart_code_generator/src/models/generator_options.dart';

class SwaggerModelsGeneratorV3 extends SwaggerModelsGenerator {
  @override
  String generate(String dartCode, String fileName, GeneratorOptions options) {
    final dynamic map = jsonDecode(dartCode);

    final components = map['components'] as Map<String, dynamic>;
    final schemas = components == null
        ? null
        : components['schemas'] as Map<String, dynamic>;

    return generateBase(dartCode, fileName, options, schemas, true);
  }

  @override
  String generateResponses(
      String dartCode, String fileName, GeneratorOptions options) {
    final dynamic map = jsonDecode(dartCode);

    final components = map['components'] as Map<String, dynamic>;
    final responses = components == null
        ? null
        : components['responses'] as Map<String, dynamic>;

    if (responses == null) {
      return '';
    }

    var result = <String, dynamic>{};

    final allModelNames = components.containsKey('schemas')
        ? (components['schemas'] as Map<String, dynamic>)
            .keys
            .map((e) => getValidatedClassName(e))
        : <String>[];

    responses.keys.forEach((key) {
      if (!allModelNames.contains(key)) {
        final response = responses[key] as Map<String, dynamic>;

        final content = response == null
            ? null
            : response['content'] as Map<String, dynamic>;

        final firstContent = content == null
            ? null
            : content.entries?.first?.value as Map<String, dynamic>;

        final schema = firstContent == null ? null : firstContent['schema'];

        if (schema != null) {
          result.addAll({key: schema});
        }
      }
    });

    return generateBase(dartCode, fileName, options, result, false);
  }

  @override
  List<String> getAllEnumNames(String swaggerFile) {
    final results = SwaggerEnumsGenerator.getEnumNamesFromRequests(swaggerFile);

    final swagger = jsonDecode(swaggerFile);

    final components = swagger['components'] as Map<String, dynamic>;

    final schemas = components == null
        ? null
        : components['schemas'] as Map<String, dynamic>;

    final responses = components == null
        ? null
        : components['responses'] as Map<String, dynamic>;

    if (schemas != null) {
      schemas.forEach((className, map) {
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
            results.add(SwaggerEnumsGeneratorV3()
                .generateEnumName(className, propertyName));
          }
        });
      });
    }

    if (responses != null) {
      responses.forEach((className, map) {
        final response = responses[className];
        final content = response['content'] as Map<String, dynamic>;
        final firstContent = content?.entries?.first?.value;
        final schema = firstContent == null ? null : firstContent['schema'];
        if (schema != null &&
            (schema as Map<String, dynamic>).containsKey('enum')) {
          results.add(className.capitalize);
          return;
        }
        final properties = schema == null
            ? null
            : schema['properties'] as Map<String, dynamic>;

        if (properties == null) {
          return;
        }

        properties.forEach((propertyName, propertyValue) {
          var property = propertyValue as Map<String, dynamic>;

          if (property.containsKey('enum') ||
              (property['items'] != null &&
                  property['items']['enum'] != null)) {
            results.add(SwaggerEnumsGeneratorV3()
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
    if (!modelMap.containsKey('allOf')) {
      return modelMap['properties'] as Map<String, dynamic>;
    }

    final allOf = modelMap['allOf'] as List<dynamic>;

    final newModelMap = allOf.firstWhere(
      (m) => (m as Map<String, dynamic>).containsKey('properties'),
      orElse: () => null,
    );

    if (newModelMap == null) {
      return null;
    }

    final currentProperties = newModelMap['properties'] as Map<String, dynamic>;

    return currentProperties;
  }

  @override
  String getExtendsString(Map<String, dynamic> map) {
    if (map.containsKey('allOf')) {
      final allOf = map['allOf'] as List<dynamic>;
      final refItem = allOf
          .firstWhere((m) => (m as Map<String, dynamic>).containsKey('\$ref'));

      final ref = refItem['\$ref'].toString().split('/').last;

      final className = getValidatedClassName(ref);

      return 'extends $className';
    }

    return '';
  }
}
