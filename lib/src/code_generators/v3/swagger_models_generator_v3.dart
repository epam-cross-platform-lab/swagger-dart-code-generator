import 'dart:convert';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_enums_generator.dart';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_models_generator.dart';
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
