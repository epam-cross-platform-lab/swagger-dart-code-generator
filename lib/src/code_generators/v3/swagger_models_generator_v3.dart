import 'dart:convert';
import 'package:recase/recase.dart';
import 'package:swagger_dart_code_generator/src/code_generators/constants.dart';
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

  Map<String, dynamic> _getRequestBodiesFromRequests(String dartCode) {
    final root = jsonDecode(dartCode) as Map<String, dynamic>;

    final paths = root['paths'] as Map<String, dynamic>?;

    if (paths == null) {
      return {};
    }

    final result = <String, dynamic>{};

    paths.forEach((pathKey, pathValue) {
      final requests = pathValue as Map<String, dynamic>;

      requests.forEach((requestKey, requestValue) {
        if (!supportedRequestTypes.contains(requestKey)) {
          return;
        }

        final requestBody =
            requestValue['requestBody'] as Map<String, dynamic>?;

        if (requestBody != null) {
          final content = requestBody['content'] as Map<String, dynamic>?;
          if (content != null) {
            final appJson = content.values.first as Map<String, dynamic>?;
            if (appJson != null) {
              final schema = appJson['schema'] as Map<String, dynamic>?;

              if (schema != null) {
                if (schema['type'] == 'object' &&
                    schema.containsKey('properties')) {
                  final className =
                      '${pathKey.pascalCase}${requestKey.pascalCase}\$$kRequestBody';

                  result[SwaggerModelsGenerator.getValidatedClassName(
                      className)] = requestBody;
                }
              }
            }
          }
        }
      });
    });

    return result;
  }

  @override
  String generateRequestBodies(
      String dartCode, String fileName, GeneratorOptions options) {
    final dynamic map = jsonDecode(dartCode);

    final components = map['components'] as Map<String, dynamic>?;
    final requestBodies = components == null
        ? <String, dynamic>{}
        : components['requestBodies'] as Map<String, dynamic>? ??
            <String, dynamic>{};

    requestBodies.addAll(_getRequestBodiesFromRequests(dartCode));

    if (requestBodies.isEmpty) {
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
