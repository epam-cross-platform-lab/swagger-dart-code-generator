import 'package:swagger_dart_code_generator/src/code_generators/enum_model.dart';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_enums_generator.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/swagger_root.dart';

class SwaggerEnumsGeneratorV2 extends SwaggerEnumsGenerator {
  SwaggerEnumsGeneratorV2(super.options);

  @override
  String generate({
    required SwaggerRoot root,
    required String fileName,
    required List<EnumModel> allEnums,
  }) {
    final definitions = root.definitions;

    return generateFromMap(
      root,
      fileName,
      definitions,
      {},
      {},
      allEnums,
    );
  }
}
