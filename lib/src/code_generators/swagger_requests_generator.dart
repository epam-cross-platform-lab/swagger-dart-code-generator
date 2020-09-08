import 'package:swagger_generator/src/models/generator_options.dart';

abstract class SwaggerRequestsGenerator {
  String generate(
      String code, String className, String fileName, GeneratorOptions options);
}
