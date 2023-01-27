import 'package:swagger_dart_code_generator/src/code_generators/enum_model.dart';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_models_generator.dart';
import 'package:swagger_dart_code_generator/src/extensions/string_extension.dart';
import 'package:swagger_dart_code_generator/src/models/generator_options.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/responses/swagger_schema.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/swagger_root.dart';

class SwaggerModelsGeneratorV2 extends SwaggerModelsGenerator {
  SwaggerModelsGeneratorV2(GeneratorOptions options) : super(options);

  @override
  String generate({
    required SwaggerRoot root,
    required String fileName,
    required List<EnumModel> allEnums,
  }) {
    final definitions = root.definitions;
    return generateBase(
      root: root,
      fileName: fileName,
      classes: definitions,
      generateEnumsMethods: true,
      allEnums: allEnums,
    );
  }

  @override
  String generateResponses({
    required SwaggerRoot root,
    required String fileName,
    required List<EnumModel> allEnums,
  }) {
    return '';
  }

  @override
  String generateRequestBodies({
    required SwaggerRoot root,
    required String fileName,
    required List<EnumModel> allEnums,
  }) {
    return '';
  }

  @override
  List<String> getAllListEnumNames(SwaggerRoot root) {
    final results = getEnumsFromRequests(root).map((e) => e.name).toList();

    final definitions = root.definitions;

    definitions.forEach((className, definition) {
      if (definition.isListEnum) {
        results.add(getValidatedClassName(className.capitalize));
        return;
      }
    });

    final resultsWithPrefix = results.map((element) {
      return 'enums.$element';
    }).toList();

    return resultsWithPrefix;
  }

  @override
  String getExtendsString(SwaggerSchema schema) {
    return '';
  }
}
