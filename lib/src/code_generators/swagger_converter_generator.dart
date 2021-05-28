import 'dart:convert';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_models_generator.dart';
import 'package:swagger_dart_code_generator/src/definitions.dart';
import 'package:swagger_dart_code_generator/src/extensions/string_extension.dart';
import 'package:recase/recase.dart';
import 'package:swagger_dart_code_generator/src/models/generator_options.dart';

class SwaggerConverterGenerator {
  String generate(String dartCode, String fileName, GeneratorOptions options) {
    return '''
final Map<Type, Object Function(Map<String, dynamic>)> ${fileName.pascalCase}$converterClassEnding = 
{
${_generateModelsMapping(dartCode, options)}};''';
  }

  String _generateModelsMapping(String dartCode, GeneratorOptions options) {
    final result = <String>[];
    final dynamic map = jsonDecode(dartCode);

    final classes = getDefinitions(map);

    final classesFromResponses =
        SwaggerModelsGenerator.getClassesFromResponses(dartCode);

    classes.addAll(classesFromResponses);

    if (classes.isNotEmpty) {
      for (var i = 0; i < classes.keys.length; i++) {
        final key = classes.keys.elementAt(i).toString();

        final definition = classes[key];

        if (definition['enum'] != null) {
          continue;
        }

        if (SwaggerModelsGenerator.basicTypes
            .contains(definition['type'].toString().toLowerCase())) {
          continue;
        }

        if (definition['type'] == 'array' &&
            definition['items'] != null &&
            definition['items']['type'] == 'enum') {
          continue;
        }

        final validatedName =
            SwaggerModelsGenerator.getValidatedClassName(key) +
                options.modelPostfix;

        result.add('\t$validatedName: $validatedName.fromJsonFactory,');
      }
    }

    final responses = getResponses(map);
    if (responses.isNotEmpty) {
      responses.keys.forEach((key) {
        if (!result.contains(key)) {
          final response = responses[key] as Map<String, dynamic>?;

          final content = response == null
              ? null
              : response['content'] as Map<String, dynamic>;

          final firstContent = content == null || content.entries.isEmpty
              ? null
              : content.entries.first.value as Map<String, dynamic>?;

          final schema = firstContent == null
              ? null
              : firstContent['schema'] as Map<String, dynamic>;

          if (schema != null &&
              content!.entries.length == 1 &&
              !schema.containsKey('\$ref')) {
            final validatedName = key.capitalize;
            result.add('\t$validatedName: $validatedName.fromJsonFactory,');
          }
        }
      });
    }

    return result.join('\n');
  }

  Map<String, dynamic> getDefinitions(dynamic map) {
    if (map['definitions'] != null) {
      return map['definitions'] as Map<String, dynamic>? ?? {};
    }

    if (map['components'] != null) {
      return map['components']['schemas'] as Map<String, dynamic>? ?? {};
    }

    return {};
  }

  Map<String, dynamic> getResponses(dynamic map) {
    if (map['components'] != null) {
      return map['components']['responses'] as Map<String, dynamic>? ?? {};
    }

    return {};
  }
}
