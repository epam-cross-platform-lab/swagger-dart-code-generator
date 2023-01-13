import 'package:collection/collection.dart';
import 'package:recase/recase.dart';
import 'package:swagger_dart_code_generator/src/code_generators/constants.dart';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_generator_base.dart';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_models_generator.dart';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_requests_generator.dart';
import 'package:swagger_dart_code_generator/src/exception_words.dart';
import 'package:swagger_dart_code_generator/src/extensions/string_extension.dart';
import 'package:swagger_dart_code_generator/src/models/generator_options.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/requests/swagger_request.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/requests/swagger_request_parameter.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/responses/swagger_schema.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/swagger_path.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/swagger_root.dart';

abstract class SwaggerEnumsGenerator extends SwaggerGeneratorBase {
  final GeneratorOptions _options;

  @override
  GeneratorOptions get options => _options;

  static const String defaultEnumValueName = 'swaggerGeneratedUnknown';

  SwaggerEnumsGenerator(this._options);

  String generate(SwaggerRoot root, String fileName);

  List<EnumModel> generateAllEnums(
      SwaggerRoot root,
      String fileName,
      Map<String, SwaggerSchema> definitions,
      Map<String, SwaggerSchema> responses,
      Map<String, SwaggerSchema> requestBodies) {
    final enumsFromRequests = generateEnumsContentFromRequests(root, fileName);
    final enumsFromResponses = generateEnumsFromSchemaMap(responses);
    final enumsFromRequestBodies = generateEnumsFromSchemaMap(requestBodies);

    if (definitions.isEmpty) {
      return [
        ...enumsFromRequests,
        ...enumsFromResponses,
        ...enumsFromRequestBodies,
      ];
    }

    final enumsFromClasses = definitions.keys
        .map((String className) {
          return generateEnumsFromClasses(
            getValidatedClassName(className.pascalCase),
            definitions[className]!,
            definitions,
          );
        })
        .expand((w) => w)
        .toList();

    return [
      ...enumsFromClasses,
      ...enumsFromRequests,
      ...enumsFromResponses,
      ...enumsFromRequestBodies,
    ];
  }

  String generateFromMap(
      SwaggerRoot root,
      String fileName,
      Map<String, SwaggerSchema> definitions,
      Map<String, SwaggerSchema> responses,
      Map<String, SwaggerSchema> requestBodies) {
    final allEnums = generateAllEnums(
      root,
      fileName,
      definitions,
      responses,
      requestBodies,
    );

    if (allEnums.isEmpty) {
      return '';
    }

    return '''
import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
${allEnums.map((e) => e.toString()).join('\n')}
''';
  }

  List<EnumModel> generateEnumsFromSchemaMap(Map<String, SwaggerSchema> map) {
    if (map.isEmpty) {
      return [];
    }

    return map.keys
        .map<List<EnumModel>>((String className) {
          final schema = map[className];

          if (schema == null) {
            return [];
          }

          return generateEnumsFromClasses(
            getValidatedClassName(className.pascalCase),
            schema,
            {},
          );
        })
        .expand((w) => w)
        .toList();
  }

  List<EnumModel> generateEnumsContentFromRequests(
      SwaggerRoot swaggerRoot, String fileName) {
    final result = <EnumModel>[];

    final definedParameters = <String, SwaggerRequestParameter>{};
    definedParameters.addAll(swaggerRoot.parameters);
    definedParameters.addAll(swaggerRoot.components?.parameters ?? {});

    definedParameters.forEach((key, swaggerRequestParameter) {
      final enumValues = swaggerRequestParameter.schema?.enumValues ??
          swaggerRequestParameter.items?.enumValues ??
          [];

      final isInteger =
          kIntegerTypes.contains(swaggerRequestParameter.schema?.type) ||
              kIntegerTypes.contains(swaggerRequestParameter.items?.type);

      if (enumValues.isNotEmpty &&
          swaggerRoot.components?.schemas.containsKey(key) != true) {
        final enumContent = EnumModel(
          name: getValidatedClassName(key),
          values: enumValues,
          isInteger: isInteger,
        );

        result.add(enumContent);
      }
    });

    swaggerRoot.paths.forEach((String path, SwaggerPath swaggerPath) {
      swaggerPath.requests
          .forEach((String requestType, SwaggerRequest swaggerRequest) {
        final successResponse = SwaggerRequestsGenerator.getSuccessedResponse(
            responses: swaggerRequest.responses);
        final successResponseSchema = successResponse?.schema;

        if (successResponseSchema != null) {
          final responseEnums = generateEnumsFromSchemaMap({
            '${path.pascalCase}${requestType.pascalCase}\$$kResponse':
                successResponseSchema
          });
          result.addAll(responseEnums);
        }

        if (swaggerRequest.parameters.isEmpty) {
          return;
        }

        for (var p = 0; p < swaggerRequest.parameters.length; p++) {
          final swaggerRequestParameter = swaggerRequest.parameters[p];

          var name = generateRequestEnumName(
              path, requestType, swaggerRequestParameter.name);

          name = getValidatedClassName(name);

          final enumValues = swaggerRequestParameter.schema?.enumValues ??
              swaggerRequestParameter.items?.enumValues ??
              [];

          final isInteger =
              kIntegerTypes.contains(swaggerRequestParameter.schema?.type) ||
                  kIntegerTypes.contains(swaggerRequestParameter.items?.type);

          if (enumValues.isNotEmpty) {
            final enumContent = EnumModel(
              name: getValidatedClassName(name),
              values: enumValues,
              isInteger: isInteger,
            );

            result.add(enumContent);
          }
        }
      });
    });

    return result;
  }

  List<EnumModel> generateEnumsContentFromModelProperties(
      Map<String, SwaggerSchema> map, String className) {
    if (map.isEmpty) {
      return [];
    }

    final gemeratedEnumsContent = map.keys
        .map<List<EnumModel>>((String key) {
          final enumValues = map[key];

          if (enumValues == null) {
            return [];
          }

          Map<String, SwaggerSchema> properties = {};
          properties.addAll(enumValues.properties);
          properties.addAll(enumValues.items?.properties ?? {});

          final result = <EnumModel>[];

          if (properties.isNotEmpty) {
            final isListProperty =
                enumValues.items?.properties.isNotEmpty == true;

            result.addAll(
              generateEnumsContentFromModelProperties(
                properties,
                '$className\$${key.pascalCase}${isListProperty ? '\$Item' : ''}',
              ),
            );
          }

          if (enumValues.type.isNotEmpty) {
            final enumModel = generateEnumContentIfPossible(
              enumValues,
              generateEnumName(className, key),
            );

            if (enumModel != null) {
              result.add(enumModel);
            }
          }

          return result;
        })
        .expand((w) => w)
        .toList();

    return gemeratedEnumsContent;
  }

  bool isIntegerEnum(SwaggerSchema map) {
    if (kIntegerTypes.contains(map.type)) {
      return true;
    }

    final enumValues = map.enumValuesObj;

    return enumValues.isNotEmpty && enumValues.first is int;
  }

  EnumModel? generateEnumContentIfPossible(
      SwaggerSchema schema, String enumName) {
    enumName = getValidatedClassName(enumName);

    if (schema.isEnum) {
      final enumValues = schema.enumValues;

      final isInteger = isIntegerEnum(schema);

      return EnumModel(
        name: getValidatedClassName(enumName),
        values: enumValues,
        isInteger: isInteger,
      );
    } else if (schema.items != null) {
      return generateEnumContentIfPossible(schema.items!, enumName);
    } else {
      return null;
    }
  }

  List<EnumModel> generateEnumsFromClasses(
    String className,
    SwaggerSchema schema,
    Map<String, SwaggerSchema> schemas,
  ) {
    if (schema.isEnum) {
      final enumModel = generateEnumContentIfPossible(schema, className);

      return enumModel == null ? [] : [enumModel];
    }

    if (schema.items != null) {
      if (schema.items!.isEnum) {
        final enumModel =
            generateEnumContentIfPossible(schema.items!, className);
        return enumModel == null ? [] : [enumModel];
      }

      if (schema.items?.properties.isNotEmpty == true) {
        var result = <EnumModel>[];

        schema.items?.properties.forEach((key, value) {
          final enumModel = generateEnumContentIfPossible(
              value, '$className\$Item${key.pascalCase}');
          if (enumModel != null) {
            result.add(enumModel);
          }
        });

        return result;
      }

      final enumModel = generateEnumContentIfPossible(schema.items!, className);

      return enumModel == null ? [] : [enumModel];
    }

    Map<String, SwaggerSchema> properties;

    if (schema.allOf.isNotEmpty) {
      final allOf = schema.allOf;
      var propertiesContainer = allOf.firstWhereOrNull(
        (e) => e.properties.isNotEmpty,
      );

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

    if (properties.isEmpty) {
      return [];
    }

    return generateEnumsContentFromModelProperties(properties, className);
  }
}

class EnumModel {
  final String name;
  final List<String> values;
  final bool isInteger;

  static const String defaultEnumFieldName = 'value_';

  const EnumModel({
    required this.name,
    required this.values,
    required this.isInteger,
  });

  @override
  String toString() {
    return '''
${_getEnumContent()}
${_getEnumValuesMapContent()}
${_generateEnumFromJsonToJson()}
''';
  }

  String _getEnumValuesMapContent() {
    final neededStrings = <String>[];
    final fields = <String>[];

    for (int i = 0; i < values.length; i++) {
      final value = values[i];
      var validatedValue = value;

      validatedValue = getValidatedEnumFieldName(validatedValue);

      while (fields.contains(validatedValue)) {
        validatedValue += '\$';
      }

      fields.add(validatedValue);
      if (isInteger) {
        neededStrings
            .add('\t$name.$validatedValue: ${value.replaceAll('\$', '\\\$')}');
      } else {
        neededStrings.add(
            '\t$name.$validatedValue: \'${value.replaceAll('\$', '\\\$')}\'');
      }
    }

    return '''
const \$${name}Map = {
${neededStrings.join(',\n')}};''';
  }

  String _getEnumContent() {
    final resultStrings = <String>[];

    for (int i = 0; i < values.length; i++) {
      final value = values[i];
      var validatedValue = value;

      validatedValue = getValidatedEnumFieldName(validatedValue);

      if (isInteger) {
        resultStrings.add(
            "\t@JsonValue(${value.replaceAll("\$", "\\\$")})\n\t$validatedValue");
      } else {
        resultStrings.add(
            "\t@JsonValue('${value.replaceAll("\$", "\\\$")}')\n\t$validatedValue");
      }
    }

    return '''
enum $name {
@JsonValue('swaggerGeneratedUnknown')
swaggerGeneratedUnknown,
${resultStrings.join(',\n')}
}''';
  }

  static String getValidatedEnumFieldName(String name) {
    if (name.isEmpty) {
      name = 'null';
    }

    var result = name
        .replaceAll(RegExp(r'[^\w|\_|)]'), '_')
        .split('_')
        .where((element) => element.isNotEmpty)
        .map((String word) => word.toLowerCase().capitalize)
        .join();

    if (result.startsWith(RegExp('[0-9]+'))) {
      result = defaultEnumFieldName + result;
    }

    if (exceptionWords.contains(result.toLowerCase())) {
      return '\$' + result.lower;
    }

    if (result.isEmpty) {
      return 'undefined';
    }

    return result.lower;
  }

  String _generateEnumFromJsonToJson() {
    final type = isInteger ? 'int' : 'String';
    final defaultTypeValue = isInteger ? 0 : '\'\'';

    return '''
$type? ${name.camelCase}ToJson($name? ${name.camelCase}) {
  return \$${name}Map[${name.camelCase}];
}

$name ${name.camelCase}FromJson(
  Object? ${name.camelCase},
  [$name? defaultValue,]
  ) {

${isInteger ? '''
if(${name.camelCase} is int)
  {
    return \$${name}Map.entries
      .firstWhere((element) => element.value == ${name.camelCase},
      orElse: () => const MapEntry($name.swaggerGeneratedUnknown, $defaultTypeValue))
      .key;
  }
''' : '''
if(${name.camelCase} is String)
  {
 return \$${name}Map.entries
      .firstWhere((element) => element.value == ${name.camelCase},
      orElse: () => const MapEntry($name.swaggerGeneratedUnknown, $defaultTypeValue))
      .key;
      }
'''}
 
    final parsedResult = defaultValue == null ? null : \$${name}Map.entries
      .firstWhereOrNull((element) => element.value == defaultValue)
      ?.key;

  return parsedResult ??
      defaultValue ??
      $name.swaggerGeneratedUnknown;
}


List<$type> ${name.camelCase}ListToJson(
    List<$name>? ${name.camelCase}) {

  if(${name.camelCase} == null)
  {
    return [];
  }

  return ${name.camelCase}
      .map((e) => \$${name}Map[e]!)
      .toList();
}

List<$name> ${name.camelCase}ListFromJson(
    List? ${name.camelCase},
    [List<$name>? defaultValue,]) {

  if(${name.camelCase} == null)
  {
    return defaultValue ?? [];
  }

  return ${name.camelCase}
      .map((e) => ${name.camelCase}FromJson(e.toString()))
      .toList();
}


List<$name>? ${name.camelCase}NullableListFromJson(
    List? ${name.camelCase},
    [List<$name>? defaultValue,]) {

  if(${name.camelCase} == null)
  {
    return defaultValue;
  }

  return ${name.camelCase}
      .map((e) => ${name.camelCase}FromJson(e.toString()))
      .toList();
}
    ''';
  }
}
