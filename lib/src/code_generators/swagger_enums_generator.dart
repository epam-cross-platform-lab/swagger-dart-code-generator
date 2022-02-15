import 'package:recase/recase.dart';
import 'package:swagger_dart_code_generator/src/code_generators/constants.dart';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_models_generator.dart';
import 'package:swagger_dart_code_generator/src/exception_words.dart';
import 'package:swagger_dart_code_generator/src/extensions/string_extension.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/requests/swagger_request.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/requests/swagger_request_parameter.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/swagger_path.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/swagger_root.dart';
import 'package:collection/collection.dart';

abstract class SwaggerEnumsGenerator {
  static const String defaultEnumFieldName = 'value_';
  static const String defaultEnumValueName = 'swaggerGeneratedUnknown';

  String generate(Map<String, dynamic> map, String fileName);

  String generateFromMap(
      Map<String, dynamic> map,
      String fileName,
      Map<String, dynamic> definitions,
      Map<String, dynamic> responses,
      Map<String, dynamic> requestBodies) {
    final enumsFromRequests = generateEnumsContentFromRequests(map, fileName);

    final enumsFromResponses = generateEnumsFromResponses(responses);

    final enumsFromRequestBodies =
        generateEnumsFromRequestBodies(requestBodies);

    if (definitions.isEmpty) {
      return '$enumsFromRequests$enumsFromResponses$enumsFromRequestBodies';
    }

    final enumsFromClasses = definitions.keys
        .map((String className) {
          return generateEnumsFromClasses(
            SwaggerModelsGenerator.getValidatedClassName(className.pascalCase),
            definitions[className] as Map<String, dynamic>,
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

  String generateEnumsFromResponses(Map<String, dynamic> responses) {
    if (responses.isEmpty) {
      return '';
    }

    final enumsFromResponses = responses.keys
        .map((String className) {
          final response = responses[className];
          final content = response['content'] as Map<String, dynamic>?;
          final firstContent = content != null && content.entries.isNotEmpty
              ? content.entries.first.value
              : null;
          final schema = firstContent == null ? null : firstContent['schema'];

          if (schema == null) {
            return '';
          }

          return generateEnumsFromClasses(
            SwaggerModelsGenerator.getValidatedClassName(className.pascalCase),
            schema as Map<String, dynamic>,
            {},
          );
        })
        .where((element) => element.isNotEmpty)
        .join('\n');

    return enumsFromResponses;
  }

  String generateEnumsFromRequestBodies(Map<String, dynamic> requestBodies) {
    if (requestBodies.isEmpty) {
      return '';
    }

    final enumsFromRequestBodies = requestBodies.keys
        .map((String className) {
          final response = requestBodies[className];
          final content = response['content'] as Map<String, dynamic>?;
          final firstContent = content != null && content.entries.isNotEmpty
              ? content.entries.first.value
              : null;
          final schema = firstContent == null ? null : firstContent['schema'];

          if (schema == null) {
            return '';
          }

          return generateEnumsFromClasses(
            SwaggerModelsGenerator.getValidatedClassName(className.pascalCase),
            schema as Map<String, dynamic>,
            {},
          );
        })
        .where((element) => element.isNotEmpty)
        .join('\n');

    return enumsFromRequestBodies;
  }

  static SwaggerRequestParameter getOriginalOrOverriddenRequestParameter(
      SwaggerRequestParameter swaggerRequestParameter,
      List<SwaggerRequestParameter> definedParameters) {
    if (swaggerRequestParameter.ref.isEmpty || definedParameters.isEmpty) {
      return swaggerRequestParameter;
    }

    final parameterClassName = swaggerRequestParameter.ref.split('/').last;

    final neededParameter = definedParameters.firstWhere(
        (SwaggerRequestParameter element) =>
            element.name == parameterClassName ||
            element.key == parameterClassName,
        orElse: () => swaggerRequestParameter);

    return neededParameter;
  }

  String generateEnumsContentFromRequests(
      Map<String, dynamic> map, String fileName) {
    final enumNames = <String>[];
    final result = StringBuffer();
    final swaggerRoot = SwaggerRoot.fromJson(map);

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

          var name = SwaggerModelsGenerator.generateRequestEnumName(
              path, requestType, swaggerRequestParameter.name);

          name = SwaggerModelsGenerator.getValidatedClassName(name);

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
\t${getEnumValuesMapContent(enumName, enumValues)}
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

  String getEnumValuesMapContent(String enumName, List<String> enumValues) {
    final neededStrings = <String>[];
    final fields = <String>[];

    for (var value in enumValues) {
      var validatedValue = getValidatedEnumFieldName(value);

      while (fields.contains(validatedValue)) {
        validatedValue += '\$';
      }

      fields.add(validatedValue);
      neededStrings.add(
          '\t$enumName.$validatedValue: \'${value.replaceAll('\$', '\\\$')}\'');
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

  static List<String> getEnumNamesFromRequests(Map<String, dynamic> map) {
    final enumNames = <String>[];
    final swaggerRoot = SwaggerRoot.fromJson(map);

    //Link defined parameters with requests
    swaggerRoot.paths.forEach((String path, SwaggerPath swaggerPath) {
      swaggerPath.requests.forEach((String req, SwaggerRequest swaggerRequest) {
        swaggerRequest.parameters = swaggerRequest.parameters
            .map((SwaggerRequestParameter parameter) =>
                getOriginalOrOverriddenRequestParameter(parameter,
                    swaggerRoot.components?.parameters.values.toList() ?? []))
            .toList();
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

          var name = SwaggerModelsGenerator.generateRequestEnumName(
              path, requestType, swaggerRequestParameter.name);

          if (enumNames.contains(name)) {
            continue;
          }

          final enumValues = swaggerRequestParameter.schema?.enumValues ??
              swaggerRequestParameter.items?.enumValues ??
              [];

          if (enumValues.isNotEmpty) {
            enumNames.add(name);
          }
        }
      });
    });

    return enumNames;
  }

  String generateEnumsContentFromModelProperties(
      Map<String, dynamic> map, String className) {
    if (map.isEmpty) {
      return '';
    }

    final gemeratedEnumsContent = map.keys
        .map((String key) {
          final enumValues = map[key];

          final enumValuesMap = enumValues is Map<String, dynamic>
              ? enumValues
              : <String, dynamic>{};
          map[key];

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

  String generateEnumContentIfPossible(
      Map<String, dynamic> map, String enumName) {
    enumName = SwaggerModelsGenerator.getValidatedClassName(enumName);

    if (map['enum'] != null) {
      final enumValues =
          (map['enum'] as List<dynamic>).map((e) => e.toString()).toList();

      final stringValues = enumValues.map((e) => e.toString()).toList();

      final enumValuesNames =
          (map[kEnumNames] ?? map[kEnumVarnames]) as List? ?? [];

      var enumValuesNamesList = <String>[];
      if (enumValues.isNotEmpty) {
        enumValuesNamesList = enumValuesNames.map((e) => e.toString()).toList();
      }

      final mapValues = enumValuesNamesList.length == stringValues.length
          ? enumValuesNamesList
          : stringValues;

      final enumMap = '''
\n\tconst \$${enumName}Map = {
\t${getEnumValuesMapContent(enumName, mapValues)}
      };
      ''';

      final isInteger = kIntegerTypes.contains(map['type']);

      return """
enum ${enumName.capitalize} {
\t@JsonValue('$defaultEnumValueName')\n  $defaultEnumValueName,
${getEnumValuesContent(
        enumValues: enumValues,
        enumValuesNames: enumValuesNamesList,
        isInteger: isInteger,
      )}
}

$enumMap
""";
    } else if (map['items'] != null) {
      return generateEnumContentIfPossible(
          map['items'] as Map<String, dynamic>, enumName);
    } else {
      return '';
    }
  }

  String generateEnumName(String className, String enumName) {
    return SwaggerModelsGenerator.getValidatedClassName(
        '${className.capitalize}_$enumName');
  }

  String generateEnumsFromClasses(
    String className,
    Map<String, dynamic> map,
    Map<String, dynamic> schemas,
  ) {
    if (map['enum'] != null) {
      return generateEnumContentIfPossible(map, className);
    }

    if (map['items'] != null && map['items']['enum'] != null) {
      return generateEnumContentIfPossible(
          map['items'] as Map<String, dynamic>, className);
    }
    Map<String, dynamic> properties;

    if (map.containsKey('allOf')) {
      final allOf = map['allOf'] as List<dynamic>;
      var propertiesContainer = allOf.firstWhereOrNull(
            (e) => (e as Map<String, dynamic>).containsKey('properties'),
          ) as Map<String, dynamic>? ??
          {};

      if (propertiesContainer.isNotEmpty) {
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
      properties = map['properties'] as Map<String, dynamic>? ?? {};
    }

    if (properties.isEmpty) {
      return '';
    }

    return generateEnumsContentFromModelProperties(properties, className);
  }
}
