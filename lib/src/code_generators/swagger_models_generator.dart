import 'package:collection/collection.dart';
import 'package:recase/recase.dart';
import 'package:swagger_dart_code_generator/src/code_generators/constants.dart';
import 'package:swagger_dart_code_generator/src/code_generators/enum_model.dart';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_generator_base.dart';
import 'package:swagger_dart_code_generator/src/exception_words.dart';
import 'package:swagger_dart_code_generator/src/extensions/string_extension.dart';
import 'package:swagger_dart_code_generator/src/models/generator_options.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/responses/swagger_schema.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/swagger_root.dart';

abstract class SwaggerModelsGenerator extends SwaggerGeneratorBase {
  final GeneratorOptions _options;

  @override
  GeneratorOptions get options => _options;

  SwaggerModelsGenerator(this._options);

  String generate({
    required SwaggerRoot root,
    required String fileName,
    required List<EnumModel> allEnums,
  });

  String getExtendsString(SwaggerSchema schema);

  List<String> getAllListEnumNames(SwaggerRoot root);

  String generateModelClassContent(
    SwaggerRoot root,
    String className,
    SwaggerSchema schema,
    Map<String, SwaggerSchema> schemas,
    List<DefaultValueMap> defaultValues,
    List<String> classesWithNullableLists,
    List<String> allEnumNames,
    List<String> allEnumListNames,
    Map<String, SwaggerSchema> allClasses,
  ) {
    if (options.overridenModels.contains(getValidatedClassName(className))) {
      return '';
    }

    if (schema.isEnum) {
      return '';
    }

    if (schema.ref.isNotEmpty) {
      return '';
    }

    if (kBasicSwaggerTypes.contains(schema.type.toLowerCase())) {
      return '';
    }

    if (schema.isListEnum) {
      return '';
    }

    if (schema.hasRef) {
      return 'class $className {}';
    }

    if (schema.type == kObject && schema.anyOf.isNotEmpty) {
      return 'typedef $className = Map<String, dynamic>;';
    }

    if (schema.type == 'array') {
      final items = schema.items;

      if (items != null) {
        if (items.hasRef) {
          final ref = items.ref;

          final itemSchema =
              allClasses[getValidatedClassName(ref.getUnformattedRef())];

          if (itemSchema != null && kBasicTypes.contains(itemSchema.type)) {
            return 'typedef $className = List<${kBasicTypesMap[itemSchema.type]}>;';
          }

          final itemType = getValidatedClassName(ref.getUnformattedRef());
          return 'typedef $className = List<$itemType>;';
        }

        final itemsType = items.type;

        if (itemsType != kObject) {
          return 'typedef $className = List<Object>;';
        }

        if (kBasicTypes.contains(itemsType)) {
          return 'typedef $className = List<${kBasicTypesMap[itemsType]}>;';
        }

        final itemClassName = '$className\$Item';

        if (options.overridenModels
            .contains(getValidatedClassName(itemClassName))) {
          return '';
        }

        final resultClass = generateModelClassString(
          root,
          itemClassName,
          items,
          schemas,
          defaultValues,
          classesWithNullableLists,
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
      classesWithNullableLists,
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

        final neededSchema =
            neededResponse?.schema ?? neededResponse?.content?.schema;

        if (neededSchema != null &&
            neededSchema.type == kObject &&
            neededSchema.properties.isNotEmpty) {
          final pathText = key.split('/').map((e) => e.pascalCase).join();
          final requestText = operation.pascalCase;

          results['$pathText$requestText\$Response'] = neededSchema;
        } else {
          if (neededSchema?.type == kArray) {
            final itemsSchema = neededSchema?.items;

            if (itemsSchema?.properties.isNotEmpty == true) {
              final pathText = key.split('/').map((e) => e.pascalCase).join();
              final requestText = operation.pascalCase;
              results['$pathText$requestText\$Response'] = neededSchema!;
            }
          }
        }
      });
    });

    return results;
  }

  String generateBase({
    required SwaggerRoot root,
    required String fileName,
    required Map<String, SwaggerSchema> classes,
    required List<EnumModel> allEnums,
    required bool generateEnumsMethods,
  }) {
    final allEnumsString = generateEnumsMethods
        ? allEnums.map((e) => e.generateFromJsonToJson()).join()
        : '';

    final allEnumListNames = getAllListEnumNames(root);

    final classesFromResponses = getClassesFromResponses(root);
    classes.addAll(classesFromResponses);

    final classesFromInnerClasses = getClassesFromInnerClasses(classes);

    classes.addAll(classesFromInnerClasses);

    if (classes.isEmpty) {
      return allEnumsString;
    }

    var results = classes.keys.map((String className) {
      if (classes['enum'] != null) {
        return '';
      }

      final currentClass = classes[className]!;

      return generateModelClassContent(
        root,
        className.pascalCase,
        currentClass,
        classes,
        options.defaultValuesMap,
        options.classesWithNullabeLists,
        allEnums.map((e) => e.name).toList(),
        allEnumListNames,
        classes,
      );
    }).join('\n');

    final listEnums = getAllListEnumNames(root);

    for (var listEnum in listEnums) {
      results = results.replaceAll(' $listEnum ', ' List<$listEnum> ');
    }

    return results + allEnumsString;
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
      allEnumNames: allEnumNames,
      allEnumListNames: allEnumListNames,
      propertyName: propertyName,
      typeName: typeName.toString(),
      defaultValue: prop.defaultValue,
      isList: false,
    );

    final dateToJsonValue = generateToJsonForDate(prop);

    final includeIfNullString = generateIncludeIfNullString();

    if (typeName != kDynamic) {
      typeName += '?';
    }

    final propertyKey = propertyName.replaceAll('\$', '\\\$');

    final jsonKeyContent =
        "@JsonKey(name: '$propertyKey'$includeIfNullString$dateToJsonValue${unknownEnumValue.jsonKey})\n";
    return '\t$jsonKeyContent\tfinal $typeName ${generateFieldName(propertyName)};${unknownEnumValue.fromJson}';
  }

  JsonEnumValue generateEnumValue({
    required List<String> allEnumNames,
    required List<String> allEnumListNames,
    required String propertyName,
    required String typeName,
    required dynamic defaultValue,
    required bool isList,
    String className = '',
  }) {
    final validatedTypeName = getValidatedClassName(typeName);

    var jsonKey = '';
    var fromJson = '';
    if (validatedTypeName.startsWith('enums.')) {
      isList = isList || allEnumListNames.contains(validatedTypeName);

      final enumNameCamelCase = typeName.replaceAll('enums.', '').camelCase;
      final propertyNameCamelCase = propertyName.pascalCase;
      final fromJsonPrefix = defaultValue == null
          ? enumNameCamelCase
          : '$enumNameCamelCase$propertyNameCamelCase';
      final String fromJsonSuffix;
      final String toJsonSuffix;

      var defaultValueSuffix = '';

      if (isList && options.classesWithNullabeLists.contains(className)) {
        defaultValueSuffix = 'defaultValue: null,';
      }

      if (isList) {
        fromJsonSuffix =
            options.classesWithNullabeLists.contains(className) && isList
                ? 'NullableListFromJson'
                : 'ListFromJson';
        toJsonSuffix = 'ListToJson';
      } else {
        fromJsonSuffix = 'FromJson';
        toJsonSuffix = 'ToJson';
      }
      final fromJsonFunction = '$fromJsonPrefix$fromJsonSuffix';
      jsonKey =
          ', toJson: $enumNameCamelCase$toJsonSuffix, fromJson: $fromJsonFunction, $defaultValueSuffix';

      if (defaultValue != null) {
        var returnType = '';
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
          final defaultValueCamelCase = EnumModel.getValidatedEnumFieldName(
            defaultValue?.toString() ?? '',
            defaultValue?.toString() ?? '',
            false,
            [],
          );

          defaultValueString =
              '$validatedTypeName.${defaultValueCamelCase.substring(0, defaultValueCamelCase.indexOf('('))}';
        }

        if (options.classesWithNullabeLists.contains(className) && isList) {
          returnType = '$returnType?';
        }

        fromJson = '''

static $returnType $fromJsonFunction($valueType? value) => $enumNameCamelCase$fromJsonSuffix(value, $defaultValueString);
            ''';
      }
    }

    return JsonEnumValue(
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
      allEnumNames: allEnumNames,
      allEnumListNames: allEnumListNames,
      propertyName: propertyName,
      typeName: typeName,
      defaultValue: prop.defaultValue,
      isList: false,
    );

    final dateToJsonValue = generateToJsonForDate(prop);

    final jsonKeyContent =
        "@JsonKey(name: '${_validatePropertyKey(propertyKey)}'$includeIfNullString${unknownEnumValue.jsonKey}$dateToJsonValue)\n";

    typeName =
        nullable(typeName, className, requiredProperties, propertyKey, prop);

    return '\t$jsonKeyContent\tfinal $typeName ${generateFieldName(propertyName)};${unknownEnumValue.fromJson}';
  }

  String _validatePropertyKey(String key) {
    return key.replaceAll('\$', '\\\$');
  }

  String generatePropertyContentByAllOf({
    required SwaggerSchema prop,
    required String propertyKey,
    required String className,
    required List<String> allEnumNames,
    required List<String> allEnumListNames,
    required String propertyName,
    required List<String> requiredProperties,
    required Map<String, String> basicTypesMap,
  }) {
    final allOf = prop.allOf;
    String typeName;

    if (allOf.length != 1) {
      typeName = kDynamic;
    } else {
      var className = allOf.first.ref.getRef();

      if (allEnumNames.contains(className)) {
        className = 'enums.$className';
      }

      typeName = getValidatedClassName(className);
    }

    if (basicTypesMap.containsKey(typeName)) {
      typeName = basicTypesMap[typeName]!;
    }

    final includeIfNullString = generateIncludeIfNullString();

    final unknownEnumValue = generateEnumValue(
      allEnumNames: allEnumNames,
      allEnumListNames: allEnumListNames,
      propertyName: propertyName,
      typeName: typeName,
      defaultValue: prop.defaultValue,
      isList: false,
    );

    final jsonKeyContent =
        "@JsonKey(name: '${_validatePropertyKey(propertyKey)}'$includeIfNullString${unknownEnumValue.jsonKey})\n";

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
    final refSchema = allClasses[parameterName];
    if (kBasicSwaggerTypes.contains(refSchema?.type) &&
        allClasses[parameterName]?.isEnum != true) {
      if (refSchema?.format == 'datetime') {
        typeName = 'DateTime';
      } else {
        typeName = kBasicTypesMap[refSchema?.type]!;
      }
    } else if (basicTypesMap.containsKey(parameterName)) {
      typeName = basicTypesMap[parameterName]!;
    } else {
      typeName = getValidatedClassName(getParameterTypeName(
          className, propertyName, prop, options.modelPostfix, parameterName));

      typeName = getValidatedClassName(typeName);
    }

    if (allEnumNames.contains(typeName)) {
      typeName = 'enums.$typeName';
    } else if (!basicTypesMap.containsKey(parameterName) &&
        !allEnumListNames.contains(typeName)) {
      typeName += options.modelPostfix;
    }

    final unknownEnumValue = generateEnumValue(
      allEnumNames: allEnumNames,
      allEnumListNames: allEnumListNames,
      propertyName: propertyName,
      typeName: typeName,
      defaultValue: prop.defaultValue,
      className: className,
      isList: false,
    );

    if (allEnumListNames.contains(typeName)) {
      typeName = 'List<$typeName>';
    }

    final includeIfNullString = generateIncludeIfNullString();

    final jsonKeyContent =
        "@JsonKey(name: '${_validatePropertyKey(propertyKey)}'$includeIfNullString${unknownEnumValue.jsonKey})\n";

    typeName =
        nullable(typeName, className, requiredProperties, propertyKey, prop);

    final propertySchema = allClasses[prop.ref.getUnformattedRef()];

    if (propertySchema?.isNullable == true) {
      typeName = typeName.makeNullable();
    }

    if (options.classesWithNullabeLists.contains(className) &&
        typeName.startsWith('List<') &&
        !typeName.endsWith('?')) {
      typeName += '?';
    }

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
      allEnumNames: allEnumNames,
      allEnumListNames: allEnumListNames,
      propertyName: key,
      typeName: enumName,
      defaultValue: prop.defaultValue,
      isList: false,
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
    required Map<String, SwaggerSchema> allClasses,
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
              !allEnumNames.contains(typeName) &&
              !basicTypesMap.containsKey(typeName)) {
            typeName += options.modelPostfix;
          }
        }

        if (basicTypesMap.containsKey(typeName)) {
          typeName = basicTypesMap[typeName]!;
        } else if (typeName.isNotEmpty && typeName != kDynamic) {
          typeName = typeName.pascalCase;
        }
      } else if (!allEnumNames.contains(typeName) &&
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
            allClasses: allClasses,
            prop: items,
            propertyName: propertyName,
          ).makeNullable().asList();
        }
      }

      if (allEnumNames.contains(typeName)) {
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

    if (items?.properties.isNotEmpty == true) {
      typeName += '\$Item';
    }

    return typeName;
  }

  String generateListPropertyContent(
    String propertyName,
    String propertyKey,
    String className,
    SwaggerSchema prop,
    List<String> classesWithNullableLists,
    List<String> allEnumNames,
    List<String> allEnumListNames,
    Map<String, String> basicTypesMap,
    List<String> requiredParameters,
    Map<String, SwaggerSchema> allClasses,
  ) {
    final typeName = _generateListPropertyTypeName(
      allEnumListNames: allEnumListNames,
      allEnumNames: allEnumNames,
      basicTypesMap: basicTypesMap,
      className: className,
      allClasses: allClasses,
      prop: prop,
      propertyName: propertyName,
    );

    final unknownEnumValue = generateEnumValue(
      allEnumNames: allEnumNames,
      allEnumListNames: allEnumListNames,
      className: className,
      propertyName: propertyName,
      typeName: typeName,
      defaultValue: prop.defaultValue,
      isList: true,
    );

    final includeIfNullString = generateIncludeIfNullString();
    final validatedPropertyKey = _validatePropertyKey(propertyKey);

    String jsonKeyContent;
    if (unknownEnumValue.jsonKey.isEmpty) {
      if (options.classesWithNullabeLists
          .any((element) => RegExp(element).hasMatch(className))) {
        jsonKeyContent =
            "@JsonKey(name: '$validatedPropertyKey'$includeIfNullString)\n";
      } else {
        jsonKeyContent =
            "@JsonKey(name: '$validatedPropertyKey'$includeIfNullString, defaultValue: <$typeName>[])\n";
      }
    } else {
      jsonKeyContent =
          "@JsonKey(name: '$validatedPropertyKey'$includeIfNullString${unknownEnumValue.jsonKey})\n";
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

    var jsonKeyContent =
        "@JsonKey(name: '${_validatePropertyKey(propertyKey)}'$includeIfNullString";

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

    if (allEnumNames.contains(typeName)) {
      typeName = 'enums.$typeName';
    }

    final unknownEnumValue = generateEnumValue(
      allEnumNames: allEnumNames,
      allEnumListNames: allEnumListNames,
      propertyName: propertyName,
      typeName: typeName,
      defaultValue: prop.defaultValue,
      isList: false,
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
    List<String> classesWithNullableLists,
    List<String> allEnumsNames,
    List<String> allEnumListNames,
    Map<String, String> basicTypesMap,
    List<String> requiredProperties,
    Map<String, SwaggerSchema> allClasses,
  ) {
    switch (prop.type) {
      case 'array':
        return generateListPropertyContent(
          propertyName,
          propertyKey,
          className,
          prop,
          classesWithNullableLists,
          allEnumsNames,
          allEnumListNames,
          basicTypesMap,
          requiredProperties,
          allClasses,
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
    List<String> classesWithNullableLists,
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
          classesWithNullableLists,
          allEnumNames,
          allEnumListNames,
          basicTypesMap,
          requiredProperties,
          allClasses,
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
            basicTypesMap: basicTypesMap,
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

  Map<String, String> generateBasicTypesMapFromSchemas(SwaggerRoot root) {
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
          var typeName = ref.getUnformattedRef();
          final schema = allClasses[typeName];

          if (kBasicTypes.contains(schema?.type)) {
            typeName = _mapBasicTypeToDartType(schema!.type, value.format);
          } else {
            typeName = getValidatedClassName(typeName);
          }

          result[key] = typeName.asList();
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
      var fieldName = generateFieldName(
        getParameterName(key.asParameterName(), propertyNames),
      );

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
    List<String> classesWithNullableLists,
    List<String> allEnumNames,
    List<String> allEnumListNames,
    Map<String, SwaggerSchema> allClasses,
  ) {
    final properties = getModelProperties(schema, schemas, allClasses);

    final requiredProperties = _getRequired(schema, schemas);

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
      classesWithNullableLists,
      allEnumNames,
      allEnumListNames,
      requiredProperties,
      allClasses,
    );

    final validatedClassName =
        '${getValidatedClassName(className)}${options.modelPostfix}';

    final copyWithMethod =
        generateCopyWithContent(generatedProperties, validatedClassName);

    final getHashContent = generateGetHashContent(
      generatedProperties,
      validatedClassName,
      options,
    );

    final equalsOverride = generateEqualsOverride(
      generatedProperties,
      validatedClassName,
      options,
    );

    final toStringOverride = options.overrideToString
        ? '''
@override
String toString() => jsonEncode(this);
'''
        : '';

    final fromJson = generatedFromJson(schema, validatedClassName);

    final toJson = generateToJson(schema, validatedClassName);

    final createToJson = generateCreateToJson(schema, validatedClassName);

    final generatedClass = '''
@JsonSerializable(explicitToJson: true $createToJson)
class $validatedClassName{
\t$validatedClassName($generatedConstructorProperties);\n
\t$fromJson\n
\t$toJson\n
$generatedProperties
\tstatic const fromJsonFactory = _\$${validatedClassName}FromJson;

$equalsOverride

$toStringOverride

$getHashContent
}
$copyWithMethod
''';

    return generatedClass;
  }

  String generatedFromJson(SwaggerSchema schema, String validatedClassName) {
    return 'factory $validatedClassName.fromJson(Map<String, dynamic> json) => _\$${validatedClassName}FromJson(json);';
  }

  String generateToJson(SwaggerSchema schema, String validatedClassName) {
    if (options.generateToJsonFor.isEmpty ||
        options.generateToJsonFor.contains(validatedClassName)) {
      return '''
\tstatic const toJsonFactory = _\$${validatedClassName}ToJson;
\tMap<String, dynamic> toJson() => _\$${validatedClassName}ToJson(this);
''';
    }

    return '';
  }

  String generateCreateToJson(SwaggerSchema schema, String validatedClassName) {
    if (options.generateToJsonFor.isEmpty ||
        options.generateToJsonFor.contains(validatedClassName)) {
      return '';
    }

    return ', createToJson: false';
  }

  List<String> _getRequired(
      SwaggerSchema schema, Map<String, SwaggerSchema> schemas,
      [int recursionCount = 5]) {
    final required = <String>{};
    if (recursionCount == 0) {
      return required.toList();
    }
    for (var interface in _getInterfaces(schema)) {
      if (interface.hasRef) {
        final parentName = interface.ref.split('/').last.pascalCase;
        final parentSchema = schemas[parentName];

        required.addAll(parentSchema != null
            ? _getRequired(parentSchema, schemas, recursionCount - 1)
            : []);
      }
      required.addAll(interface.required);
    }
    required.addAll(schema.required);
    return required.toList();
  }

  List<SwaggerSchema> _getInterfaces(SwaggerSchema schema) {
    if (schema.allOf.isNotEmpty) {
      return schema.allOf;
    } else if (schema.anyOf.isNotEmpty) {
      return schema.anyOf;
    } else if (schema.oneOf.isNotEmpty) {
      return schema.oneOf;
    }
    return [];
  }

  String generateEqualsOverride(
    String generatedProperties,
    String validatedClassName,
    GeneratorOptions options,
  ) {
    if (!options.overrideEqualsAndHashcode) {
      return '';
    }

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
    final splittedCopyWithProperties = RegExp(
      'final (.+) (.+);',
    ).allMatches(generatedProperties).map((e) {
      var type = e.group(1)!;
      if (!type.endsWith('?') && type != kDynamic) {
        type += '?';
      }
      return '$type ${e.group(2)!}';
    });

    final splittedCopyWithWrappedProperties = RegExp(
      'final (.+) (.+);',
    ).allMatches(generatedProperties).map((e) {
      return 'Wrapped<${e.group(1)!}>? ${e.group(2)!}';
    });

    if (splittedCopyWithProperties.isEmpty) {
      return '';
    }

    final spittedCopyWithPropertiesJoined =
        splittedCopyWithProperties.join(', ');

    final spittedCopyWithWrappedPropertiesJoined =
        splittedCopyWithWrappedProperties.join(', ');

    final splittedCopyWithPropertiesNamesContent = splittedCopyWithProperties
        .map((e) => e.substring(e.indexOf(' ') + 1))
        .map((e) => '$e: $e ?? this.$e')
        .join(',\n');

    final splittedCopyWithWrappedPropertiesNamesContent =
        splittedCopyWithWrappedProperties
            .map((e) => e.substring(e.indexOf(' ') + 1))
            .map((e) => '$e: ($e != null ? $e.value : this.$e)')
            .join(',\n');

    final copyWith =
        '$validatedClassName copyWith({$spittedCopyWithPropertiesJoined}) { return $validatedClassName($splittedCopyWithPropertiesNamesContent); }';

    final copyWithWrapped =
        '$validatedClassName copyWithWrapped({$spittedCopyWithWrappedPropertiesJoined}) { return $validatedClassName($splittedCopyWithWrappedPropertiesNamesContent); }';

    return 'extension \$${validatedClassName}Extension on $validatedClassName { $copyWith $copyWithWrapped}';
  }

  String generateGetHashContent(
    String generatedProperties,
    String validatedClassName,
    GeneratorOptions options,
  ) {
    if (!options.overrideEqualsAndHashcode) {
      return '';
    }

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
    SwaggerSchema schema,
    Map<String, SwaggerSchema> schemas,
    Map<String, SwaggerSchema> allClasses,
  ) {
    if (schema.allOf.isEmpty) {
      return schema.properties;
    }

    final allOf = schema.allOf;

    final newModelMap = allOf.firstWhereOrNull((m) => m.properties.isNotEmpty);

    final currentProperties = schema.properties;

    currentProperties.addAll(newModelMap?.properties ?? {});

    final refs = allOf.where((element) => element.ref.isNotEmpty).toList();
    for (var allOf in refs) {
      final allOfSchema = allClasses[allOf.ref.getUnformattedRef()];

      if (allOfSchema != null) {
        final properties = allOfSchema.properties;
        for (final allOf in allOfSchema.allOf) {
          properties.addAll(allOf.properties);
        }
      }

      currentProperties.addAll(allOfSchema?.properties ?? {});
    }

    if (currentProperties.isEmpty) {
      return {};
    }

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
              final className = '${pathKey.pascalCase}${requestKey.pascalCase}';

              result[getValidatedClassName(className)] = schema;
            }
          }
        }
      });
    });

    return result;
  }
}

class JsonEnumValue {
  JsonEnumValue({
    required this.jsonKey,
    required this.fromJson,
  });

  final String jsonKey;
  final String fromJson;
}
