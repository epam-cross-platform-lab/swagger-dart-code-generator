import 'dart:convert';
import 'package:recase/recase.dart';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_models_generator.dart';
import 'package:swagger_dart_code_generator/src/code_generators/v3/swagger_enums_generator_v3.dart';
import 'package:swagger_dart_code_generator/src/extensions/string_extension.dart';
import 'package:swagger_dart_code_generator/src/models/generator_options.dart';
import 'package:meta/meta.dart';
import 'package:swagger_dart_code_generator/src/exception_words.dart';

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

  String genetateEnumFromJsonToJsonMethods(List<String> enumNames) {
    return enumNames.map((e) => generateEnumFromJsonToJson(e)).join('\n');
  }

  String generateEnumFromJsonToJson(String enumName) {
    final neededName = enumName.replaceFirst('enums.', '');
    return '''
String ${neededName.camelCase}ToJson(enums.$neededName ${neededName.camelCase}) {
  return enums.\$${neededName}Map[${neededName.camelCase}];
}

enums.$neededName ${neededName.camelCase}FromJson(String ${neededName.camelCase}) {
  return enums.\$${neededName}Map.entries
      .firstWhere((element) => element.value == ${neededName.camelCase})
      .key;
}

List<String> ${neededName.camelCase}ListToJson(
    List<enums.$neededName> ${neededName.camelCase}) {
  return ${neededName.camelCase}
      .map((e) => enums.\$${neededName}Map[e])
      .toList();
}

List<enums.$neededName> ${neededName.camelCase}ListFromJson(
    List<String> ${neededName.camelCase}) {
  return ${neededName.camelCase}
      .map((e) => ${neededName.camelCase}FromJson(e))
      .toList();
}
    ''';
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

  @visibleForTesting
  String generateConstructorPropertiesContent(Map<String, dynamic> entityMap) {
    if (entityMap == null) {
      return '';
    }

    final generatedConstructorParameters = entityMap.keys.map((String key) {
      final fieldName = SwaggerModelsGenerator.generateFieldName(key);
      return '\t\tthis.$fieldName,';
    }).join('\n');

    return '{\n${generatedConstructorParameters.toString()}\n\t}';
  }

  @visibleForTesting
  String generatePropertiesContent(
    Map<String, dynamic> propertiesMap,
    String className,
    List<DefaultValueMap> defaultValues,
    bool useDefaultNullForLists,
    List<String> allEnumNames,
  ) {
    if (propertiesMap == null) {
      return '';
    }

    final results = <String>[];

    for (var i = 0; i < propertiesMap.keys.length; i++) {
      var propertyName = propertiesMap.keys.elementAt(i);
      final propertyEntryMap =
          propertiesMap[propertyName] as Map<String, dynamic>;
      final propertyKey = propertyName;

      exceptionWords.forEach((String exceptionWord) {
        if (propertyName == exceptionWord) {
          propertyName = '\$' + propertyName;
        }
      });

      if (propertyEntryMap.containsKey('type')) {
        results.add(generatePropertyContentByType(
            propertyEntryMap,
            propertyName,
            propertyKey,
            className,
            defaultValues,
            useDefaultNullForLists,
            allEnumNames));
      } else if (propertyEntryMap['\$ref'] != null) {
        results.add(generatePropertyContentByRef(propertyEntryMap, propertyName,
            propertyKey, className, allEnumNames));
      } else if (propertyEntryMap['schema'] != null) {
        results.add(generatePropertyContentBySchema(propertyEntryMap,
            propertyName, propertyKey, className, allEnumNames));
      } else {
        results.add(generatePropertyContentByDefault(
            propertyEntryMap, propertyName, allEnumNames));
      }
    }

    return results.join('\n');
  }

  @visibleForTesting
  String generateGeneralPropertyContent(
      String propertyName,
      String propertyKey,
      String className,
      List<DefaultValueMap> defaultValues,
      Map<String, dynamic> val,
      List<String> allEnumNames) {
    var jsonKeyContent = "@JsonKey(name: '$propertyKey'";
    var typeName = getParameterTypeName(className, propertyName, val);

    final allEnumsNamesWithoutPrefix =
        allEnumNames.map((e) => e.replaceFirst('enums.', '')).toList();

    if (allEnumsNamesWithoutPrefix.contains(typeName)) {
      typeName = 'enums.$typeName';
    }

    final unknownEnumValue =
        generateUnknownEnumValue(allEnumNames, typeName, false);

    jsonKeyContent += unknownEnumValue;

    if (defaultValues
        .any((DefaultValueMap element) => element.typeName == typeName)) {
      final defaultValue = defaultValues.firstWhere(
          (DefaultValueMap element) => element.typeName == typeName);
      jsonKeyContent +=
          ', defaultValue: ${generateDefaultValueFromMap(defaultValue)}';
    }
    return '''  $jsonKeyContent)\n  final $typeName ${SwaggerModelsGenerator.generateFieldName(propertyName)};''';
  }

  @visibleForTesting
  String generatePropertyContentByType(
    Map<String, dynamic> propertyEntryMap,
    String propertyName,
    String propertyKey,
    String className,
    List<DefaultValueMap> defaultValues,
    bool useDefaultNullForLists,
    List<String> allEnumNames,
  ) {
    switch (propertyEntryMap['type'] as String) {
      case 'array':
        return generateListPropertyContent(propertyName, propertyKey, className,
            propertyEntryMap, useDefaultNullForLists, allEnumNames);
        break;
      case 'enum':
        return generateEnumPropertyContent(
            propertyName, className, allEnumNames);
        break;
      default:
        return generateGeneralPropertyContent(propertyName, propertyKey,
            className, defaultValues, propertyEntryMap, allEnumNames);
    }
  }
}
