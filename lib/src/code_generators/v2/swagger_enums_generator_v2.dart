import 'package:swagger_dart_code_generator/src/code_generators/swagger_enums_generator.dart';

class SwaggerEnumsGeneratorV2 extends SwaggerEnumsGenerator {
  @override
  String generate(Map<String, dynamic> map, String fileName) {
    final definitions = map['definitions'] as Map<String, dynamic>? ?? {};

    return generateFromMap(map, fileName, definitions, {}, {});
  }
}
