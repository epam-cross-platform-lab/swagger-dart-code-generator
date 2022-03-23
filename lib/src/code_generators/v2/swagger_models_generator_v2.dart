import 'package:swagger_dart_code_generator/src/code_generators/swagger_models_generator.dart';
import 'package:swagger_dart_code_generator/src/extensions/string_extension.dart';
import 'package:swagger_dart_code_generator/src/models/generator_options.dart';

class SwaggerModelsGeneratorV2 extends SwaggerModelsGenerator {
  SwaggerModelsGeneratorV2(GeneratorOptions options) : super(options);

  @override
  String generate(Map<String, dynamic> map, String fileName) {
    final definitions = map['definitions'] as Map<String, dynamic>?;
    return generateBase(map, fileName, definitions ?? {}, true);
  }

  @override
  String generateResponses(Map<String, dynamic> map, String fileName) {
    return '';
  }

  @override
  String generateRequestBodies(Map<String, dynamic> map, String fileName) {
    return '';
  }

  @override
  List<String> getAllListEnumNames(Map<String, dynamic> map) {
    final results = getEnumNamesFromRequests(map);

    final definitions = map['definitions'] as Map<String, dynamic>?;

    if (definitions != null) {
      definitions.forEach((className, map) {
        final mapMap = map as Map<String, dynamic>;

        if (mapMap['type'] == 'array' &&
            mapMap['items'] != null &&
            mapMap['items']['enum'] != null) {
          results.add(getValidatedClassName(className.capitalize));
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
