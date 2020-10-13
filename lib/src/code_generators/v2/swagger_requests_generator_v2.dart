import 'dart:convert';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_requests_generator.dart';
import 'package:swagger_dart_code_generator/src/models/generator_options.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/requests/swagger_request.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/requests/swagger_request_parameter.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/swagger_path.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/swagger_root.dart';

class SwaggerRequestsGeneratorV2 extends SwaggerRequestsGenerator {
  @override
  String generate(String code, String className, String fileName,
      GeneratorOptions options) {
    unnamedMethodsCounter = 0;
    final map = jsonDecode(code) as Map<String, dynamic>;
    final swaggerRoot = SwaggerRoot.fromJson(map);

    //Link defined parameters with requests
    swaggerRoot.paths.forEach((SwaggerPath swaggerPath) {
      swaggerPath.requests.forEach((SwaggerRequest swaggerRequest) {
        swaggerRequest.parameters = swaggerRequest.parameters
            .map((SwaggerRequestParameter parameter) =>
                getNeededRequestParameter(parameter, swaggerRoot.parameters))
            .toList();
      });
    });

    final definitions = map['definitions'] as Map<String, dynamic>;

    return getFileContent(swaggerRoot, className, fileName, options,
        definitions != null && definitions.keys.isNotEmpty);
  }
}
