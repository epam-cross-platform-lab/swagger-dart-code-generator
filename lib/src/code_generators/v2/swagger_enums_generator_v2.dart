import 'dart:convert';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_enums_generator.dart';

class SwaggerEnumsGeneratorV2 extends SwaggerEnumsGenerator {
  @override
  String generate(String dartCode, String fileName) {
    final dynamic map = jsonDecode(dartCode);

    final definitions = map['definitions'] as Map<String, dynamic>;

    return generateFromMap(dartCode, fileName, definitions, {}, {});
  }
}
