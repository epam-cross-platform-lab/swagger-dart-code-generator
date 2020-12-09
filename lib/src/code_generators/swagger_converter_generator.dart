import 'dart:convert';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_models_generator.dart';
import 'package:swagger_dart_code_generator/src/code_generators/v2/swagger_models_generator_v2.dart';
import 'package:swagger_dart_code_generator/src/definitions.dart';
import 'package:swagger_dart_code_generator/src/extensions/string_extension.dart';
import 'package:recase/recase.dart';

class SwaggerConverterGenerator {
  String generate(String dartCode, String fileName) {
    return '''
final Map<Type, Object Function(Map<String, dynamic>)> ${fileName.pascalCase}$converterClassEnding = 
{
${_generateModelsMapping(dartCode)}};''';
  }

  String _generateModelsMapping(String dartCode) {
    final result = <String>[];
    final dynamic map = jsonDecode(dartCode);

    final definitions = getDefinitions(map);

    if (definitions != null) {
      for (var i = 0; i < definitions.keys.length; i++) {
        final key = definitions.keys.elementAt(i).toString();

        if (definitions[key]['enum'] != null) {
          continue;
        }

        final validatedName = SwaggerModelsGenerator.getValidatedClassName(key);

        result.add('\t$validatedName: $validatedName.fromJsonFactory,');
      }
    }

    final responses = getResponses(map);
    if (responses != null) {
      responses.keys.forEach((key) {
        if (!result.contains(key)) {
          final response = responses[key] as Map<String, dynamic>;

          final content = response == null
              ? null
              : response['content'] as Map<String, dynamic>;

          final firstContent = content == null
              ? null
              : content.entries?.first?.value as Map<String, dynamic>;

          final schema = firstContent == null
              ? null
              : firstContent['schema'] as Map<String, dynamic>;

          if (schema != null &&
              content.entries.length == 1 &&
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
      return map['definitions'] as Map<String, dynamic>;
    }

    if (map['components'] != null) {
      return map['components']['schemas'] as Map<String, dynamic>;
    }

    return null;
  }

  Map<String, dynamic> getResponses(dynamic map) {
    if (map['components'] != null) {
      return map['components']['responses'] as Map<String, dynamic>;
    }

    return null;
  }
}
