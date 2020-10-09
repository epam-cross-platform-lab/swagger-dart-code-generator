import 'dart:convert';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_converter_generator.dart';
import 'package:swagger_dart_code_generator/src/code_generators/v2/swagger_models_generator_v2.dart';
import 'package:swagger_dart_code_generator/src/definitions.dart';
import 'package:swagger_dart_code_generator/src/extensions/string_extension.dart';
import 'package:recase/recase.dart';

class SwaggerConverterGeneratorV2 implements SwaggerConverterGenerator {
  @override
  String generate(String dartCode, String fileName) {
    return '''
final Map<Type, Object Function(Map<String, dynamic>)> ${fileName.pascalCase}$converterClassEnding = 
{
${_generateModelsMapping(dartCode)}};''';
  }

  String _generateModelsMapping(String dartCode) {
    final result = StringBuffer();
    final dynamic map = jsonDecode(dartCode);

    final definitions = map['definitions'] as Map<String, dynamic>;

    if (definitions == null) {
      return '';
    }

    for (var i = 0; i < definitions.keys.length; i++) {
      final key = definitions.keys.elementAt(i).toString();

      final validatedName =
          SwaggerModelsGeneratorV2().getValidatedClassName(key);

      result.writeln('\t$validatedName: $validatedName.fromJsonFactory,');
    }

    return result.toString();
  }
}
