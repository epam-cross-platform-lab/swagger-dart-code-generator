import 'package:recase/recase.dart';
import 'package:swagger_dart_code_generator/src/code_generators/constants.dart';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_generator_base.dart';
import 'package:swagger_dart_code_generator/src/exception_words.dart';
import 'package:swagger_dart_code_generator/src/extensions/string_extension.dart';
import 'package:swagger_dart_code_generator/src/models/generator_options.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/requests/swagger_request.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/requests/swagger_request_parameter.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/responses/swagger_schema.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/swagger_path.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/swagger_root.dart';
import 'package:collection/collection.dart';

abstract class SwaggerEnumsGenerator extends SwaggerGeneratorBase {
  final GeneratorOptions _options;

  @override
  GeneratorOptions get options => _options;

  static const String defaultEnumFieldName = 'value_';
  static const String defaultEnumValueName = 'swaggerGeneratedUnknown';

  SwaggerEnumsGenerator(this._options);

  String generate(SwaggerRoot root, String fileName);

  String generateFromMap(
      SwaggerRoot root,
      String fileName,
      Map<String, SwaggerSchema> definitions,
      Map<String, SwaggerSchema> responses,
      Map<String, SwaggerSchema> requestBodies) {
    final enumsFromRequests = generateEnumsContentFromRequests(root, fileName);
    final enumsFromResponses = generateEnumsFromSchemaMap(responses);
    final enumsFromRequestBodies = generateEnumsFromSchemaMap(requestBodies);

    if (definitions.isEmpty) {
      return '$enumsFromRequests$enumsFromResponses$enumsFromRequestBodies';
    }

    final enumsFromClasses = definitions.keys
        .map((String className) {
          return generateEnumsFromClasses(
            getValidatedClassName(className.pascalCase),
            definitions[className]!,
            definitions,
          );
        })
        .where((element) => element.isNotEmpty)
        .join('\n');

    if (enumsFromClasses.isEmpty &&
        enumsFromRequests.isEmpty &&
        enumsFromResponses.isEmpty &&
        enumsFromRequestBodies.isEmpty) {
      return '';
    }

    return '''
import 'package:json_annotation/json_annotation.dart';
$enumsFromClasses

$enumsFromRequests

$enumsFromResponses

$enumsFromRequestBodies
''';
  }

  String generateEnumsFromSchemaMap(Map<String, SwaggerSchema> map) {
    if (map.isEmpty) {
      return '';
    }

    final enumsFromSchemas = map.keys
        .map((String className) {
          final schema = map[className];

          if (schema == null) {
            return '';
          }

          return generateEnumsFromClasses(
            getValidatedClassName(className.pascalCase),
            schema,
            {},
          );
        })
        .where((element) => element.isNotEmpty)
        .join('\n');

    return enumsFromSchemas;
  }

  String generateEnumsContentFromRequests(
      SwaggerRoot swaggerRoot, String fileName) {
    final enumNames = <String>[];
    final result = StringBuffer();

    final definedParameters = <String, SwaggerRequestParameter>{};
    definedParameters.addAll(swaggerRoot.parameters);
    definedParameters.addAll(swaggerRoot.components?.parameters ?? {});

    //Link defined parameters with requests
    swaggerRoot.paths.forEach((String path, SwaggerPath swaggerPath) {
      swaggerPath.requests
          .forEach((String requestType, SwaggerRequest swaggerRequest) {
        swaggerRequest.parameters =
            swaggerRequest.parameters.map((SwaggerRequestParameter parameter) {
          if (definedParameters
              .containsKey(parameter.ref.getUnformattedRef())) {
            return definedParameters[parameter.ref.getUnformattedRef()]!;
          }

          return getOriginalOrOverriddenRequestParameter(parameter,
              swaggerRoot.components?.parameters.values.toList() ?? []);
        }).toList();
      });
    });

    swaggerRoot.paths.forEach((String path, SwaggerPath swaggerPath) {
      swaggerPath.requests
          .forEach((String requestType, SwaggerRequest swaggerRequest) {
        if (swaggerRequest.parameters.isEmpty) {
          return;
        }

        for (var p = 0; p < swaggerRequest.parameters.length; p++) {
          final swaggerRequestParameter = swaggerRequest.parameters[p];

          var name = generateRequestEnumName(
              path, requestType, swaggerRequestParameter.name);

          name = getValidatedClassName(name);

          if (enumNames.contains(name)) {
            continue;
          }

          final enumValues = swaggerRequestParameter.schema?.enumValues ??
              swaggerRequestParameter.items?.enumValues ??
              [];

          final isInteger =
              kIntegerTypes.contains(swaggerRequestParameter.schema?.type) ||
                  kIntegerTypes.contains(swaggerRequestParameter.items?.type);

          if (enumValues.isNotEmpty) {
            final enumContent = generateEnumContent(
              name,
              enumValues,
              isInteger,
            );

            result.writeln(enumContent);
            enumNames.add(swaggerRequestParameter.name);
          }
        }
      });
    });

    return result.toString();
  }

  String generateEnumContent(
    String enumName,
    List<String> enumValues,
    bool isInteger,
  ) {
    final enumValuesContent = getEnumValuesContent(
      enumValues: enumValues,
      isInteger: isInteger,
      enumValuesNames: [],
    );

    final enumMap = '''
\n\tconst \$${enumName}Map = {
\t${getEnumValuesMapContent(
      enumName,
      enumValues: enumValues,
      enumValuesNames: [],
      isInteger: isInteger,
    )}
      };
      ''';

    final result = """
enum $enumName{
\t@JsonValue('swaggerGeneratedUnknown')
\tswaggerGeneratedUnknown,
$enumValuesContent
}

$enumMap
 """;

    return result;
  }

  String getEnumValuesContent({
    required List<String> enumValues,
    required List<String> enumValuesNames,
    required bool isInteger,
  }) {
    final result = <String>[];
    final resultStrings = <String>[];

    for (int i = 0; i < enumValues.length; i++) {
      final value = enumValues[i];
      var validatedValue = value;

      if (enumValuesNames.length == enumValues.length) {
        validatedValue = enumValuesNames[i];
      }

      validatedValue = getValidatedEnumFieldName(validatedValue);

      while (result.contains(validatedValue)) {
        validatedValue += '\$';
      }

      result.add(validatedValue);

      if (isInteger) {
        resultStrings.add(
            "\t@JsonValue(${value.replaceAll("\$", "\\\$")})\n\t$validatedValue");
      } else {
        resultStrings.add(
            "\t@JsonValue('${value.replaceAll("\$", "\\\$")}')\n\t$validatedValue");
      }
    }

    return resultStrings.join(',\n');
  }

  String getEnumValuesMapContent(
    String enumName, {
    required List<String> enumValues,
    required List<String> enumValuesNames,
    required bool isInteger,
  }) {
    final neededStrings = <String>[];
    final fields = <String>[];

    for (int i = 0; i < enumValues.length; i++) {
      final value = enumValues[i];
      var validatedValue = value;

      if (enumValuesNames.length == enumValues.length) {
        validatedValue = enumValuesNames[i];
      }

      validatedValue = getValidatedEnumFieldName(validatedValue);

      while (fields.contains(validatedValue)) {
        validatedValue += '\$';
      }

      fields.add(validatedValue);
      if (isInteger) {
        neededStrings.add(
            '\t$enumName.$validatedValue: ${value.replaceAll('\$', '\\\$')}');
      } else {
        neededStrings.add(
            '\t$enumName.$validatedValue: \'${value.replaceAll('\$', '\\\$')}\'');
      }
    }

    return neededStrings.join(',\n');
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

    return result.lower;
  }

  String generateEnumsContentFromModelProperties(
      Map<String, SwaggerSchema> map, String className) {
    if (map.isEmpty) {
      return '';
    }

    final gemeratedEnumsContent = map.keys
        .map((String key) {
          final enumValues = map[key];

          if (enumValues != null && enumValues.type.isNotEmpty) {
            return generateEnumContentIfPossible(
                enumValues, generateEnumName(className, key));
          }

          return '';
        })
        .where((String generatedEnum) => generatedEnum.isNotEmpty)
        .join('\n');

    return gemeratedEnumsContent;
  }

  bool isIntegerEnum(SwaggerSchema map) {
    if (kIntegerTypes.contains(map.type)) {
      return true;
    }

    final enumValues = map.enumValuesObj;

    return enumValues.isNotEmpty && enumValues.first is int;
  }

  String generateEnumContentIfPossible(SwaggerSchema schema, String enumName) {
    enumName = getValidatedClassName(enumName);

    if (schema.isEnum) {
      final enumValues = schema.enumValues;

      final enumValuesNames = schema.enumNames ?? [];

      final isInteger = isIntegerEnum(schema);

      final enumMap = '''
\n\tconst \$${enumName}Map = {
\t${getEnumValuesMapContent(
        enumName,
        enumValues: enumValues,
        enumValuesNames: enumValuesNames,
        isInteger: isInteger,
      )}
      };
      ''';

      return """
enum ${enumName.capitalize} {
\t@JsonValue('$defaultEnumValueName')\n  $defaultEnumValueName,
${getEnumValuesContent(
        enumValues: enumValues,
        enumValuesNames: enumValuesNames,
        isInteger: isInteger,
      )}
}

$enumMap
""";
    } else if (schema.items != null) {
      return generateEnumContentIfPossible(schema.items!, enumName);
    } else {
      return '';
    }
  }

  String generateEnumsFromClasses(
    String className,
    SwaggerSchema schema,
    Map<String, SwaggerSchema> schemas,
  ) {
    if (schema.isEnum) {
      return generateEnumContentIfPossible(schema, className);
    }

    if (schema.items != null) {
      if (schema.items!.isEnum) {
        return generateEnumContentIfPossible(schema.items!, className);
      }

      if (schema.items?.properties.isNotEmpty == true) {
        var result = '';

        schema.items?.properties.forEach((key, value) {
          result +=
              generateEnumContentIfPossible(value, '$className\$Item$key');
        });

        return result;
      }

      return generateEnumContentIfPossible(schema.items!, className);
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
      return '';
    }

    return generateEnumsContentFromModelProperties(properties, className);
  }
}
