import 'dart:convert';
import 'package:recase/recase.dart';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_models_generator.dart';
import 'package:swagger_dart_code_generator/src/code_generators/v2/swagger_enums_generator_v2.dart';
import 'package:swagger_dart_code_generator/src/models/generator_options.dart';
import 'package:meta/meta.dart';

class SwaggerModelsGeneratorV2 extends SwaggerModelsGenerator {
  @override
  String generate(String dartCode, String fileName, GeneratorOptions options) {
    final dynamic map = jsonDecode(dartCode);

    final definitions = map['definitions'] as Map<String, dynamic>;

    if (definitions == null) {
      return '';
    }

    final allEnumsNames = getAllEnumNames(definitions, dartCode);

    final generatedEnumFromJsonToJson =
        genetateEnumFromJsonToJsonMethods(allEnumsNames);

    final generatedClasses = definitions.keys.map((String className) {
      return generateModelClassContent(
          className.pascalCase,
          definitions[className] as Map<String, dynamic>,
          fileName,
          options.defaultValuesMap,
          options.useDefaultNullForLists,
          allEnumsNames);
    }).join('\n');

    return '$generatedClasses\n$generatedEnumFromJsonToJson';
  }

  List<String> getAllEnumNames(
      Map<String, dynamic> definitions, String swaggerFile) {
    final results = SwaggerEnumsGeneratorV2().getEnumNames(swaggerFile);

    if (definitions == null) {
      return results;
    }

    definitions.forEach((className, map) {
      final properties = map['properties'] as Map<String, dynamic>;

      if (properties == null) {
        return;
      }

      properties.forEach((propertyName, propertyValue) {
        var property = propertyValue as Map<String, dynamic>;

        if (property.containsKey('enum') ||
            (property['items'] != null && property['items']['enum'] != null)) {
          results.add(SwaggerEnumsGeneratorV2()
              .generateEnumName(className, propertyName));
        }
      });
    });

    final resultsWithPrefix = results.map((element) {
      return 'enums.$element';
    }).toList();

    return resultsWithPrefix;
  }

  @visibleForTesting
  String generateModelClassContent(
    String className,
    Map<String, dynamic> map,
    String fileName,
    List<DefaultValueMap> defaultValues,
    bool useDefaultNullForLists,
    List<String> allEnumNames,
  ) {
    final properties = map['properties'] as Map<String, dynamic>;
    final generatedConstructorProperties =
        generateConstructorPropertiesContent(properties);

    final generatedProperties = generatePropertiesContent(properties, className,
        defaultValues, useDefaultNullForLists, allEnumNames);

    final validatedClassName = getValidatedClassName(className);

    final generatedClass = '''
@JsonSerializable(explicitToJson: true)
class $validatedClassName{
\t$validatedClassName($generatedConstructorProperties);\n
\tfactory $validatedClassName.fromJson(Map<String, dynamic> json) => _\$${validatedClassName}FromJson(json);\n
$generatedProperties
\tstatic const fromJsonFactory = _\$${validatedClassName}FromJson;
\tstatic const toJsonFactory = _\$${validatedClassName}ToJson;
\tMap<String, dynamic> toJson() => _\$${validatedClassName}ToJson(this);
}
''';

    return generatedClass;
  }
}
