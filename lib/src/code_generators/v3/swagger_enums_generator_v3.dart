import 'package:swagger_dart_code_generator/src/code_generators/swagger_enums_generator.dart';
import 'package:swagger_dart_code_generator/src/code_generators/v2/swagger_models_generator_v2.dart';
import 'package:swagger_dart_code_generator/src/models/generator_options.dart';

class SwaggerEnumsGeneratorV3 extends SwaggerEnumsGenerator {
  SwaggerEnumsGeneratorV3(GeneratorOptions options) : super(options);

  @override
  String generate(
    Map<String, dynamic> map,
    String fileName,
  ) {
    final components = map['components'] as Map<String, dynamic>?;
    final schemas = components == null
        ? null
        : components['schemas'] as Map<String, dynamic>?;

    final responses = components == null
        ? null
        : components['responses'] as Map<String, dynamic>?;

    final requestBodies = components == null
        ? <String, dynamic>{}
        : components['requestBodies'] as Map<String, dynamic>? ?? {};

    requestBodies.addAll(
        SwaggerModelsGeneratorV2(options).getRequestBodiesFromRequests(map));

    return generateFromMap(
      map,
      fileName,
      schemas ?? {},
      responses ?? {},
      requestBodies,
    );
  }
}
