import 'dart:convert';
import 'package:recase/recase.dart';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_models_generator.dart';
import 'package:swagger_dart_code_generator/src/code_generators/v3/swagger_enums_generator_v3.dart';
import 'package:swagger_dart_code_generator/src/extensions/string_extension.dart';
import 'package:swagger_dart_code_generator/src/models/generator_options.dart';
import 'package:meta/meta.dart';
import 'package:swagger_dart_code_generator/src/exception_words.dart';

class SwaggerModelsGeneratorV3 implements SwaggerModelsGenerator {
  static const String defaultEnumValueName = 'swaggerGeneratedUnknown';

  @override
  String generate(String dartCode, String fileName, GeneratorOptions options) {
    final dynamic map = jsonDecode(dartCode);

    final generatedEnums =
        SwaggerEnumsGeneratorV3().generate(dartCode, fileName);

    final components = map['components'] as Map<String, dynamic>;
    final schemas = components == null
        ? null
        : components['schemas'] as Map<String, dynamic>;

    final allEnumsNames = getAllEnumNames(schemas, dartCode);

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

    return '$generatedClasses$generatedEnums';
  }

  List<String> getAllEnumNames(
      Map<String, dynamic> schemas, String swaggerFile) {
    final results = SwaggerEnumsGeneratorV3().getEnumNames(swaggerFile);

    if (schemas == null) {
      return results;
    }

    schemas.forEach((className, map) {
      if ((map as Map<String, dynamic>).containsKey('enum')) {
        results.add(className);
        return;
      }
      final properties = map['properties'] as Map<String, dynamic>;

      if (properties == null) {
        return;
      }

      properties.forEach((propertyName, propertyValue) {
        var property = propertyValue as Map<String, dynamic>;

        if (property.containsKey('enum')) {
          results.add(generateEnumName(className, propertyName));
        }
      });
    });

    return results;
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
      return generateEnumContentIfPossible(map, className);
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

    final enums = generateEnumsContent(properties, className);

    final generatedClass = '''
@JsonSerializable(explicitToJson: true)
class $className $extendsString{
\t$className($generatedConstructorProperties);\n
\tfactory $className.fromJson(Map<String, dynamic> json) => _\$${className}FromJson(json);\n
$generatedProperties
\tstatic const fromJsonFactory = _\$${className}FromJson;
\tstatic const toJsonFactory = _\$${className}ToJson;
\tMap<String, dynamic> toJson() => _\$${className}ToJson(this);
}

$enums
''';

    return generatedClass;
  }

  @visibleForTesting
  String generateConstructorPropertiesContent(Map<String, dynamic> entityMap) {
    if (entityMap == null) {
      return '';
    }

    final generatedConstructorParameters = entityMap.keys.map((String key) {
      final fieldName = generateFieldName(key);
      return '\t\tthis.$fieldName,';
    }).join('\n');

    return '{\n${generatedConstructorParameters.toString()}\n\t}';
  }

  @visibleForTesting
  String generateEnumsContent(Map<String, dynamic> map, String className) {
    if (map == null) {
      return '';
    }

    final gemeratedEnumsContent = map.keys
        .map((String key) {
          final enumValuesMap = map[key] as Map<String, dynamic>;

          if (enumValuesMap.containsKey('type')) {
            return generateEnumContentIfPossible(
                enumValuesMap, generateEnumName(className, key));
          }

          return '';
        })
        .where((String generatedEnum) => generatedEnum.isNotEmpty)
        .join('\n');

    return gemeratedEnumsContent;
  }

  @visibleForTesting
  String generateEnumName(String className, String enumName) {
    return '${className.capitalize}${enumName.capitalize}';
  }

  @visibleForTesting
  String generateEnumContentIfPossible(
      Map<String, dynamic> map, String enumName) {
    if (map['enum'] != null) {
      return """
enum ${enumName.capitalize} {
\t@JsonValue('$defaultEnumValueName')\n  $defaultEnumValueName,
${generateEnumValuesContent(map['enum'] as List<dynamic>)}
}
""";
    } else if (map['items'] != null) {
      return generateEnumContentIfPossible(
          map['items'] as Map<String, dynamic>, enumName);
    } else {
      return '';
    }
  }

  @visibleForTesting
  String generateEnumValuesContent(List<dynamic> values) {
    return values
        .map((dynamic e) =>
            "\t@JsonValue('${e.toString().replaceAll("\$", "\\\$")}')\n  ${getEnumFieldName(e)}")
        .join(',\n');
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
  String generateListPropertyContent(
      String propertyName,
      String propertyKey,
      String className,
      Map<String, dynamic> propertyEntryMap,
      bool useDefaultNullForLists,
      List<String> allEnumNames) {
    final dynamic items = propertyEntryMap['items'];

    String typeName;
    if (items != null) {
      typeName = items['originalRef'] as String;
    }

    typeName ??= getParameterTypeName(
        className, propertyName, items as Map<String, dynamic>);

    final unknownEnumValue = allEnumNames.contains(typeName)
        ? ', unknownEnumValue: $typeName.swaggerGeneratedUnknown'
        : '';

    final jsonKeyContent =
        "@JsonKey(name: '$propertyKey'${useDefaultNullForLists ? '' : ', defaultValue: <$typeName>[]'}$unknownEnumValue)\n";

    return '\t$jsonKeyContent  final List<$typeName> ${generateFieldName(propertyName)};';
  }

  @visibleForTesting
  String generateEnumPropertyContent(String key, String className) {
    return '''
  @JsonKey(unknownEnumValue: ${className.capitalize + key.capitalize}.swaggerGeneratedUnknown)
  final ${className.capitalize + key.capitalize} ${generateFieldName(key)};''';
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
    final typeName = getParameterTypeName(className, propertyName, val);

    final unknownEnumValue = allEnumNames.contains(typeName)
        ? ', unknownEnumValue: $typeName.swaggerGeneratedUnknown'
        : '';

    jsonKeyContent += unknownEnumValue;

    if (defaultValues
        .any((DefaultValueMap element) => element.typeName == typeName)) {
      final defaultValue = defaultValues.firstWhere(
          (DefaultValueMap element) => element.typeName == typeName);
      jsonKeyContent +=
          ', defaultValue: ${generateDefaultValueFromMap(defaultValue)}';
    }
    return '''  $jsonKeyContent)\n  final $typeName ${generateFieldName(propertyName)};''';
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
        return generateEnumPropertyContent(propertyName, className);
        break;
      default:
        return generateGeneralPropertyContent(propertyName, propertyKey,
            className, defaultValues, propertyEntryMap, allEnumNames);
    }
  }

  @visibleForTesting
  String generatePropertyContentByRef(
      Map<String, dynamic> propertyEntryMap,
      String propertyName,
      String propertyKey,
      String className,
      List<String> allEnumNames) {
    final parameterName = propertyEntryMap['\$ref'].toString().split('/').last;

    final typeName = getParameterTypeName(
        className, propertyName, propertyEntryMap, parameterName);

    final unknownEnumValue = allEnumNames.contains(typeName)
        ? ', unknownEnumValue: $typeName.swaggerGeneratedUnknown'
        : '';

    final jsonKeyContent = "@JsonKey(name: '$propertyKey'$unknownEnumValue";

    return '\t$jsonKeyContent)\n  final $typeName ${generateFieldName(propertyName)};';
  }

  @visibleForTesting
  String generatePropertyContentBySchema(
      Map<String, dynamic> propertyEntryMap,
      String propertyName,
      String propertyKey,
      String className,
      List<String> allEnumNames) {
    final propertySchema = propertyEntryMap['schema'] as Map<String, dynamic>;

    final parameterName = propertySchema['\$ref'].toString().split('/').last;

    final typeName = getParameterTypeName(
        className, propertyName, propertyEntryMap, parameterName);

    final unknownEnumValue = allEnumNames.contains(typeName)
        ? ', unknownEnumValue: $typeName.swaggerGeneratedUnknown'
        : '';

    final jsonKeyContent = "@JsonKey(name: '$propertyKey'$unknownEnumValue";

    return '\t$jsonKeyContent)\n\tfinal $typeName ${generateFieldName(propertyName)};';
  }

  @visibleForTesting
  String generatePropertyContentByDefault(Map<String, dynamic> propertyEntryMap,
      String propertyName, List<String> allEnumNames) {
    final typeName = propertyEntryMap['originalRef'] ?? 'dynamic';

    final unknownEnumValue = allEnumNames.contains(typeName)
        ? ', unknownEnumValue: $typeName.swaggerGeneratedUnknown'
        : '';

    final jsonKeyContent = "@JsonKey(name: '$propertyName'$unknownEnumValue";

    return '\t$jsonKeyContent)\n  final $typeName ${generateFieldName(propertyName)};';
  }

  @visibleForTesting
  String generateDefaultValueFromMap(DefaultValueMap map) {
    switch (map.typeName) {
      case 'int':
      case 'double':
      case 'bool':
        return map.defaultValue;
      default:
        return "'${map.defaultValue}'";
    }
  }

  static String generateRequestEnumName(
      String path, String requestType, String parameterName) {
    if (path == '/') {
      path = '\$';
    }

    path = path.split('{').map((e) => e.capitalize).join();
    path = path.split('}').map((e) => e.capitalize).join();

    final correctedPath = SwaggerModelsGeneratorV3.generateFieldName(path);

    return '${correctedPath.capitalize}${requestType.capitalize}${parameterName.capitalize}';
  }

  @visibleForTesting
  static String generateFieldName(String jsonKey) {
    final forbiddenCharacters = <String>['#'];
    jsonKey = jsonKey.camelCase;

    forbiddenCharacters.forEach((String element) {
      if (jsonKey.startsWith(element)) {
        jsonKey = '\$forbiddenFieldName';
      }
    });

    if (jsonKey.startsWith(RegExp('[0-9]')) ||
        exceptionWords.contains(jsonKey)) {
      jsonKey = '\$' + jsonKey;
    }
    return jsonKey;
  }

  @visibleForTesting
  String getParameterTypeName(
      String className, String parameterName, Map<String, dynamic> parameter,
      [String nameParameter]) {
    if (nameParameter != null) {
      return nameParameter.pascalCase;
    }

    if (parameter == null) {
      return 'Object';
    }

    if (parameter['\$ref'] != null) {
      return parameter['\$ref'].toString().split('/').last.pascalCase;
    }

    switch (parameter['type'] as String) {
      case 'integer':
        return 'int';
      case 'boolean':
        return 'bool';
      case 'string':
        if (parameter['format'] == 'date-time' ||
            parameter['format'] == 'date') {
          return 'DateTime';
        } else if (parameter['enum'] != null) {
          return generateEnumName(className, parameterName);
        }
        return 'String';
      case 'number':
        return 'double';
      case 'object':
        return 'Object';
      case 'array':
        final items = parameter['items'] as Map<String, dynamic>;
        return getParameterTypeName(className, parameterName, items);
      default:
        if (parameter['oneOf'] != null) {
          return 'Object';
        }
        return 'undefinedType';
    }
  }

  @visibleForTesting
  String getEnumFieldName(dynamic dynamicName) {
    var name = dynamicName.toString();

    return SwaggerEnumsGeneratorV3().getValidatedEnumFieldName(name);
  }
}
