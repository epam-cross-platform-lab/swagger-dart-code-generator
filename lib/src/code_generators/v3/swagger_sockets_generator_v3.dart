import 'package:swagger_dart_code_generator/src/code_generators/swagger_sockets_generator.dart';
import 'package:swagger_dart_code_generator/src/models/generator_options.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/swagger_root.dart';

class SwaggerSocketsGeneratorV3 extends SwaggerSocketsGenerator {
  SwaggerSocketsGeneratorV3(GeneratorOptions options) : super(options);

  @override
  String generate(SwaggerRoot root, String fileName) {
    final definitions = root.definitions;
    return generateFromMap(root, fileName, definitions, {}, {});
  }
}
