import 'package:collection/collection.dart';
import 'package:recase/recase.dart';
import 'package:swagger_dart_code_generator/src/code_generators/constants.dart';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_generator_base.dart';
import 'package:swagger_dart_code_generator/src/exception_words.dart';
import 'package:swagger_dart_code_generator/src/extensions/string_extension.dart';
import 'package:swagger_dart_code_generator/src/models/generator_options.dart';
import 'package:swagger_dart_code_generator/src/models/swagger_enum.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/responses/swagger_schema.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/swagger_root.dart';

import 'constants.dart';

abstract class SwaggerModelsGenerator extends SwaggerGeneratorBase {
  final GeneratorOptions _options;

  @override
  GeneratorOptions get options => _options;

  SwaggerModelsGenerator(this._options);

  String generate(SwaggerRoot root, String fileName);
  String generateResponses(SwaggerRoot root, String fileName);

  String generateRequestBodies(SwaggerRoot root, String fileName);
  String getExtendsString(SwaggerSchema schema);
  List<String> getAllListEnumNames(SwaggerRoot root);

  String generateModelClassContent(
    SwaggerRoot root,
    String className,
    SwaggerSchema schema,
    Map<String, SwaggerSchema> schemas,
    List<DefaultValueMap> defaultValues,
    bool useDefaultNullForLists,
    List<String> allEnumNames,
    List<String> allEnumListNames,
    Map<String, SwaggerSchema> allClasses,
  ) {
    if (schema.isEnum) {
      return '';
    }

    if (kBasicTypes.contains(schema.type.toLowerCase())) {
      return '';
    }

    if (schema.isListEnum) {
      return '';
    }

    if (schema.hasRef) {
      return 'class $className {}';
    }

    if (schema.type == kObject && schema.allOf.isNotEmpty) {
      return 'typedef $className = Map<String, dynamic>;';
    }

    if (schema.type == 'array') {
      final items = schema.items;

      if (items != null) {
        if (items.hasRef) {
          final ref = items.ref;

          final itemSchema = schemas[ref.getUnformattedRef()];

          if (itemSchema != null && kBasicTypes.contains(itemSchema.type)) {
            return 'typedef $className = List<${kBasicTypesMap[itemSchema.type]}>;';
          }

          final itemType = getValidatedClassName(ref.getUnformattedRef());
          return 'typedef $className = List<$itemType>;';
        }

        final itemsType = items.type;

        if (kBasicTypes.contains(itemsType)) {
          return 'typedef $className = List<${kBasicTypesMap[itemsType]}>;';
        }

        final itemClassName = '$className\$Item';

        final resultClass = generateModelClassString(
          root,
          itemClassName,
          items,
          schemas,
          defaultValues,
          useDefaultNullForLists,
          allEnumNames,
          allEnumListNames,
          allClasses,
        );

        return 'typedef $className = List<$itemClassName>; $resultClass';
      }

      return 'typedef $className = List<Object>;';
    }

    return generateModelClassString(
      root,
      className,
      schema,
      schemas,
      defaultValues,
      useDefaultNullForLists,
      allEnumNames,
      allEnumListNames,
      allClasses,
    );
  }

  Map<String, SwaggerSchema> getClassesFromInnerClasses(
    Map<String, SwaggerSchema> classes,
  ) {
    final result = <String, SwaggerSchema>{};

    classes.forEach((classKey, schema) {
      final properties = schema.properties;

      properties.forEach((propertyKey, propSchema) {
        final innerClassName =
            '${getValidatedClassName(classKey)}\$${getValidatedClassName(propertyKey)}';

        if (propSchema.properties.isNotEmpty) {
          result[innerClassName] = propSchema;
        }

        final items = propSchema.items;

        if (items != null && items.properties.isNotEmpty) {
          result[innerClassName] = propSchema;
        }
      });
    });

    if (result.isNotEmpty) {
      result.addAll(getClassesFromInnerClasses(result));
    }

    return result;
  }

  Map<String, SwaggerSchema> getClassesFromResponses(SwaggerRoot root) {
    final results = <String, SwaggerSchema>{};

    final paths = root.paths;

    paths.forEach((key, path) {
      path.requests.forEach((operation, request) {
        if (!supportedRequestTypes.contains(operation.toLowerCase())) {
          return;
        }

        if (options.excludePaths.isNotEmpty &&
            options.excludePaths
                .any((exclPath) => RegExp(exclPath).hasMatch(operation))) {
          return;
        }

        if (options.includePaths.isNotEmpty &&
            !options.includePaths
                .any((inclPath) => RegExp(inclPath).hasMatch(operation))) {
          return;
        }
        final responses = request.responses;

        final neededResponse = responses['200'];

        if (neededResponse != null &&
            neededResponse.schema != null &&
            neededResponse.schema!.type == kObject &&
            neededResponse.schema!.properties.isNotEmpty) {
          final pathText = key.split('/').map((e) => e.pascalCase).join();
          final requestText = operation.pascalCase;

          results['$pathText$requestText\$Response'] = neededResponse.schema!;
        }
      });
    });

    return results;
  }

  String generateBase(
      SwaggerRoot root,
      String fileName,
      Map<String, SwaggerSchema> classes,
      bool generateFromJsonToJsonForRequests) {
    final allEnums = getAllEnums(root);
    final allEnumListNames = getAllListEnumNames(root);

    final generatedEnumFromJsonToJson = generateFromJsonToJsonForRequests
        ? generateEnumFromJsonToJsonMethods(
            allEnums, options.enumsCaseSensitive)
        : '';

    final classesFromResponses = getClassesFromResponses(root);
    classes.addAll(classesFromResponses);

    final classesFromInnerClasses = getClassesFromInnerClasses(classes);

    classes.addAll(classesFromInnerClasses);

    if (classes.isEmpty) {
      return '';
    }

    final generatedClasses = classes.keys.map((String className) {
      if (classes['enum'] != null) {
        return '';
      }

      final allClasses = {
        ...root.definitions,
        ...root.components?.responses ?? {},
        ...root.components?.schemas ?? {},
      };

      return generateModelClassContent(
        root,
        className.pascalCase,
        classes[className]!,
        classes,
        options.defaultValuesMap,
        options.useDefaultNullForLists,
        allEnums.map((e) => e.name).toList(),
        allEnumListNames,
        allClasses,
      );
    }).join('\n');

    var results = '$generatedClasses\n$generatedEnumFromJsonToJson';

    final listEnums = getAllListEnumNames(root);

    for (var listEnum in listEnums) {
      results = results.replaceAll(' $listEnum ', ' List<$listEnum> ');
    }

    return results;
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
    SwaggerSchema? parameter,
    String modelPostfix,
    String? refNameParameter,
  ) {
    if (refNameParameter != null) {
      return refNameParameter.pascalCase;
    }

    if (parameter == null) return 'Object';

    if (parameter.properties.isNotEmpty) {
      return '${getValidatedClassName(className)}\$${getValidatedClassName(parameterName)}$modelPostfix';
    }

    if (parameter.hasRef) {
      return parameter.ref.split('/').last.pascalCase;
    }

    switch (parameter.type) {
      case 'integer':
      case 'int':
        if (parameter.format == kInt64) {
          return kNum;
        }
        return 'int';
      case 'int32':
      case 'int64':
        return 'int';
      case 'boolean':
        return 'bool';
      case 'string':
        if (parameter.format == 'date-time' || parameter.format == 'date') {
          return 'DateTime';
        } else if (parameter.isEnum) {
          return 'enums.${getValidatedClassName(generateEnumName(getValidatedClassName(className), parameterName))}';
        }
        return 'String';
      case 'Date':
        return 'DateTime';
      case 'number':
        return 'double';
      case 'object':
        return 'Object';
      case 'array':
        final items = parameter.items;
        final typeName = getParameterTypeName(
            className, parameterName, items, modelPostfix, null);
        return 'List<$typeName>';
      default:
        return 'Object';
    }
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

  String generateIncludeIfNullString() {
    if (options.includeIfNull == null) {
      return '';
    }

    return ', includeIfNull: ${options.includeIfNull}';
  }

  String generatePropertyContentByDefault(
    SwaggerSchema prop,
    String propertyName,
    List<String> allEnumNames,
    List<String> allEnumListNames,
  ) {
    var typeName = '';

    if (prop.hasOriginalRef) {
      typeName = getValidatedClassName(prop.originalRef);
    }

    if (typeName.isEmpty) {
      typeName = kDynamic;
    }

    final unknownEnumValue = generateEnumValue(
      allEnumNames,
      allEnumListNames,
      propertyName,
      typeName.toString(),
      prop.defaultValue,
      false,
    );

    final dateToJsonValue = generateToJsonForDate(prop);

    final includeIfNullString = generateIncludeIfNullString();

    if (typeName != kDynamic) {
      typeName += '?';
    }

    final jsonKeyContent =
        "@JsonKey(name: '$propertyName'$includeIfNullString$dateToJsonValue${unknownEnumValue.jsonKey})\n";
    return '\t$jsonKeyContent\tfinal $typeName ${generateFieldName(propertyName)};${unknownEnumValue.fromJson}';
  }

  _JsonEnumValue generateEnumValue(
    List<String> allEnumNames,
    List<String> allEnumListNames,
    String propertyName,
    String typeName,
    dynamic defaultValue,
    bool isList,
  ) {
    final validatedTypeName = getValidatedClassName(typeName);

    var jsonKey = '';
    var fromJson = '';
    if (allEnumNames.contains(validatedTypeName)) {
      isList = isList || allEnumListNames.contains(validatedTypeName);

      final enumNameCamelCase = typeName.replaceAll('enums.', '').camelCase;
      final propertyNameCamelCase = propertyName.pascalCase;
      final fromJsonPrefix = defaultValue == null
          ? enumNameCamelCase
          : '$enumNameCamelCase$propertyNameCamelCase';
      final String fromJsonSuffix;
      final String toJsonSuffix;
      if (isList) {
        fromJsonSuffix = 'ListFromJson';
        toJsonSuffix = 'ListToJson';
      } else {
        fromJsonSuffix = 'FromJson';
        toJsonSuffix = 'ToJson';
      }
      final fromJsonFunction = '$fromJsonPrefix$fromJsonSuffix';
      jsonKey =
          ', toJson: $enumNameCamelCase$toJsonSuffix, fromJson: $fromJsonFunction';

      if (defaultValue != null) {
        final String returnType;
        final String valueType;
        final String defaultValueString;
        if (isList && defaultValue is List) {
          valueType = 'List';
          returnType = 'List<$validatedTypeName>';
          final defaultValues = defaultValue
              .map((e) => '$validatedTypeName.${e.toString().camelCase}')
              .join(', ');
          defaultValueString = '[$defaultValues]';
        } else {
          valueType = 'Object';
          returnType = validatedTypeName;
          final defaultValueCamelCase = defaultValue?.toString().camelCase;
          defaultValueString = '$validatedTypeName.$defaultValueCamelCase';
        }
        fromJson = '''


static $returnType $fromJsonFunction($valueType? value) => $enumNameCamelCase$fromJsonSuffix(value, $defaultValueString);
            ''';
      }
    }

    return _JsonEnumValue(
      jsonKey: jsonKey,
      fromJson: fromJson,
    );
  }

  String generateToJsonForDate(SwaggerSchema map) {
    final type = map.type.toLowerCase();
    final format = map.format.toLowerCase();

    final isDate = type == kString && format == 'date';

    if (isDate) {
      return ', toJson: _dateToJson';
    }

    return '';
  }

  String nullable(
    String typeName,
    String className,
    Iterable<String> requiredProperties,
    String propertyKey,
    SwaggerSchema prop,
  ) {
    if (options.nullableModels.contains(className) ||
        !requiredProperties.contains(propertyKey) ||
        prop.isNullable == true) {
      return typeName.makeNullable();
    }
    return typeName;
  }

  String generatePropertyContentBySchema(
    SwaggerSchema prop,
    String propertyName,
    String propertyKey,
    String className,
    List<String> allEnumNames,
    List<String> allEnumListNames,
    Map<String, String> basicTypesMap,
    List<String> requiredProperties,
  ) {
    final propertySchema = prop.schema!;
    var parameterName = propertySchema.ref.split('/').last;

    String typeName;
    if (basicTypesMap.containsKey(parameterName)) {
      typeName = basicTypesMap[parameterName]!;
    } else {
      typeName = getValidatedClassName(getParameterTypeName(
          className, propertyName, prop, options.modelPostfix, parameterName));
    }

    final includeIfNullString = generateIncludeIfNullString();

    final allEnumsNamesWithoutPrefix =
        allEnumNames.map((e) => e.replaceFirst('enums.', '')).toList();

    if (allEnumsNamesWithoutPrefix.contains(typeName)) {
      typeName = 'enums.$typeName';
    } else {
      typeName += options.modelPostfix;
    }

    final unknownEnumValue = generateEnumValue(
      allEnumNames,
      allEnumListNames,
      propertyName,
      typeName,
      prop.defaultValue,
      false,
    );

    final dateToJsonValue = generateToJsonForDate(prop);

    final jsonKeyContent =
        "@JsonKey(name: '$propertyKey'$includeIfNullString${unknownEnumValue.jsonKey}$dateToJsonValue)\n";

    typeName =
        nullable(typeName, className, requiredProperties, propertyKey, prop);

    return '\t$jsonKeyContent\tfinal $typeName ${generateFieldName(propertyName)};${unknownEnumValue.fromJson}';
  }

  String generatePropertyContentByAllOf({
    required SwaggerSchema prop,
    required String propertyKey,
    required String className,
    required List<String> allEnumNames,
    required List<String> allEnumListNames,
    required String propertyName,
    required List<String> requiredProperties,
  }) {
    final allOf = prop.allOf;
    String typeName;

    if (allOf.length != 1) {
      typeName = kDynamic;
    } else {
      var className = allOf.first.ref.getRef();

      final enumClassName = 'enums.$className';
      if (allEnumNames.contains(enumClassName)) {
        className = enumClassName;
      }

      typeName = getValidatedClassName(className);
    }

    final includeIfNullString = generateIncludeIfNullString();

    final unknownEnumValue = generateEnumValue(
      allEnumNames,
      allEnumListNames,
      propertyName,
      typeName,
      prop.defaultValue,
      false,
    );

    final jsonKeyContent =
        "@JsonKey(name: '$propertyKey'$includeIfNullString${unknownEnumValue.jsonKey})\n";

    typeName =
        nullable(typeName, className, requiredProperties, propertyKey, prop);

    return '\t$jsonKeyContent\tfinal $typeName $propertyName;${unknownEnumValue.fromJson}';
  }

  String generatePropertyContentByRef(
    SwaggerSchema prop,
    String propertyName,
    String propertyKey,
    String className,
    List<String> allEnumNames,
    List<String> allEnumListNames,
    Map<String, String> basicTypesMap,
    List<String> requiredProperties,
    Map<String, SwaggerSchema> allClasses,
  ) {
    final parameterName = prop.ref.split('/').last;

    String typeName;
    if (kBasicTypes.contains(allClasses[parameterName]?.type) &&
        allClasses[parameterName]?.isEnum != true) {
      typeName = kBasicTypesMap[allClasses[parameterName]?.type]!;
    } else if (basicTypesMap.containsKey(parameterName)) {
      typeName = basicTypesMap[parameterName]!;
    } else {
      typeName = getValidatedClassName(getParameterTypeName(
          className, propertyName, prop, options.modelPostfix, parameterName));

      typeName = getValidatedClassName(typeName);
    }

    final allEnumsNamesWithoutPrefix =
        allEnumNames.map((e) => e.replaceFirst('enums.', '')).toList();

    if (allEnumsNamesWithoutPrefix.contains(typeName)) {
      typeName = 'enums.$typeName';
    } else if (!basicTypesMap.containsKey(parameterName) &&
        !allEnumListNames.contains(typeName)) {
      typeName += options.modelPostfix;
    }

    final unknownEnumValue = generateEnumValue(
      allEnumNames,
      allEnumListNames,
      propertyName,
      typeName,
      prop.defaultValue,
      false,
    );

    if (allEnumListNames.contains(typeName)) {
      typeName = 'List<$typeName>';
    }

    final includeIfNullString = generateIncludeIfNullString();

    final jsonKeyContent =
        "@JsonKey(name: '$propertyKey'$includeIfNullString${unknownEnumValue.jsonKey})\n";

    typeName =
        nullable(typeName, className, requiredProperties, propertyKey, prop);

    return '\t$jsonKeyContent\tfinal $typeName $propertyName;${unknownEnumValue.fromJson}';
  }

  String generateEnumPropertyContent(
    String key,
    String className,
    String propertyKey,
    List<String> allEnumNames,
    List<String> allEnumListNames,
    SwaggerSchema prop,
    List<String> requiredProperties,
  ) {
    final enumName = getValidatedClassName(generateEnumName(className, key));

    allEnumNames.add(enumName);

    final unknownEnumValue = generateEnumValue(
      allEnumNames,
      allEnumListNames,
      key,
      enumName,
      prop.defaultValue,
      false,
    );

    final includeIfNullString = generateIncludeIfNullString();

    var enumPropertyName = className.capitalize + key.capitalize;
    enumPropertyName = nullable(
        enumPropertyName, className, requiredProperties, propertyKey, prop);

    return '''
  @JsonKey(${unknownEnumValue.jsonKey.substring(2)}$includeIfNullString)
  final $enumPropertyName ${generateFieldName(key)};

  ${unknownEnumValue.fromJson}''';
  }

  String _generateListPropertyTypeName({
    required List<String> allEnumNames,
    required List<String> allEnumListNames,
    required SwaggerSchema prop,
    required Map<String, String> basicTypesMap,
    required String propertyName,
    required String className,
  }) {
    if (className.endsWith('\$Item')) {
      return kObject.pascalCase;
    }

    final items = prop.items;

    var typeName = '';
    if (items != null) {
      typeName = getValidatedClassName(items.originalRef);

      if (typeName.isNotEmpty &&
          !kBasicTypes.contains(typeName.toLowerCase())) {
        typeName += options.modelPostfix;
      }

      if (typeName.isEmpty) {
        if (items.hasRef) {
          typeName = items.ref.split('/').last;

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
        typeName = getValidatedClassName(typeName);
      }

      if (typeName.isEmpty) {
        if (items.type == 'array' || items.items != null) {
          return _generateListPropertyTypeName(
            allEnumListNames: allEnumListNames,
            allEnumNames: allEnumNames,
            basicTypesMap: basicTypesMap,
            className: className,
            prop: items,
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
        items,
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
    SwaggerSchema prop,
    bool useDefaultNullForLists,
    List<String> allEnumNames,
    List<String> allEnumListNames,
    Map<String, String> basicTypesMap,
    List<String> requiredParameters,
  ) {
    final typeName = _generateListPropertyTypeName(
      allEnumListNames: allEnumListNames,
      allEnumNames: allEnumNames,
      basicTypesMap: basicTypesMap,
      className: className,
      prop: prop,
      propertyName: propertyName,
    );

    final unknownEnumValue = generateEnumValue(
      allEnumNames,
      allEnumListNames,
      propertyName,
      typeName,
      prop.defaultValue,
      true,
    );

    final includeIfNullString = generateIncludeIfNullString();

    String jsonKeyContent;
    if (unknownEnumValue.jsonKey.isEmpty) {
      jsonKeyContent =
          "@JsonKey(name: '$propertyKey'$includeIfNullString${useDefaultNullForLists ? '' : ', defaultValue: <$typeName>[]'})\n";
    } else {
      jsonKeyContent =
          "@JsonKey(name: '$propertyKey'$includeIfNullString${unknownEnumValue.jsonKey})\n";
    }

    var listPropertyName = 'List<$typeName>';

    listPropertyName = nullable(
        listPropertyName, className, requiredParameters, propertyKey, prop);

    return '$jsonKeyContent  final $listPropertyName ${generateFieldName(propertyName)};${unknownEnumValue.fromJson}';
  }

  String generateGeneralPropertyContent(
    String propertyName,
    String propertyKey,
    String className,
    List<DefaultValueMap> defaultValues,
    SwaggerSchema prop,
    List<String> allEnumNames,
    List<String> allEnumListNames,
    List<String> requiredProperties,
  ) {
    final includeIfNullString = generateIncludeIfNullString();

    var jsonKeyContent = "@JsonKey(name: '$propertyKey'$includeIfNullString";

    var typeName = '';

    if (prop.hasAdditionalProperties && prop.type == 'object') {
      typeName = kMapStringDynamic;
    } else if (prop.hasRef) {
      typeName = prop.ref.split('/').last.pascalCase + options.modelPostfix;
    } else {
      typeName = getParameterTypeName(
        className,
        propertyKey,
        prop,
        options.modelPostfix,
        null,
      );
    }

    final allEnumsNamesWithoutPrefix =
        allEnumNames.map((e) => e.replaceFirst('enums.', '')).toList();

    if (allEnumsNamesWithoutPrefix.contains(typeName)) {
      typeName = 'enums.$typeName';
    }

    final unknownEnumValue = generateEnumValue(
      allEnumNames,
      allEnumListNames,
      propertyName,
      typeName,
      prop.defaultValue,
      false,
    );

    final dateToJsonValue = generateToJsonForDate(prop);

    jsonKeyContent += unknownEnumValue.jsonKey;
    jsonKeyContent += dateToJsonValue;

    if ((prop.type == 'bool' || prop.type == 'boolean') &&
        prop.defaultValue != null) {
      jsonKeyContent += ', defaultValue: ${prop.defaultValue})\n';
    } else if (defaultValues
        .any((DefaultValueMap element) => element.typeName == typeName)) {
      final defaultValue = defaultValues.firstWhere(
          (DefaultValueMap element) => element.typeName == typeName);
      jsonKeyContent +=
          ', defaultValue: ${generateDefaultValueFromMap(defaultValue)})\n';
    } else {
      jsonKeyContent += ')\n';
    }

    typeName =
        nullable(typeName, className, requiredProperties, propertyKey, prop);

    return '\t$jsonKeyContent  final $typeName $propertyName;${unknownEnumValue.fromJson}';
  }

  String generatePropertyContentByType(
    SwaggerSchema prop,
    String propertyName,
    String propertyKey,
    String className,
    List<DefaultValueMap> defaultValues,
    bool useDefaultNullForLists,
    List<String> allEnumsNames,
    List<String> allEnumListNames,
    Map<String, String> basicTypesMap,
    List<String> requiredProperties,
  ) {
    switch (prop.type) {
      case 'array':
        return generateListPropertyContent(
          propertyName,
          propertyKey,
          className,
          prop,
          useDefaultNullForLists,
          allEnumsNames,
          allEnumListNames,
          basicTypesMap,
          requiredProperties,
        );
      case 'enum':
        return generateEnumPropertyContent(
          propertyName,
          className,
          propertyKey,
          allEnumsNames,
          allEnumListNames,
          prop,
          requiredProperties,
        );
      default:
        return generateGeneralPropertyContent(
          propertyName,
          propertyKey,
          className,
          defaultValues,
          prop,
          allEnumsNames,
          allEnumListNames,
          requiredProperties,
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
    SwaggerRoot root,
    Map<String, SwaggerSchema> propertiesMap,
    Map<String, SwaggerSchema> schemas,
    String className,
    List<DefaultValueMap> defaultValues,
    bool useDefaultNullForLists,
    List<String> allEnumNames,
    List<String> allEnumListNames,
    List<String> requiredProperties,
    Map<String, SwaggerSchema> allClasses,
  ) {
    if (propertiesMap.isEmpty) {
      return '';
    }

    final results = <String>[];
    final propertyNames = <String>[];

    for (var i = 0; i < propertiesMap.keys.length; i++) {
      var propertyName = propertiesMap.keys.elementAt(i);

      final prop = propertiesMap[propertyName]!;

      final propertyKey = propertyName;

      final basicTypesMap = generateBasicTypesMapFromSchemas(root);

      propertyName = propertyName.asParameterName();

      propertyName = getParameterName(propertyName, propertyNames);

      propertyNames.add(propertyName);

      if (prop.type.isNotEmpty) {
        results.add(generatePropertyContentByType(
          prop,
          propertyName,
          propertyKey,
          className,
          defaultValues,
          useDefaultNullForLists,
          allEnumNames,
          allEnumListNames,
          basicTypesMap,
          requiredProperties,
        ));
      } else if (prop.allOf.isNotEmpty) {
        results.add(
          generatePropertyContentByAllOf(
            prop: prop,
            allEnumListNames: allEnumListNames,
            className: className,
            allEnumNames: allEnumNames,
            propertyKey: propertyKey,
            propertyName: propertyName,
            requiredProperties: requiredProperties,
          ),
        );
      } else if (prop.hasRef) {
        results.add(generatePropertyContentByRef(
          prop,
          propertyName,
          propertyKey,
          className,
          allEnumNames,
          allEnumListNames,
          basicTypesMap,
          requiredProperties,
          allClasses,
        ));
      } else if (prop.schema != null) {
        results.add(generatePropertyContentBySchema(
          prop,
          propertyName,
          propertyKey,
          className,
          allEnumNames,
          allEnumListNames,
          basicTypesMap,
          requiredProperties,
        ));
      } else {
        results.add(generatePropertyContentByDefault(
          prop,
          propertyName,
          allEnumNames,
          allEnumListNames,
        ));
      }
    }

    return results.join('\n');
  }

  static Map<String, String> generateBasicTypesMapFromSchemas(
      SwaggerRoot root) {
    final result = <String, String>{};

    final components = root.components;

    final definitions = root.definitions;

    final schemas = components?.schemas ?? {};

    final responses = components?.responses ?? {};

    final allClasses = {
      ...definitions,
      ...responses,
      ...schemas,
    };

    allClasses.forEach((key, value) {
      if (kBasicTypes.contains(value.type.toLowerCase()) && !value.isEnum) {
        result.addAll({key: _mapBasicTypeToDartType(value.type, value.format)});
      }

      if (value.type == kArray && value.items != null) {
        final ref = value.items!.ref;

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
    if (basicType.toLowerCase() == kString &&
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

  String generateEnumFromJsonToJsonMethods(
      List<SwaggerEnum> swaggerEnums, bool enumsCaseSensitive) {
    return swaggerEnums
        .map((e) => generateEnumFromJsonToJson(e, enumsCaseSensitive))
        .join('\n');
  }

  String generateEnumFromJsonToJson(
      SwaggerEnum swaggerEnum, bool enumsCaseSensitive) {
    final neededName =
        getValidatedClassName(swaggerEnum.name.replaceFirst('enums.', ''));

    final toLowerCaseString = !enumsCaseSensitive ? '.toLowerCase()' : '';
    final type = swaggerEnum.isInteger ? 'int' : 'String';
    final defaultTypeValue = swaggerEnum.isInteger ? 0 : '\'\'';

    return '''
$type? ${neededName.camelCase}ToJson(enums.$neededName? ${neededName.camelCase}) {
  return enums.\$${neededName}Map[${neededName.camelCase}];
}

enums.$neededName ${neededName.camelCase}FromJson(
  Object? ${neededName.camelCase},
  [enums.$neededName? defaultValue,]
  ) {

${swaggerEnum.isInteger ? '''
if(${neededName.camelCase} is int)
  {
    return enums.\$${neededName}Map.entries
      .firstWhere((element) => element.value == ${neededName.camelCase},
      orElse: () => const MapEntry(enums.$neededName.swaggerGeneratedUnknown, $defaultTypeValue))
      .key;
  }
''' : '''
if(${neededName.camelCase} is String)
  {
 return enums.\$${neededName}Map.entries
      .firstWhere((element) => element.value$toLowerCaseString == ${neededName.camelCase}$toLowerCaseString,
      orElse: () => const MapEntry(enums.$neededName.swaggerGeneratedUnknown, $defaultTypeValue))
      .key;
      }
'''}
  
    final pasredResult = enums.\$${neededName}Map.entries
      .firstWhereOrNull((element) => element.value == defaultValue)
      ?.key;

  return pasredResult ??
      defaultValue ??
      enums.$neededName.swaggerGeneratedUnknown;
}


List<$type> ${neededName.camelCase}ListToJson(
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
    List? ${neededName.camelCase},
    [List<enums.$neededName>? defaultValue,]) {

  if(${neededName.camelCase} == null)
  {
    return defaultValue ?? [];
  }

  return ${neededName.camelCase}
      .map((e) => ${neededName.camelCase}FromJson(e.toString()))
      .toList();
}
    ''';
  }

  String generateConstructorPropertiesContent({
    required String className,
    required Map<String, dynamic> entityMap,
    required List<DefaultValueMap> defaultValues,
    required List<String> requiredProperties,
    required List<String> allEnumNames,
    required List<String> allEnumListNames,
  }) {
    if (entityMap.isEmpty) {
      return '';
    }

    var results = '';
    final propertyNames = <String>[];

    entityMap.forEach((key, value) {
      var fieldName = getParameterName(key.asParameterName(), propertyNames);

      propertyNames.add(fieldName);

      if (options.nullableModels.contains(className) ||
          !requiredProperties.contains(key)) {
        results += '\t\tthis.$fieldName,\n';
      } else {
        results += '\t\t$kRequired this.$fieldName,\n';
      }
    });

    return '{\n$results\n\t}';
  }

  String generateModelClassString(
    SwaggerRoot root,
    String className,
    SwaggerSchema schema,
    Map<String, SwaggerSchema> schemas,
    List<DefaultValueMap> defaultValues,
    bool useDefaultNullForLists,
    List<String> allEnumNames,
    List<String> allEnumListNames,
    Map<String, SwaggerSchema> allClasses,
  ) {
    final properties = getModelProperties(schema, schemas);
    final requiredProperties = schema.required;

    final generatedConstructorProperties = generateConstructorPropertiesContent(
      className: className,
      entityMap: properties,
      defaultValues: defaultValues,
      allEnumNames: allEnumNames,
      allEnumListNames: allEnumListNames,
      requiredProperties: requiredProperties,
    );

    final generatedProperties = generatePropertiesContent(
      root,
      properties,
      schemas,
      className,
      defaultValues,
      useDefaultNullForLists,
      allEnumNames,
      allEnumListNames,
      requiredProperties,
      allClasses,
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
    final splittedProperties = RegExp(
      'final .+ (.+);',
    ).allMatches(generatedProperties).map((e) => e.group(1)!);

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
    final splittedProperties = RegExp(
      'final (.+) (.+);',
    ).allMatches(generatedProperties).map((e) {
      var type = e.group(1)!;
      if (!type.endsWith('?') && type != kDynamic) {
        type += '?';
      }
      return '$type ${e.group(2)!}';
    });

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
    final propertiesHash = RegExp(
      'final .+ (.+);',
    )
        .allMatches(generatedProperties)
        .map((e) => e.group(1)!)
        .map((e) => 'const DeepCollectionEquality().hash($e)');

    final allHashComponents =
        [...propertiesHash, 'runtimeType.hashCode'].join(' ^\n');

    return '''
@override
int get hashCode =>
$allHashComponents;
''';
  }

  Map<String, SwaggerSchema> getModelProperties(
    SwaggerSchema modelMap,
    Map<String, SwaggerSchema> schemas,
  ) {
    if (modelMap.allOf.isEmpty) {
      return modelMap.properties;
    }

    final allOf = modelMap.allOf;

    final newModelMap = allOf.firstWhereOrNull((m) => m.properties.isNotEmpty);

    if (newModelMap == null) {
      return {};
    }

    final currentProperties = newModelMap.properties;

    final allOfRef = allOf.firstWhereOrNull((m) => m.hasRef);

    if (allOfRef != null) {
      final refString = allOfRef.ref;
      final schema = schemas[refString.getUnformattedRef()];

      if (schema != null) {
        final moreProperties = schema.properties;

        currentProperties.addAll(moreProperties);
      }
    }

    return currentProperties;
  }

  List<String> getAllEnumNames(SwaggerRoot root) =>
      getAllEnums(root).map((e) => e.name).toList(growable: false);

  List<SwaggerEnum> getAllEnums(SwaggerRoot root) {
    final results = getEnumsFromRequests(root);

    final components = root.components;

    final definitions = root.definitions;

    final schemas = components?.schemas ?? {};

    schemas.addAll(definitions);

    final responses = components?.responses ?? {};

    final requestBodies = components?.requestBodies ?? {};

    final moreRequestBodies = getRequestBodiesFromRequests(root);

    requestBodies.addAll(moreRequestBodies);

    schemas.forEach((className, schema) {
      if (schema.isEnum) {
        return _addEnum(
          outResults: results,
          name: getValidatedClassName(className.capitalize),
          schema: schema,
        );
      }

      if (schema.isListEnum) {
        return _addEnum(
          outResults: results,
          name: getValidatedClassName(className.capitalize),
          schema: schema,
        );
      }

      Map<String, SwaggerSchema>? properties;

      if (schema.allOf.isNotEmpty) {
        final allOf = schema.allOf;
        var propertiesContainer =
            allOf.firstWhereOrNull((e) => e.properties.isNotEmpty);

        if (propertiesContainer != null) {
          properties = propertiesContainer.properties;
        } else {
          properties = schema.properties;
        }

        var allOfRef = allOf.firstWhereOrNull((e) => e.hasRef);

        if (allOfRef != null) {
          final ref = allOfRef.ref;

          final allOfModel = schemas[ref.getUnformattedRef()];

          final allOfModelProperties = allOfModel?.properties ?? {};

          properties.addAll(allOfModelProperties);
        }
      } else {
        properties = schema.properties;
      }

      properties.forEach((name, propSchema) {
        _addEnum(
          outResults: results,
          name: getValidatedClassName(
              generateEnumName(getValidatedClassName(className), name)),
          schema: propSchema,
        );
      });
    });

    void addEnumFromSchema(String className, SwaggerSchema schema) {
      if (schema.isEnum) {
        return _addEnum(
          outResults: results,
          name: className,
          schema: schema,
        );
      }
      final properties = schema.properties;

      properties.forEach((name, propSchema) {
        _addEnum(
          outResults: results,
          name: generateEnumName(className, name),
          schema: propSchema,
        );
      });
    }

    responses.forEach(addEnumFromSchema);
    requestBodies.forEach(addEnumFromSchema);

    final resultsWithPrefix = results.map((element) {
      return SwaggerEnum(
        name: 'enums.${element.name}',
        isInteger: element.isInteger,
        defaultValue: element.defaultValue,
      );
    }).toList();

    return resultsWithPrefix;
  }

  void _addEnum({
    required List<SwaggerEnum> outResults,
    required String name,
    required SwaggerSchema schema,
  }) {
    var enums = schema.enumValuesObj;

    if (enums.isEmpty) {
      enums = schema.items?.enumValuesObj ?? [];
    }

    if (enums.isNotEmpty) {
      final isInteger =
          kIntegerTypes.contains(schema.type) || enums.firstOrNull is int;
      outResults.add(SwaggerEnum(
        name: name,
        isInteger: isInteger,
        defaultValue: schema.defaultValue ?? schema.items?.defaultValue,
      ));
    } else if (schema.type == kArray) {}
  }

  Map<String, SwaggerSchema> getRequestBodiesFromRequests(SwaggerRoot root) {
    final paths = root.paths;
    if (paths.isEmpty) {
      return {};
    }

    final result = <String, SwaggerSchema>{};

    paths.forEach((pathKey, path) {
      path.requests.forEach((requestKey, request) {
        if (!supportedRequestTypes.contains(requestKey)) {
          return;
        }

        final content = request.requestBody?.content;
        if (content != null) {
          final schema = content.schema;
          if (schema != null) {
            if (schema.type == kObject && schema.properties.isNotEmpty) {
              final className =
                  '${pathKey.pascalCase}${requestKey.pascalCase}\$$kRequestBody';

              result[getValidatedClassName(className)] = schema;
            }
          }
        }
      });
    });

    return result;
  }
}

class _JsonEnumValue {
  _JsonEnumValue({
    required this.jsonKey,
    required this.fromJson,
  });

  final String jsonKey;
  final String fromJson;
}
