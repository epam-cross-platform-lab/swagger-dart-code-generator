import 'package:swagger_dart_code_generator/src/models/generator_options.dart';

abstract class SwaggerModelsGenerator {
  String generate(String dartCode, String fileName, GeneratorOptions options);
}
