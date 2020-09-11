import 'dart:convert';
import 'package:swagger_generator/src/code_generators/swagger_converter_generator.dart';
import 'package:swagger_generator/src/definitions.dart';
import 'package:swagger_generator/src/extensions/string_extension.dart';
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
    final StringBuffer result = StringBuffer();
    final dynamic map = jsonDecode(dartCode);

    final Map<String, dynamic> definitions =
        map['definitions'] as Map<String, dynamic>;

    if (definitions == null) {
      return '';
    }

    for (int i = 0; i < definitions.keys.length; i++) {
      final String key = definitions.keys.elementAt(i).toString();

      result.writeln(
          '''\t${key.capitalize.pascalCase}: ${key.capitalize.pascalCase}.fromJsonFactory,''');
    }

    return result.toString();
  }
}
