import 'dart:convert';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_requests_generator.dart';
import 'package:swagger_dart_code_generator/src/code_generators/v2/swagger_models_generator_v2.dart';
import 'package:swagger_dart_code_generator/src/models/generator_options.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/requests/swagger_request.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/requests/swagger_request_parameter.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/swagger_path.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/swagger_root.dart';

class SwaggerRequestsGeneratorV2 extends SwaggerRequestsGenerator {
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
                getOriginalOrOverridenRequestParameter(
                    parameter, swaggerRoot.parameters))
            .toList();
      });
    });

    final definitions = map['definitions'] as Map<String, dynamic>;

    final allEnumNames = SwaggerModelsGeneratorV2().getAllEnumNames(code);

    return getFileContent(swaggerRoot, className, fileName, options,
        definitions != null && definitions.keys.isNotEmpty, allEnumNames, []);
  }
}
