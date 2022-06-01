import 'package:swagger_dart_code_generator/src/code_generators/swagger_generator_base.dart';
import 'package:swagger_dart_code_generator/src/models/generator_options.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/responses/swagger_schema.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/swagger_root.dart';

class SwaggerSocketsGenerator extends SwaggerGeneratorBase {
  final GeneratorOptions _options;

  @override
  GeneratorOptions get options => _options;

  SwaggerSocketsGenerator(this._options);

  String generate(SwaggerRoot root, String fileName) {
    final definitions = root.definitions;
    return generateFromMap(root, fileName, definitions, {}, {});
  }

  String generateFromMap(
    SwaggerRoot root,
    String fileName,
    Map<String, SwaggerSchema> definitions,
    Map<String, SwaggerSchema> responses,
    Map<String, SwaggerSchema> requestBodies,
  ) {
    return '''
import 'package:json_annotation/json_annotation.dart';

    ''';
  }
}
