import 'package:swagger_dart_code_generator/src/models/generator_options.dart';
import 'package:recase/recase.dart';
import 'package:swagger_dart_code_generator/src/code_generators/v2/swagger_enums_generator_v2.dart';
import 'package:swagger_dart_code_generator/src/extensions/string_extension.dart';
import 'package:swagger_dart_code_generator/src/exception_words.dart';

abstract class SwaggerModelsGenerator {
  final List<String> _keyClasses = ['Response', 'Request'];

  String generate(String dartCode, String fileName, GeneratorOptions options);

  String getValidatedClassName(String className) {
    final result = className.pascalCase;

    if (_keyClasses.contains(result)) {
      return '$result\$';
    }

    return result;
  }

  String getParameterTypeName(
      String className, String parameterName, Map<String, dynamic> parameter,
      [String refNameParameter]) {
    if (refNameParameter != null) {
      return refNameParameter.pascalCase;
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
          return 'enums.${SwaggerEnumsGeneratorV2().generateEnumName(className, parameterName)}';
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

  static String generateRequestEnumName(
      String path, String requestType, String parameterName) {
    if (path == '/') {
      path = '\$';
    }

    path = path.split('{').map((e) => e.capitalize).join();
    path = path.split('}').map((e) => e.capitalize).join();

    final correctedPath = generateFieldName(path);

    return '${correctedPath.capitalize}${requestType.capitalize}${parameterName.capitalize}';
  }

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

  String generatePropertyContentByDefault(Map<String, dynamic> propertyEntryMap,
      String propertyName, List<String> allEnumNames) {
    final typeName = propertyEntryMap['originalRef'] ?? 'dynamic';

    final unknownEnumValue =
        generateUnknownEnumValue(allEnumNames, typeName.toString(), false);

    final jsonKeyContent = "@JsonKey(name: '$propertyName'$unknownEnumValue)\n";
    return '\t$jsonKeyContent\tfinal $typeName ${SwaggerModelsGenerator.generateFieldName(propertyName)};';
  }

  String generateUnknownEnumValue(
      List<String> allEnumNames, String typeName, bool isList) {
    var unknownEnumValue = allEnumNames.contains(typeName)
        ? ', unknownEnumValue: $typeName.swaggerGeneratedUnknown'
        : '';

    if (unknownEnumValue.isNotEmpty) {
      if (!isList) {
        final enumNameCamelCase = typeName.replaceAll('enums.', '').camelCase;
        final toJsonFromJson =
            ', toJson: ${enumNameCamelCase}ToJson, fromJson: ${enumNameCamelCase}FromJson';

        unknownEnumValue += toJsonFromJson;
      } else {
        final enumNameCamelCase = typeName.replaceAll('enums.', '').camelCase;
        final toJsonFromJson =
            ', toJson: ${enumNameCamelCase}ListToJson, fromJson: ${enumNameCamelCase}ListFromJson';

        unknownEnumValue += toJsonFromJson;
      }
    }

    return unknownEnumValue;
  }

  String generatePropertyContentBySchema(
      Map<String, dynamic> propertyEntryMap,
      String propertyName,
      String propertyKey,
      String className,
      List<String> allEnumNames) {
    final propertySchema = propertyEntryMap['schema'] as Map<String, dynamic>;
    final parameterName = propertySchema['\$ref'].toString().split('/').last;

    var typeName = getParameterTypeName(
        className, propertyName, propertyEntryMap, parameterName);

    final allEnumsNamesWithoutPrefix =
        allEnumNames.map((e) => e.replaceFirst('enums.', '')).toList();

    if (allEnumsNamesWithoutPrefix.contains(typeName)) {
      typeName = 'enums.$typeName';
    }

    final unknownEnumValue =
        generateUnknownEnumValue(allEnumNames, typeName, false);

    final jsonKeyContent = "@JsonKey(name: '$propertyKey'$unknownEnumValue)\n";

    return '\t$jsonKeyContent\tfinal $typeName ${SwaggerModelsGenerator.generateFieldName(propertyName)};';
  }

  String generatePropertyContentByRef(
      Map<String, dynamic> propertyEntryMap,
      String propertyName,
      String propertyKey,
      String className,
      List<String> allEnumNames) {
    final parameterName = propertyEntryMap['\$ref'].toString().split('/').last;
    var typeName = getParameterTypeName(
        className, propertyName, propertyEntryMap, parameterName);

    final allEnumsNamesWithoutPrefix =
        allEnumNames.map((e) => e.replaceFirst('enums.', '')).toList();

    if (allEnumsNamesWithoutPrefix.contains(typeName)) {
      typeName = 'enums.$typeName';
    }

    final unknownEnumValue =
        generateUnknownEnumValue(allEnumNames, typeName, false);

    final jsonKeyContent = "@JsonKey(name: '$propertyKey'$unknownEnumValue)\n";

    return '\t$jsonKeyContent\tfinal $typeName ${SwaggerModelsGenerator.generateFieldName(propertyName)};';
  }

  String generateEnumPropertyContent(
      String key, String className, List<String> allEnumNames) {
    final enumName = SwaggerEnumsGeneratorV2().generateEnumName(className, key);

    allEnumNames.add(enumName);

    final unknownEnumValue =
        generateUnknownEnumValue(allEnumNames, enumName, false);
    return '''
  @JsonKey($unknownEnumValue)
  final ${className.capitalize + key.capitalize} ${SwaggerModelsGenerator.generateFieldName(key)};''';
  }

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

    final unknownEnumValue =
        generateUnknownEnumValue(allEnumNames, typeName, true);

    final jsonKeyContent =
        "@JsonKey(name: '$propertyKey'${useDefaultNullForLists ? '' : ', defaultValue: <$typeName>[]'}$unknownEnumValue)\n";

    return '''  $jsonKeyContent  final List<$typeName> ${SwaggerModelsGenerator.generateFieldName(propertyName)};''';
  }
}
