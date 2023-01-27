import 'package:swagger_dart_code_generator/src/code_generators/enum_model.dart';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_enums_generator.dart';
import 'package:swagger_dart_code_generator/src/code_generators/v2/swagger_models_generator_v2.dart';
import 'package:swagger_dart_code_generator/src/models/generator_options.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/swagger_root.dart';

class SwaggerEnumsGeneratorV3 extends SwaggerEnumsGenerator {
  SwaggerEnumsGeneratorV3(GeneratorOptions options) : super(options);

  @override
  String generate({
    required SwaggerRoot root,
    required String fileName,
    required List<EnumModel> allEnums,
  }) {
    final components = root.components;
    final schemas = components?.schemas;

    final responses = components?.responses;

    final requestBodies = components?.requestBodies ?? {};

    requestBodies.addAll(
        SwaggerModelsGeneratorV2(options).getRequestBodiesFromRequests(root));

    return generateFromMap(
      root,
      fileName,
      schemas ?? {},
      responses ?? {},
      requestBodies,
      allEnums,
    );
  }
}
