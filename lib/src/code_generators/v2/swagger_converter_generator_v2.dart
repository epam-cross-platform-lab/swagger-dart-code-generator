import 'dart:convert';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_converter_generator.dart';
import 'package:swagger_dart_code_generator/src/definitions.dart';
import 'package:swagger_dart_code_generator/src/extensions/string_extension.dart';
import 'package:recase/recase.dart';

class SwaggerConverterGeneratorV2 implements SwaggerConverterGenerator {
  @override
  String generate(String dartCode, String fileName) {
    return '''
final ${fileName.pascalCase}$converterClassEnding = 
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

      result.writeln(
          '''\t${key.capitalize.pascalCase}: ${key.capitalize.pascalCase}.fromJsonFactory,''');
    }

    return result.toString();
  }
}
