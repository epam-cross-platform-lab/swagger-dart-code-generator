import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:swagger_dart_code_generator/src/code_generators/constants.dart';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_enums_generator.dart';
import 'package:swagger_dart_code_generator/src/code_generators/v3/swagger_enums_generator_v3.dart';
import 'package:swagger_dart_code_generator/src/models/generator_options.dart';
import 'package:recase/recase.dart';
import 'package:swagger_dart_code_generator/src/code_generators/v2/swagger_enums_generator_v2.dart';
import 'package:swagger_dart_code_generator/src/extensions/string_extension.dart';
import 'package:swagger_dart_code_generator/src/exception_words.dart';

import 'constants.dart';

abstract class SwaggerModelsGenerator {
  String generate(String dartCode, String fileName, GeneratorOptions options);
  String generateResponses(
      String dartCode, String fileName, GeneratorOptions options);

  String generateRequestBodies(
      String dartCode, String fileName, GeneratorOptions options);
  String getExtendsString(Map<String, dynamic> map);
  List<String> getAllListEnumNames(String swaggerFile);

  String generateModelClassContent(
      String swaggerFile,
      String className,
      Map<String, dynamic> map,
      Map<String, dynamic> schemas,
      List<DefaultValueMap> defaultValues,
      bool useDefaultNullForLists,
      List<String> allEnumNames,
      List<String> allEnumListNames,
      GeneratorOptions options) {
    if (map['enum'] != null) {
      return '';
    }

    if (kBasicTypes.contains(map['type'].toString().toLowerCase())) {
      return '';
    }

    if (map['type'] == 'array' &&
        map['items'] != null &&
        map['items']['type'] == 'enum') {
      return '';
    }

    if (map.containsKey('\$ref')) {
      return 'class $className {}';
    }

    return generateModelClassString(
      swaggerFile,
      className,
      map,
      schemas,
      defaultValues,
      useDefaultNullForLists,
      allEnumNames,
      allEnumListNames,
      options,
    );
  }

  static Map<String, dynamic> getClassesFromInnerClasses(
    Map<String, dynamic> classes,
    GeneratorOptions options,
  ) {
    final result = <String, dynamic>{};

    classes.forEach((classKey, classValue) {
      final properties = classValue['properties'] as Map<String, dynamic>?;

      if (properties == null) {
        return;
      }

      properties.forEach((propertyKey, propertyValue) {
        final innerClassName =
            '${getValidatedClassName(classKey)}\$${getValidatedClassName(propertyKey)}';

        if (propertyValue['properties'] != null) {
          result[innerClassName] = propertyValue;
        }

        final items = propertyValue['items'] as Map<String, dynamic>?;

        if (items != null && items['properties'] != null) {
          result[innerClassName] = propertyValue;
        }
      });
    });

    if (result.isNotEmpty) {
      result.addAll(getClassesFromInnerClasses(result, options));
    }

    return result;
  }

  static Map<String, dynamic> getClassesFromResponses(
      String dartCode, GeneratorOptions options) {
    final swagger = jsonDecode(dartCode);

    final results = <String, dynamic>{};

    final paths = swagger['paths'] as Map<String, dynamic>?;
    if (paths == null) {
      return results;
    }

    paths.forEach((path, pathValue) {
      final requests = pathValue as Map<String, dynamic>;

      requests
          .removeWhere((key, value) => key == 'parameters' || key == 'summary');

      requests.forEach((request, requestValue) {
        if (!supportedRequestTypes.contains(request.toLowerCase())) {
          return;
        }

        if (options.excludePaths.isNotEmpty &&
            options.excludePaths
                .any((exclPath) => RegExp(exclPath).hasMatch(request))) {
          return;
        }

        if (options.includePaths.isNotEmpty &&
            !options.includePaths
                .any((inclPath) => RegExp(inclPath).hasMatch(request))) {
          return;
        }
        final responses = requestValue['responses'] as Map<String, dynamic>;

        final neededResponse = responses['200'];

        if (neededResponse != null &&
            neededResponse['schema'] != null &&
            neededResponse['schema']['type'] == 'object' &&
            neededResponse['schema']['properties'] != null) {
          final pathText = path.split('/').map((e) => e.pascalCase).join();
          final requestText = request.pascalCase;

          results['$pathText$requestText\$Response'] = neededResponse['schema'];
        }
      });
    });

    return results;
  }

  static Map<String, dynamic> getClassesFromSchemasResponses(
      String dartCode, GeneratorOptions options) {
    final swagger = jsonDecode(dartCode);

    final results = <String, dynamic>{};

    final components = swagger['components'] as Map<String, dynamic>?;
    if (components == null) {
      return results;
    }

    final responses = components['responses'] as Map<String, dynamic>?;

    if (responses == null) {
      return results;
    }

    return responses;
  }

  String generateBase(
      String dartCode,
      String fileName,
      GeneratorOptions options,
      Map<String, dynamic> classes,
      bool generateFromJsonToJsonForRequests) {
    final allEnumsNames = getAllEnumNames(dartCode);
    final allEnumListNames = getAllListEnumNames(dartCode);

    final generatedEnumFromJsonToJson = generateFromJsonToJsonForRequests
        ? genetateEnumFromJsonToJsonMethods(
            allEnumsNames, options.enumsCaseSensitive)
        : '';

    final classesFromResponses = getClassesFromResponses(dartCode, options);
    classes.addAll(classesFromResponses);

    final classesFromInnerClasses =
        getClassesFromInnerClasses(classes, options);

    classes.addAll(classesFromInnerClasses);

    if (classes.isEmpty) {
      return '';
    }

    final generatedClasses = classes.keys.map((String className) {
      if (classes['enum'] != null) {
        return '';
      }

      return generateModelClassContent(
        dartCode,
        className.pascalCase,
        classes[className] as Map<String, dynamic>,
        classes,
        options.defaultValuesMap,
        options.useDefaultNullForLists,
        allEnumsNames,
        allEnumListNames,
        options,
      );
    }).join('\n');

    var results = '$generatedClasses\n$generatedEnumFromJsonToJson';

    final listEnums = getAllListEnumNames(dartCode);

    for (var listEnum in listEnums) {
      results = results.replaceAll(' $listEnum ', ' List<$listEnum> ');
    }

    return results;
  }

  static String getValidatedClassName(String className) {
    if (kBasicTypes.contains(className)) {
      return className;
    }

    if (exceptionWords.contains(className)) {
      return 'Object';
    }

    if (className.isEmpty) {
      return className;
    }

    final isEnum = className.startsWith('enums.');

    if (isEnum) {
      className = className.substring(6);
    }

    final words = className.split('\$');

    final result = words
        .map((e) => e.pascalCase
            .split(RegExp(r'\W+|\_'))
            .map((String str) => str.capitalize)
            .join())
        .join('\$');

    if (kKeyClasses.contains(result)) {
      return '$result\$';
    }

    if (isEnum) {
      return 'enums.$result';
    }

    if (result.startsWith(RegExp('[0-9]'))) {
      return '\$$result';
    }

    return result;
  }

  static String getValidatedParameterName(String parameterName) {
    if (parameterName.isEmpty) {
      return parameterName;
    }

    final isEnum = parameterName.startsWith('enums.');

    if (isEnum) {
      parameterName = parameterName.substring(6);
    }

    final words = parameterName.split('\$');

    final result = words
        .map((e) => e
            .split(RegExp(r'\W+|\_'))
            .mapIndexed(
                (int index, String str) => index == 0 ? str : str.capitalize)
            .join())
        .join('\$');

    if (isEnum) {
      return 'enums.$result';
    }

    if (exceptionWords.contains(result.camelCase) ||
        kBasicTypes.contains(result.camelCase)) {
      return '\$$result';
    }

    if (result.isEmpty) {
      return kUndefinedParameter;
    }

    return result.camelCase;
  }

  String getParameterTypeName(
    String className,
    String parameterName,
    Map<String, dynamic> parameter,
    String modelPostfix,
    String? refNameParameter,
  ) {
    if (parameter['properties'] != null) {
      return '${getValidatedClassName(className)}\$${getValidatedClassName(parameterName)}$modelPostfix';
    }

    if (refNameParameter != null) {
      return refNameParameter.pascalCase;
    }

    if (parameter.isEmpty) {
      return 'Object';
    }

    if (parameter['\$ref'] != null) {
      return parameter['\$ref'].toString().split('/').last.pascalCase;
    }

    switch (parameter['type'] as String?) {
      case 'integer':
      case 'int':
        if (parameter['format'] == kInt64) {
          return kNum;
        }
        return 'int';
      case 'int32':
      case 'int64':
        return 'int';
      case 'boolean':
        return 'bool';
      case 'string':
        if (parameter['format'] == 'date-time' ||
            parameter['format'] == 'date') {
          return 'DateTime';
        } else if (parameter['enum'] != null) {
          return 'enums.${SwaggerModelsGenerator.getValidatedClassName(SwaggerEnumsGeneratorV2().generateEnumName(SwaggerModelsGenerator.getValidatedClassName(className), parameterName))}';
        }
        return 'String';
      case 'Date':
        return 'DateTime';
      case 'number':
        return 'double';
      case 'object':
        return 'Object';
      case 'array':
        final items = parameter['items'] as Map<String, dynamic>? ?? {};
        final typeName = getParameterTypeName(
            className, parameterName, items, modelPostfix, null);
        return 'List<$typeName>';
      default:
        return 'Object';
    }
  }

  static String generateFieldName(String jsonKey) {
    final forbiddenCharacters = <String>['#'];

    jsonKey = jsonKey.camelCase;

    for (var element in forbiddenCharacters) {
      if (jsonKey.startsWith(element)) {
        jsonKey = '\$forbiddenFieldName';
      }
    }

    if (jsonKey.startsWith(RegExp('[0-9]')) ||
        exceptionWords.contains(jsonKey)) {
      jsonKey = '\$' + jsonKey;
    }

    if (kBasicTypes.contains(jsonKey)) {
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

    final result =
        '${correctedPath.capitalize}${requestType.capitalize}${parameterName.capitalize}';

    return SwaggerModelsGenerator.getValidatedClassName(result);
  }

  static String generateRequestName(String path, String requestType) {
    if (path == '/') {
      path = '\$';
    }

    path = path.split('{').map((e) => e.capitalize).join();
    path = path.split('}').map((e) => e.capitalize).join();
    path = path.split(',').map((e) => e.capitalize).join();

    final correctedPath = SwaggerModelsGenerator.getValidatedClassName(path);

    return '${correctedPath.capitalize}${requestType.capitalize}'.camelCase;
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

  String generateIncludeIfNullString(GeneratorOptions options) {
    if (options.includeIfNull == null) {
      return '';
    }

    return ', includeIfNull: ${options.includeIfNull}';
  }

  String generatePropertyContentByDefault(
      Map<String, dynamic> propertyEntryMap,
      String propertyName,
      List<String> allEnumNames,
      List<String> allEnumListNames,
      GeneratorOptions options) {
    var typeName = '';
    final originalRef = propertyEntryMap['originalRef'];

    if (originalRef != null) {
      typeName =
          getValidatedClassName(propertyEntryMap['originalRef'].toString());
    }

    if (typeName.isEmpty) {
      typeName = kDynamic;
    }

    final unknownEnumValue = generateUnknownEnumValue(
        allEnumNames, allEnumListNames, typeName.toString(), false);

    final dateToJsonValue = generateToJsonForDate(propertyEntryMap);

    final includeIfNullString = generateIncludeIfNullString(options);

    if (typeName != kDynamic) {
      typeName += '?';
    }

    final jsonKeyContent =
        "@JsonKey(name: '$propertyName'$includeIfNullString$dateToJsonValue$unknownEnumValue)\n";
    return '\t$jsonKeyContent\tfinal $typeName ${SwaggerModelsGenerator.generateFieldName(propertyName)};';
  }

  String generateUnknownEnumValue(List<String> allEnumNames,
      List<String> allEnumListNames, String typeName, bool isList) {
    typeName = getValidatedClassName(typeName);

    if (allEnumListNames.contains(typeName)) {
      isList = true;
    }

    if (allEnumNames.contains(typeName)) {
      if (!isList) {
        final enumNameCamelCase = typeName.replaceAll('enums.', '').camelCase;
        return ', toJson: ${enumNameCamelCase}ToJson, fromJson: ${enumNameCamelCase}FromJson';
      } else {
        final enumNameCamelCase = typeName.replaceAll('enums.', '').camelCase;
        return ', toJson: ${enumNameCamelCase}ListToJson, fromJson: ${enumNameCamelCase}ListFromJson';
      }
    }

    return '';
  }

  String generateToJsonForDate(Map<String, dynamic> map) {
    final type = map['type']?.toString().toLowerCase();
    final format = map['format']?.toString().toLowerCase();

    final isDate = type == 'string' && format == 'date';

    if (isDate) {
      return ', toJson: _dateToJson';
    }

    return '';
  }

  String generatePropertyContentBySchema(
      Map<String, dynamic> propertyEntryMap,
      String propertyName,
      String propertyKey,
      String className,
      List<String> allEnumNames,
      List<String> allEnumListNames,
      GeneratorOptions options,
      Map<String, String> basicTypesMap) {
    final propertySchema = propertyEntryMap['schema'] as Map<String, dynamic>;
    var parameterName = propertySchema['\$ref'].toString().split('/').last;

    String typeName;
    if (basicTypesMap.containsKey(parameterName)) {
      typeName = basicTypesMap[parameterName]!;
    } else {
      typeName = getValidatedClassName(getParameterTypeName(className,
          propertyName, propertyEntryMap, options.modelPostfix, parameterName));
    }

    final includeIfNullString = generateIncludeIfNullString(options);

    final allEnumsNamesWithoutPrefix =
        allEnumNames.map((e) => e.replaceFirst('enums.', '')).toList();

    if (allEnumsNamesWithoutPrefix.contains(typeName)) {
      typeName = 'enums.$typeName';
    } else {
      typeName += options.modelPostfix;
    }

    final unknownEnumValue = generateUnknownEnumValue(
        allEnumNames, allEnumListNames, typeName, false);

    final dateToJsonValue = generateToJsonForDate(propertyEntryMap);

    final jsonKeyContent =
        "@JsonKey(name: '$propertyKey'$includeIfNullString$unknownEnumValue$dateToJsonValue)\n";

    return '\t$jsonKeyContent\tfinal $typeName? ${SwaggerModelsGenerator.generateFieldName(propertyName)};';
  }

  String generatePropertyContentByAllOf({
    required Map<String, dynamic> propertyEntryMap,
    required String propertyKey,
    required GeneratorOptions options,
    required List<String> allEnumNames,
    required List<String> allEnumListNames,
    required String propertyName,
  }) {
    final allOf = propertyEntryMap['allOf'] as List;
    String typeName;

    if (allOf.length != 1) {
      typeName = kDynamic;
    } else {
      typeName = SwaggerModelsGenerator.getValidatedClassName(
          allOf.first['\$ref'].toString().getRef());
    }

    final includeIfNullString = generateIncludeIfNullString(options);

    final unknownEnumValue = generateUnknownEnumValue(
        allEnumNames, allEnumListNames, typeName, false);

    final jsonKeyContent =
        "@JsonKey(name: '$propertyKey'$includeIfNullString$unknownEnumValue)\n";

    return '\t$jsonKeyContent\tfinal $typeName? $propertyName;';
  }

  String generatePropertyContentByRef(
      Map<String, dynamic> propertyEntryMap,
      String propertyName,
      String propertyKey,
      String className,
      List<String> allEnumNames,
      List<String> allEnumListNames,
      GeneratorOptions options,
      Map<String, String> basicTypesMap) {
    final parameterName = propertyEntryMap['\$ref'].toString().split('/').last;
    String typeName;
    if (basicTypesMap.containsKey(parameterName)) {
      typeName = basicTypesMap[parameterName]!;
    } else {
      typeName = getValidatedClassName(getParameterTypeName(className,
          propertyName, propertyEntryMap, options.modelPostfix, parameterName));

      typeName = SwaggerModelsGenerator.getValidatedClassName(typeName);
    }

    final allEnumsNamesWithoutPrefix =
        allEnumNames.map((e) => e.replaceFirst('enums.', '')).toList();

    if (allEnumsNamesWithoutPrefix.contains(typeName)) {
      typeName = 'enums.$typeName';
    } else if (!basicTypesMap.containsKey(parameterName) &&
        !allEnumListNames.contains(typeName)) {
      typeName += options.modelPostfix;
    }

    final unknownEnumValue = generateUnknownEnumValue(
        allEnumNames, allEnumListNames, typeName, false);

    if (allEnumListNames.contains(typeName)) {
      typeName = 'List<$typeName>';
    }

    final includeIfNullString = generateIncludeIfNullString(options);

    final jsonKeyContent =
        "@JsonKey(name: '$propertyKey'$includeIfNullString$unknownEnumValue)\n";

    return '\t$jsonKeyContent\tfinal $typeName? $propertyName;';
  }

  String generateEnumPropertyContent(
    String key,
    String className,
    List<String> allEnumNames,
    List<String> allEnumListNames,
    GeneratorOptions options,
  ) {
    final enumName = SwaggerModelsGenerator.getValidatedClassName(
        SwaggerEnumsGeneratorV2().generateEnumName(className, key));

    allEnumNames.add(enumName);

    final unknownEnumValue = generateUnknownEnumValue(
            allEnumNames, allEnumListNames, enumName, false)
        .substring(2);

    final includeIfNullString = generateIncludeIfNullString(options);

    return '''
  @JsonKey($unknownEnumValue$includeIfNullString)
  final ${className.capitalize + key.capitalize}? ${SwaggerModelsGenerator.generateFieldName(key)};''';
  }

  String _generateListPropertyTypeName({
    required List<String> allEnumNames,
    required List<String> allEnumListNames,
    required Map<String, dynamic> propertyEntryMap,
    required GeneratorOptions options,
    required Map<String, String> basicTypesMap,
    required String propertyName,
    required String className,
  }) {
    final items = propertyEntryMap['items'];

    var typeName = '';
    if (items != null) {
      typeName = getValidatedClassName(items['originalRef'] as String? ?? '');

      if (typeName.isNotEmpty &&
          !kBasicTypes.contains(typeName.toLowerCase())) {
        typeName += options.modelPostfix;
      }

      if (typeName.isEmpty) {
        final ref = items['\$ref'] as String?;
        if (ref?.isNotEmpty == true) {
          typeName = ref!.split('/').last;

          if (!allEnumListNames.contains(typeName) &&
              !allEnumNames.contains('enums.' + typeName) &&
              !basicTypesMap.containsKey(typeName)) {
            typeName += options.modelPostfix;
          }
        }

        if (basicTypesMap.containsKey(typeName)) {
          typeName = basicTypesMap[typeName]!;
        } else if (typeName.isNotEmpty && typeName != kDynamic) {
          typeName = typeName.pascalCase;
        }
      } else if (!allEnumNames.contains('enums.$typeName') &&
          !kBasicTypes.contains(typeName.toLowerCase())) {
        typeName = kBasicTypesMap[typeName] ?? typeName + options.modelPostfix;
      }

      if (typeName.isNotEmpty) {
        typeName = SwaggerModelsGenerator.getValidatedClassName(typeName);
      }

      if (typeName.isEmpty) {
        if (items['type'] == 'array' || items['items'] != null) {
          return _generateListPropertyTypeName(
            allEnumListNames: allEnumListNames,
            allEnumNames: allEnumNames,
            basicTypesMap: basicTypesMap,
            className: className,
            options: options,
            propertyEntryMap: items as Map<String, dynamic>,
            propertyName: propertyName,
          ).asList();
        }
      }

      if (allEnumNames.contains('enums.$typeName')) {
        typeName = 'enums.$typeName';
      }
    }

    if (typeName.isEmpty) {
      typeName = getParameterTypeName(
        className,
        propertyName,
        items as Map<String, dynamic>? ?? {},
        options.modelPostfix,
        null,
      );
    }

    return typeName;
  }

  String generateListPropertyContent(
      String propertyName,
      String propertyKey,
      String className,
      Map<String, dynamic> propertyEntryMap,
      bool useDefaultNullForLists,
      List<String> allEnumNames,
      List<String> allEnumListNames,
      GeneratorOptions options,
      Map<String, String> basicTypesMap) {
    final typeName = _generateListPropertyTypeName(
      allEnumListNames: allEnumListNames,
      allEnumNames: allEnumNames,
      basicTypesMap: basicTypesMap,
      className: className,
      options: options,
      propertyEntryMap: propertyEntryMap,
      propertyName: propertyName,
    );

    final unknownEnumValue = generateUnknownEnumValue(
        allEnumNames, allEnumListNames, typeName, true);

    final includeIfNullString = generateIncludeIfNullString(options);

    String jsonKeyContent;
    if (unknownEnumValue.isEmpty) {
      jsonKeyContent =
          "@JsonKey(name: '$propertyKey'$includeIfNullString${useDefaultNullForLists ? '' : ', defaultValue: <$typeName>[]'})\n";
    } else {
      jsonKeyContent =
          "@JsonKey(name: '$propertyKey'$includeIfNullString$unknownEnumValue)\n";
    }

    return '$jsonKeyContent  final List<$typeName>? ${SwaggerModelsGenerator.generateFieldName(propertyName)};';
  }

  String generateGeneralPropertyContent(
      String propertyName,
      String propertyKey,
      String className,
      List<DefaultValueMap> defaultValues,
      Map<String, dynamic> val,
      List<String> allEnumNames,
      List<String> allEnumListNames,
      GeneratorOptions options) {
    final includeIfNullString = generateIncludeIfNullString(options);

    var jsonKeyContent = "@JsonKey(name: '$propertyKey'$includeIfNullString";

    var typeName = '';

    if (val.containsKey(kAdditionalProperties)) {
      typeName = kMapStringDynamic;
    } else if (val['\$ref'] != null) {
      typeName = val['\$ref'].toString().split('/').last.pascalCase +
          options.modelPostfix;
    } else {
      typeName = getParameterTypeName(
        className,
        propertyName,
        val,
        options.modelPostfix,
        null,
      );
    }

    final allEnumsNamesWithoutPrefix =
        allEnumNames.map((e) => e.replaceFirst('enums.', '')).toList();

    if (allEnumsNamesWithoutPrefix.contains(typeName)) {
      typeName = 'enums.$typeName';
    }

    final unknownEnumValue = generateUnknownEnumValue(
        allEnumNames, allEnumListNames, typeName, false);

    final dateToJsonValue = generateToJsonForDate(val);

    jsonKeyContent += unknownEnumValue;
    jsonKeyContent += dateToJsonValue;

    if ((val['type'] == 'bool' || val['type'] == 'boolean') &&
        val['default'] != null) {
      jsonKeyContent += ', defaultValue: ${val['default']})\n';
    } else if (defaultValues
        .any((DefaultValueMap element) => element.typeName == typeName)) {
      final defaultValue = defaultValues.firstWhere(
          (DefaultValueMap element) => element.typeName == typeName);
      jsonKeyContent +=
          ', defaultValue: ${generateDefaultValueFromMap(defaultValue)})\n';
    } else {
      jsonKeyContent += ')\n';
    }

    if (typeName != kDynamic) {
      typeName += '?';
    }

    return '\t$jsonKeyContent  final $typeName $propertyName;';
  }

  String generatePropertyContentByType(
      Map<String, dynamic> propertyEntryMap,
      String propertyName,
      String propertyKey,
      String className,
      List<DefaultValueMap> defaultValues,
      bool useDefaultNullForLists,
      List<String> allEnumsNames,
      List<String> allEnumListNames,
      GeneratorOptions options,
      Map<String, String> basicTypesMap) {
    switch (propertyEntryMap['type'] as String) {
      case 'array':
        return generateListPropertyContent(
          propertyName,
          propertyKey,
          className,
          propertyEntryMap,
          useDefaultNullForLists,
          allEnumsNames,
          allEnumListNames,
          options,
          basicTypesMap,
        );
      case 'enum':
        return generateEnumPropertyContent(
          propertyName,
          className,
          allEnumsNames,
          allEnumListNames,
          options,
        );
      default:
        return generateGeneralPropertyContent(
          propertyName,
          propertyKey,
          className,
          defaultValues,
          propertyEntryMap,
          allEnumsNames,
          allEnumListNames,
          options,
        );
    }
  }

  String getParameterName(String name, List<String> names) {
    if (names.contains(name)) {
      final newName = '\$$name';
      return getParameterName(newName, names);
    }

    return name;
  }

  String generatePropertiesContent(
      String swagger,
      Map<String, dynamic> propertiesMap,
      Map<String, dynamic> schemas,
      String className,
      List<DefaultValueMap> defaultValues,
      bool useDefaultNullForLists,
      List<String> allEnumNames,
      List<String> allEnumListNames,
      GeneratorOptions options) {
    if (propertiesMap.isEmpty) {
      return '';
    }

    final results = <String>[];
    final propertyNames = <String>[];

    for (var i = 0; i < propertiesMap.keys.length; i++) {
      var propertyName = propertiesMap.keys.elementAt(i);

      final propertyEntry = propertiesMap[propertyName];
      final propertyEntryMap = propertyEntry is Map<String, dynamic>
          ? propertyEntry
          : <String, dynamic>{};

      final propertyKey = propertyName;

      final basicTypesMap = generateBasicTypesMapFromSchemas(swagger);

      propertyName = propertyName.asParameterName();

      propertyName = getParameterName(propertyName, propertyNames);

      propertyNames.add(propertyName);

      if (propertyEntryMap.containsKey('type')) {
        results.add(generatePropertyContentByType(
            propertyEntryMap,
            propertyName,
            propertyKey,
            className,
            defaultValues,
            useDefaultNullForLists,
            allEnumNames,
            allEnumListNames,
            options,
            basicTypesMap));
      } else if (propertyEntryMap['allOf'] != null) {
        results.add(generatePropertyContentByAllOf(
          propertyEntryMap: propertyEntryMap,
          allEnumListNames: allEnumListNames,
          allEnumNames: allEnumNames,
          options: options,
          propertyKey: propertyKey,
          propertyName: propertyName,
        ));
      } else if (propertyEntryMap['\$ref'] != null) {
        results.add(generatePropertyContentByRef(
            propertyEntryMap,
            propertyName,
            propertyKey,
            className,
            allEnumNames,
            allEnumListNames,
            options,
            basicTypesMap));
      } else if (propertyEntryMap['schema'] != null) {
        results.add(generatePropertyContentBySchema(
            propertyEntryMap,
            propertyName,
            propertyKey,
            className,
            allEnumNames,
            allEnumListNames,
            options,
            basicTypesMap));
      } else {
        results.add(generatePropertyContentByDefault(propertyEntryMap,
            propertyName, allEnumNames, allEnumListNames, options));
      }
    }

    return results.join('\n');
  }

  static Map<String, String> generateBasicTypesMapFromSchemas(
      String swaggerFile) {
    final result = <String, String>{};

    final swagger = jsonDecode(swaggerFile);

    final components = swagger['components'] as Map<String, dynamic>? ?? {};

    final definitions = swagger['definitions'] as Map<String, dynamic>? ?? {};

    final schemas = components['schemas'] as Map<String, dynamic>? ?? {};

    final responses = components['responses'] as Map<String, dynamic>? ?? {};

    schemas.addAll(definitions);
    schemas.addAll(responses);

    schemas.forEach((key, value) {
      if (kBasicTypes.contains(value['type'].toString().toLowerCase()) &&
          value['enum'] == null) {
        result.addAll({
          key: _mapBasicTypeToDartType(
              value['type'].toString(), value['format'].toString())
        });
      }

      if (value['type'] == kArray && value['items'] != null) {
        final ref = value['items']['\$ref'] as String? ?? '';

        if (result[ref.getUnformattedRef()] != null) {
          result[key] = result[ref.getUnformattedRef()]!.asList();
        } else if (ref.isNotEmpty) {
          result[key] = ref.getRef().asList();
        }
      }
    });

    return result;
  }

  static String _mapBasicTypeToDartType(String basicType, String format) {
    if (basicType.toLowerCase() == 'string' &&
        (format == 'date-time' || format == 'datetime')) {
      return 'DateTime';
    }
    switch (basicType.toLowerCase()) {
      case 'string':
        return 'String';
      case 'int':
      case 'integer':
        return 'int';
      case 'double':
      case 'number':
      case 'float':
        return 'double';
      case 'bool':
      case 'boolean':
        return 'bool';
      default:
        return '';
    }
  }

  String genetateEnumFromJsonToJsonMethods(
      List<String> enumNames, bool enumsCaseSensitive) {
    return enumNames
        .map((e) => generateEnumFromJsonToJson(e, enumsCaseSensitive))
        .join('\n');
  }

  String generateEnumFromJsonToJson(String enumName, bool enumsCaseSensitive) {
    final neededName = SwaggerModelsGenerator.getValidatedClassName(
        enumName.replaceFirst('enums.', ''));

    final toLowerCaseString = !enumsCaseSensitive ? '.toLowerCase()' : '';

    return '''
String? ${neededName.camelCase}ToJson(enums.$neededName? ${neededName.camelCase}) {
  return enums.\$${neededName}Map[${neededName.camelCase}];
}

enums.$neededName ${neededName.camelCase}FromJson(Object? ${neededName.camelCase}) {

if(${neededName.camelCase} is int)
  {
    return enums.\$${neededName}Map.entries
      .firstWhere((element) => element.value$toLowerCaseString == ${neededName.camelCase}.toString(),
      orElse: () => const MapEntry(enums.$neededName.swaggerGeneratedUnknown, ''))
      .key;
  }

if(${neededName.camelCase} is String)
  {
 return enums.\$${neededName}Map.entries
      .firstWhere((element) => element.value$toLowerCaseString == ${neededName.camelCase}$toLowerCaseString,
      orElse: () => const MapEntry(enums.$neededName.swaggerGeneratedUnknown, ''))
      .key;

      }
  
    return enums.$neededName.swaggerGeneratedUnknown;
}

List<String> ${neededName.camelCase}ListToJson(
    List<enums.$neededName>? ${neededName.camelCase}) {

  if(${neededName.camelCase} == null)
  {
    return [];
  }

  return ${neededName.camelCase}
      .map((e) => enums.\$${neededName}Map[e]!)
      .toList();
}

List<enums.$neededName> ${neededName.camelCase}ListFromJson(
    List? ${neededName.camelCase}) {

  if(${neededName.camelCase} == null)
  {
    return [];
  }

  return ${neededName.camelCase}
      .map((e) => ${neededName.camelCase}FromJson(e.toString()))
      .toList();
}
    ''';
  }

  String generateConstructorPropertiesContent(
    String className,
    Map<String, dynamic> entityMap,
    GeneratorOptions options,
    List<DefaultValueMap> defaultValues,
    List<String> allEnumNames,
    List<String> allEnumListNames,
  ) {
    if (entityMap.isEmpty) {
      return '';
    }

    var results = '';
    final propertyNames = <String>[];

    entityMap.forEach((key, value) {
      var fieldName = getParameterName(key.asParameterName(), propertyNames);

      propertyNames.add(fieldName);

      results += '\t\tthis.$fieldName,\n';
    });

    return '{\n$results\n\t}';
  }

  String generateModelClassString(
      String swaggerFile,
      String className,
      Map<String, dynamic> map,
      Map<String, dynamic> schemas,
      List<DefaultValueMap> defaultValues,
      bool useDefaultNullForLists,
      List<String> allEnumNames,
      List<String> allEnumListNames,
      GeneratorOptions options) {
    final properties = getModelProperties(map, schemas);

    final generatedConstructorProperties = generateConstructorPropertiesContent(
      className,
      properties,
      options,
      defaultValues,
      allEnumNames,
      allEnumListNames,
    );

    final generatedProperties = generatePropertiesContent(
      swaggerFile,
      properties,
      schemas,
      className,
      defaultValues,
      useDefaultNullForLists,
      allEnumNames,
      allEnumListNames,
      options,
    );

    final validatedClassName =
        '${getValidatedClassName(className)}${options.modelPostfix}';

    final copyWithMethod =
        generateCopyWithContent(generatedProperties, validatedClassName);

    final getHashContent =
        generateGetHashContent(generatedProperties, validatedClassName);

    final equalsOverride =
        generateEqualsOverride(generatedProperties, validatedClassName);

    final generatedClass = '''
@JsonSerializable(explicitToJson: true)
class $validatedClassName {
\t$validatedClassName($generatedConstructorProperties);\n
\tfactory $validatedClassName.fromJson(Map<String, dynamic> json) => _\$${validatedClassName}FromJson(json);\n
$generatedProperties
\tstatic const fromJsonFactory = _\$${validatedClassName}FromJson;
\tstatic const toJsonFactory = _\$${validatedClassName}ToJson;
\tMap<String, dynamic> toJson() => _\$${validatedClassName}ToJson(this);

@override
String toString() => jsonEncode(this);

$equalsOverride

$getHashContent
}
$copyWithMethod
''';

    return generatedClass;
  }

  String generateEqualsOverride(
      String generatedProperties, String validatedClassName) {
    final splittedProperties = generatedProperties
        .split(';')
        .where((element) => element.isNotEmpty)
        .map((e) => e.substring(e.indexOf('final ') + 6))
        .map((e) => e.split(' ')[1])
        .toList();

    if (splittedProperties.isEmpty) {
      return '';
    }

    final checks = splittedProperties.map((e) => '''
(identical(other.$e, $e) ||
                const DeepCollectionEquality().equals(other.$e, $e))
    ''').join(' && ');

    return '''
@override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is $validatedClassName &&
            $checks);
  }
    ''';
  }

  String generateCopyWithContent(
      String generatedProperties, String validatedClassName) {
    final splittedProperties = generatedProperties
        .split(';')
        .where((element) => element.isNotEmpty)
        .map((e) => e.substring(e.indexOf('final ') + 6))
        .map((e) {
      final items = e.split(' ');
      if (!items.first.endsWith('?')) {
        items[0] += '?';
      }

      return items[0] + ' ' + items[1];
    }).toList();

    if (splittedProperties.isEmpty) {
      return '';
    }

    final spittedPropertiesJoined = splittedProperties.join(', ');

    final splittedPropertiesNamesContent = splittedProperties
        .map((e) => e.substring(e.indexOf(' ') + 1))
        .map((e) => '$e: $e ?? this.$e')
        .join(',\n');

    return 'extension \$${validatedClassName}Extension on $validatedClassName { $validatedClassName copyWith({$spittedPropertiesJoined}) { return $validatedClassName($splittedPropertiesNamesContent);}}';
  }

  String generateGetHashContent(
      String generatedProperties, String validatedClassName) {
    final propertiesHash = generatedProperties
        .split(';')
        .where((element) => element.isNotEmpty)
        .map((e) => e.substring(e.indexOf('final ') + 6))
        .map((e) => e.substring(e.indexOf(' ') + 1))
        .map((e) => 'const DeepCollectionEquality().hash($e)')
        .toList();

    final allHashComponents =
        [...propertiesHash, 'runtimeType.hashCode'].join(' ^\n');

    return '''
@override
int get hashCode =>
$allHashComponents;
''';
  }

  Map<String, dynamic> getModelProperties(
    Map<String, dynamic> modelMap,
    Map<String, dynamic> schemas,
  ) {
    if (!modelMap.containsKey('allOf')) {
      return modelMap['properties'] as Map<String, dynamic>? ?? {};
    }

    final allOf = modelMap['allOf'] as List<dynamic>;

    final newModelMap = allOf.firstWhere(
      (m) => (m as Map<String, dynamic>).containsKey('properties'),
      orElse: () => null,
    );

    if (newModelMap == null) {
      return {};
    }

    final currentProperties =
        newModelMap['properties'] as Map<String, dynamic>? ?? {};

    final allOfRef = allOf.firstWhere(
      (m) => (m as Map<String, dynamic>).containsKey('\$ref'),
      orElse: () => null,
    );

    if (allOfRef != null) {
      final refString = allOfRef['\$ref'].toString();
      final schema = schemas[refString.getUnformattedRef()];

      if (schema != null) {
        final moreProperties =
            schema['properties'] as Map<String, dynamic>? ?? {};

        currentProperties.addAll(moreProperties);
      }
    }

    return currentProperties;
  }

  List<String> getAllEnumNames(String swaggerFile) {
    final results = SwaggerEnumsGenerator.getEnumNamesFromRequests(swaggerFile);

    final swagger = jsonDecode(swaggerFile) as Map<String, dynamic>;

    final components = swagger['components'] as Map<String, dynamic>?;

    final definitions = swagger['definitions'] as Map<String, dynamic>? ?? {};

    final schemas = components == null
        ? <String, dynamic>{}
        : components['schemas'] as Map<String, dynamic>? ?? {};

    schemas.addAll(definitions);

    final responses = components == null
        ? null
        : components['responses'] as Map<String, dynamic>?;

    final requestBodies = components == null
        ? <String, dynamic>{}
        : components['requestBodies'] as Map<String, dynamic>? ?? {};

    final moreRequestBodies = getRequestBodiesFromRequests(swagger);

    requestBodies.addAll(moreRequestBodies);

    schemas.forEach((className, map) {
      final mapMap = map as Map<String, dynamic>;
      if (mapMap.containsKey('enum')) {
        results.add(
            SwaggerModelsGenerator.getValidatedClassName(className.capitalize));
        return;
      }

      if (mapMap['type'] == 'array' &&
          mapMap['items'] != null &&
          mapMap['items']['enum'] != null) {
        results.add(
            SwaggerModelsGenerator.getValidatedClassName(className.capitalize));
        return;
      }

      Map<String, dynamic>? properties;

      if (mapMap.containsKey('allOf')) {
        final allOf = mapMap['allOf'] as List<dynamic>;
        var propertiesContainer = allOf.firstWhereOrNull(
                (e) => (e as Map<String, dynamic>).containsKey('properties'))
            as Map<String, dynamic>?;

        if (propertiesContainer != null) {
          properties =
              propertiesContainer['properties'] as Map<String, dynamic>? ?? {};
        } else {
          properties = map['properties'] as Map<String, dynamic>? ?? {};
        }

        var allOfRef = allOf.firstWhereOrNull(
          (e) => (e as Map<String, dynamic>).containsKey('\$ref'),
        ) as Map<String, dynamic>?;

        if (allOfRef != null) {
          final ref = allOfRef['\$ref'] as String;

          final allOfModel =
              schemas[ref.getUnformattedRef()] as Map<String, dynamic>? ?? {};

          final allOfModelProperties =
              allOfModel['properties'] as Map<String, dynamic>? ?? {};

          properties.addAll(allOfModelProperties);
        }
      } else {
        properties = map['properties'] as Map<String, dynamic>?;
      }

      if (properties == null) {
        return;
      }

      properties.forEach((propertyName, propertyValue) {
        if (propertyValue is! Map<String, dynamic>) {
          return;
        }

        if (propertyValue.containsKey('enum') ||
            (propertyValue['items'] != null &&
                propertyValue['items']['enum'] != null)) {
          results.add(SwaggerModelsGenerator.getValidatedClassName(
              SwaggerEnumsGeneratorV3().generateEnumName(
                  SwaggerModelsGenerator.getValidatedClassName(className),
                  propertyName)));
        }
      });
    });

    if (responses != null) {
      responses.forEach((className, map) {
        final response = responses[className];
        final content = response['content'] as Map<String, dynamic>?;
        final firstContent = content?.entries.firstOrNull?.value;
        final schema = firstContent == null ? null : firstContent['schema'];
        if (schema != null &&
            (schema as Map<String, dynamic>).containsKey('enum')) {
          results.add(className.capitalize);
          return;
        }
        final properties = schema == null
            ? null
            : schema['properties'] as Map<String, dynamic>?;

        if (properties == null) {
          return;
        }

        properties.forEach((propertyName, propertyValue) {
          var property = propertyValue as Map<String, dynamic>;

          if (property.containsKey('enum') ||
              (property['items'] != null &&
                  property['items']['enum'] != null)) {
            results.add(SwaggerEnumsGeneratorV3()
                .generateEnumName(className, propertyName));
          }
        });
      });
    }

    if (requestBodies.isNotEmpty) {
      requestBodies.forEach((className, map) {
        final response = requestBodies[className];
        final content = response['content'] as Map<String, dynamic>;
        final firstContent = content.entries.firstOrNull?.value;
        final schema = firstContent == null ? null : firstContent['schema'];
        if (schema != null &&
            (schema as Map<String, dynamic>).containsKey('enum')) {
          results.add(className.capitalize);
          return;
        }
        final properties = schema == null
            ? null
            : schema['properties'] as Map<String, dynamic>?;

        if (properties == null) {
          return;
        }

        properties.forEach((propertyName, propertyValue) {
          var property = propertyValue as Map<String, dynamic>;

          if (property.containsKey('enum') ||
              (property['items'] != null &&
                  property['items']['enum'] != null)) {
            results.add(SwaggerEnumsGeneratorV3()
                .generateEnumName(className, propertyName));
          }
        });
      });
    }

    final resultsWithPrefix = results.map((element) {
      return 'enums.$element';
    }).toList();

    return resultsWithPrefix;
  }

  static Map<String, dynamic> getRequestBodiesFromRequests(
      Map<String, dynamic> map) {
    final paths = map['paths'] as Map<String, dynamic>? ?? {};
    if (paths.isEmpty) {
      return {};
    }

    final result = <String, dynamic>{};

    paths.forEach((pathKey, pathValue) {
      final pathMap = pathValue as Map<String, dynamic>;

      pathMap.forEach((requestKey, requestValue) {
        if (!supportedRequestTypes.contains(requestKey)) {
          return;
        }

        final requestMap = requestValue as Map<String, dynamic>? ?? {};

        if (requestMap.containsKey('requestBody')) {
          final requestBody = requestMap['requestBody'] as Map<String, dynamic>;
          final content = requestBody['content'] as Map<String, dynamic>?;
          if (content != null) {
            final appJson = content.values.first as Map<String, dynamic>?;
            if (appJson != null) {
              final schema = appJson['schema'] as Map<String, dynamic>?;

              if (schema != null) {
                if (schema['type'] == 'object' &&
                    schema.containsKey('properties')) {
                  final className =
                      '${pathKey.pascalCase}${requestKey.pascalCase}\$$kRequestBody';

                  result[SwaggerModelsGenerator.getValidatedClassName(
                      className)] = requestBody;
                }
              }
            }
          }
        }
      });
    });

    return result;
  }
}
