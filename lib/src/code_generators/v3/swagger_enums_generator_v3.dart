import 'dart:convert';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_enums_generator.dart';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_models_generator.dart';

class SwaggerEnumsGeneratorV3 extends SwaggerEnumsGenerator {
  @override
  String generate(String dartCode, String fileName) {
    final map = jsonDecode(dartCode) as Map<String, dynamic>;

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

    requestBodies
        .addAll(SwaggerModelsGenerator.getRequestBodiesFromRequests(map));

    return generateFromMap(
      dartCode,
      fileName,
      schemas ?? {},
      responses ?? {},
      requestBodies,
    );
  }
}
