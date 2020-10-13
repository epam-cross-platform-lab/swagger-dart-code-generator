import 'dart:convert';
import 'package:recase/recase.dart';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_models_generator.dart';
import 'package:swagger_dart_code_generator/src/code_generators/v3/swagger_enums_generator_v3.dart';
import 'package:swagger_dart_code_generator/src/extensions/string_extension.dart';
import 'package:swagger_dart_code_generator/src/models/generator_options.dart';
import 'package:meta/meta.dart';

class SwaggerModelsGeneratorV3 extends SwaggerModelsGenerator {
  @override
  String generate(String dartCode, String fileName, GeneratorOptions options) {
    final dynamic map = jsonDecode(dartCode);

    final components = map['components'] as Map<String, dynamic>;
    final schemas = components == null
        ? null
        : components['schemas'] as Map<String, dynamic>;

    final allEnumsNames = getAllEnumNames(schemas, dartCode);

    final generatedEnumFromJsonToJson =
        genetateEnumFromJsonToJsonMethods(allEnumsNames);

    if (schemas == null) {
      return '';
    }

    final generatedClasses = schemas.keys.map((String className) {
      return generateModelClassContent(
          className.pascalCase,
          schemas[className] as Map<String, dynamic>,
          schemas,
          options.defaultValuesMap,
          options.useDefaultNullForLists,
          allEnumsNames);
    }).join('\n');

    return '$generatedClasses\n$generatedEnumFromJsonToJson';
  }

  List<String> getAllEnumNames(
      Map<String, dynamic> schemas, String swaggerFile) {
    final results = SwaggerEnumsGeneratorV3().getEnumNames(swaggerFile);

    if (schemas == null) {
      return results;
    }

    schemas.forEach((className, map) {
      if ((map as Map<String, dynamic>).containsKey('enum')) {
        results.add(className.capitalize);
        return;
      }
      final properties = map['properties'] as Map<String, dynamic>;

      if (properties == null) {
        return;
      }

      properties.forEach((propertyName, propertyValue) {
        var property = propertyValue as Map<String, dynamic>;

        if (property.containsKey('enum') ||
            (property['items'] != null && property['items']['enum'] != null)) {
          results.add(SwaggerEnumsGeneratorV3()
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
  Map<String, dynamic> getModelProperties(Map<String, dynamic> modelMap) {
    if (!modelMap.containsKey('allOf')) {
      return modelMap['properties'] as Map<String, dynamic>;
    }

    final allOf = modelMap['allOf'] as List<dynamic>;
    final newModelMap = allOf.firstWhere(
        (m) => (m as Map<String, dynamic>).containsKey('properties'));

    final currentProperties = newModelMap['properties'] as Map<String, dynamic>;

    return currentProperties;
  }

  @visibleForTesting
  String generateModelClassContent(
      String className,
      Map<String, dynamic> map,
      Map<String, dynamic> schemes,
      List<DefaultValueMap> defaultValues,
      bool useDefaultNullForLists,
      List<String> allEnumNames) {
    if (map['enum'] != null) {
      return '';
    }

    final properties = getModelProperties(map);

    var extendsString = '';

    if (map.containsKey('allOf')) {
      final allOf = map['allOf'] as List<dynamic>;
      final refItem = allOf
          .firstWhere((m) => (m as Map<String, dynamic>).containsKey('\$ref'));

      final ref = refItem['\$ref'].toString().split('/').last;

      extendsString = 'extends $ref';
    }

    final generatedConstructorProperties =
        generateConstructorPropertiesContent(properties);

    final generatedProperties = generatePropertiesContent(properties, className,
        defaultValues, useDefaultNullForLists, allEnumNames);

    final validatedClassName = getValidatedClassName(className);

    final generatedClass = '''
@JsonSerializable(explicitToJson: true)
class $validatedClassName $extendsString{
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
