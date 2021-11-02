import 'dart:convert';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_enums_generator.dart';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_models_generator.dart';
import 'package:swagger_dart_code_generator/src/code_generators/v3/swagger_enums_generator_v3.dart';
import 'package:swagger_dart_code_generator/src/extensions/string_extension.dart';
import 'package:swagger_dart_code_generator/src/models/generator_options.dart';
import 'package:collection/collection.dart';

class SwaggerModelsGeneratorV3 extends SwaggerModelsGenerator {
  @override
  String generate(String dartCode, String fileName, GeneratorOptions options) {
    final dynamic map = jsonDecode(dartCode);

    final components = map['components'] as Map<String, dynamic>?;
    final schemas = components == null
        ? null
        : components['schemas'] as Map<String, dynamic>?;

    return generateBase(dartCode, fileName, options, schemas ?? {}, true);
  }

  @override
  String generateResponses(
      String dartCode, String fileName, GeneratorOptions options) {
    final dynamic map = jsonDecode(dartCode);

    final components = map['components'] as Map<String, dynamic>?;
    final responses = components == null
        ? null
        : components['responses'] as Map<String, dynamic>?;

    if (responses == null) {
      return '';
    }

    var result = <String, dynamic>{};

    final allModelNames = components!.containsKey('schemas')
        ? (components['schemas'] as Map<String, dynamic>)
            .keys
            .map((e) => SwaggerModelsGenerator.getValidatedClassName(e))
        : <String>[];

    responses.keys.forEach((key) {
      if (!allModelNames.contains(key)) {
        final response = responses[key] as Map<String, dynamic>?;

        final content = response == null
            ? null
            : response['content'] as Map<String, dynamic>?;

        final firstContent = content == null
            ? null
            : content.entries.firstOrNull?.value as Map<String, dynamic>?;

        final schema = firstContent == null ? null : firstContent['schema'];

        if (schema != null && schema['\$ref'] == null) {
          result.addAll({key: schema});
        }
      }
    });

    return generateBase(dartCode, fileName, options, result, false);
  }

  @override
  String generateRequestBodies(
      String dartCode, String fileName, GeneratorOptions options) {
    final dynamic map = jsonDecode(dartCode);

    final components = map['components'] as Map<String, dynamic>?;
    final requestBodies = components == null
        ? null
        : components['requestBodies'] as Map<String, dynamic>?;

    if (requestBodies == null) {
      return '';
    }

    var result = <String, dynamic>{};

    final allModelNames = components!.containsKey('schemas')
        ? (components['schemas'] as Map<String, dynamic>)
            .keys
            .map((e) => SwaggerModelsGenerator.getValidatedClassName(e))
        : <String>[];

    requestBodies.keys.forEach((key) {
      if (!allModelNames.contains(key)) {
        final response = requestBodies[key] as Map<String, dynamic>?;

        final content = response == null
            ? null
            : response['content'] as Map<String, dynamic>;

        final firstContent = content == null
            ? null
            : content.entries.firstOrNull?.value as Map<String, dynamic>?;

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

    final components = swagger['components'] as Map<String, dynamic>?;

    final schemas = components == null
        ? null
        : components['schemas'] as Map<String, dynamic>?;

    final responses = components == null
        ? null
        : components['responses'] as Map<String, dynamic>?;

    final requestBodies = components == null
        ? null
        : components['requestBodies'] as Map<String, dynamic>?;

    if (schemas != null) {
      schemas.forEach((className, map) {
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

        Map<String, dynamic>? properties;

        if (mapMap.containsKey('allOf')) {
          final allOf = mapMap['allOf'] as List<dynamic>;
          var propertiesContainer = allOf.firstWhereOrNull(
                  (e) => (e as Map<String, dynamic>).containsKey('properties'))
              as Map<String, dynamic>?;

          if (propertiesContainer != null) {
            properties =
                propertiesContainer['properties'] as Map<String, dynamic>?;
          } else {
            properties = map['properties'] as Map<String, dynamic>?;
          }
        } else {
          properties = map['properties'] as Map<String, dynamic>?;
        }

        if (properties == null) {
          return;
        }

        properties.forEach((propertyName, propertyValue) {
          var property = propertyValue as Map<String, dynamic>;

          if (property.containsKey('enum') ||
              (property['items'] != null &&
                  property['items']['enum'] != null)) {
            results.add(SwaggerModelsGenerator.getValidatedClassName(
                SwaggerEnumsGeneratorV3().generateEnumName(
                    SwaggerModelsGenerator.getValidatedClassName(className),
                    propertyName)));
          }
        });
      });
    }

    if (responses != null) {
      responses.forEach((className, map) {
        final response = responses[className];
        final content = response['content'] as Map<String, dynamic>?;
        final firstContent = content?.entries.firstOrNull?.value;
        final schema = firstContent == null ? null : firstContent['schema'];
        if (schema != null &&
            (schema as Map<String, dynamic>).containsKey('enum')) {
          results.add(className.capitalize);
          return;
        }
        final properties = schema == null
            ? null
            : schema['properties'] as Map<String, dynamic>?;

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

    if (requestBodies != null) {
      requestBodies.forEach((className, map) {
        final response = requestBodies[className];
        final content = response['content'] as Map<String, dynamic>;
        final firstContent = content.entries.firstOrNull?.value;
        final schema = firstContent == null ? null : firstContent['schema'];
        if (schema != null &&
            (schema as Map<String, dynamic>).containsKey('enum')) {
          results.add(className.capitalize);
          return;
        }
        final properties = schema == null
            ? null
            : schema['properties'] as Map<String, dynamic>?;

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
  List<String> getAllListEnumNames(String swaggerFile) {
    final results = SwaggerEnumsGenerator.getEnumNamesFromRequests(swaggerFile);

    final swagger = jsonDecode(swaggerFile);

    final components = swagger['components'] as Map<String, dynamic>?;

    final schemas = components == null
        ? null
        : components['schemas'] as Map<String, dynamic>?;

    if (schemas != null) {
      schemas.forEach((className, map) {
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
    if (map.containsKey('allOf')) {
      final allOf = map['allOf'] as List<dynamic>;
      final refItem = allOf
          .firstWhere((m) => (m as Map<String, dynamic>).containsKey('\$ref'));

      final ref = refItem['\$ref'].toString().split('/').last;

      final className = SwaggerModelsGenerator.getValidatedClassName(ref);

      return 'extends $className';
    }

    return '';
  }
}
