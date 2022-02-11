import 'package:swagger_dart_code_generator/src/code_generators/swagger_enums_generator.dart';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_models_generator.dart';
import 'package:swagger_dart_code_generator/src/extensions/string_extension.dart';
import 'package:swagger_dart_code_generator/src/models/generator_options.dart';

class SwaggerModelsGeneratorV2 extends SwaggerModelsGenerator {
  @override
  String generate(
      Map<String, dynamic> map, String fileName, GeneratorOptions options) {
    final definitions = map['definitions'] as Map<String, dynamic>?;
    return generateBase(map, fileName, options, definitions ?? {}, true);
  }

  @override
  String generateResponses(
      Map<String, dynamic> map, String fileName, GeneratorOptions options) {
    return '';
  }

  @override
  String generateRequestBodies(
      Map<String, dynamic> map, String fileName, GeneratorOptions options) {
    return '';
  }

  @override
  List<String> getAllListEnumNames(Map<String, dynamic> map) {
    final results = SwaggerEnumsGenerator.getEnumNamesFromRequests(map);

    final definitions = map['definitions'] as Map<String, dynamic>?;

    if (definitions != null) {
      definitions.forEach((className, map) {
        final mapMap = map as Map<String, dynamic>;

        if (mapMap['type'] == 'array' &&
            mapMap['items'] != null &&
            mapMap['items']['enum'] != null) {
          results.add(SwaggerModelsGenerator.getValidatedClassName(
              className.capitalize));
          return;
        }
      });
    }

    final resultsWithPrefix = results.map((element) {
      return 'enums.$element';
    }).toList();

    return resultsWithPrefix;
  }

  @override
  String getExtendsString(Map<String, dynamic> map) {
    return '';
  }
}
