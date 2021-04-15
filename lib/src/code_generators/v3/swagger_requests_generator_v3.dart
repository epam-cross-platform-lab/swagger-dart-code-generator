import 'dart:convert';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_enums_generator.dart';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_requests_generator.dart';
import 'package:swagger_dart_code_generator/src/code_generators/v3/swagger_models_generator_v3.dart';
import 'package:swagger_dart_code_generator/src/models/generator_options.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/requests/swagger_request.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/requests/swagger_request_parameter.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/swagger_path.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/swagger_root.dart';

import '../swagger_models_generator.dart';

class SwaggerRequestsGeneratorV3 extends SwaggerRequestsGenerator {
  @override
  String generate(String code, String className, String fileName,
      GeneratorOptions options) {
    final map = jsonDecode(code) as Map<String, dynamic>;
    final swaggerRoot = SwaggerRoot.fromJson(map);

    //Link defined parameters with requests
    swaggerRoot.paths.forEach((SwaggerPath swaggerPath) {
      swaggerPath.requests.forEach((SwaggerRequest swaggerRequest) {
        swaggerRequest.parameters = swaggerRequest.parameters
            .map((SwaggerRequestParameter parameter) =>
                SwaggerEnumsGenerator.getOriginalOrOverriddenRequestParameter(
                    parameter, swaggerRoot.components?.parameters ?? []))
            .toList();
      });
    });

    final components = map['components'] as Map<String, dynamic>?;
    final schemas = components != null
        ? components['schemas'] as Map<String, dynamic>?
        : null;

    final allEnumNames = SwaggerModelsGeneratorV3().getAllEnumNames(code);

    final dynamicResponses =
        SwaggerRequestsGenerator.getAllDynamicResponses(code);

    return getFileContent(
        swaggerRoot,
        code,
        className,
        fileName,
        options,
        schemas != null && schemas.keys.isNotEmpty,
        allEnumNames,
        dynamicResponses,
        SwaggerModelsGenerator.generateBasicTypesMapFromSchemas(schemas ?? {}));
  }
}
