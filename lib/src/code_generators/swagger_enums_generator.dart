import 'package:collection/collection.dart';
import 'package:recase/recase.dart';
import 'package:swagger_dart_code_generator/src/code_generators/constants.dart';
import 'package:swagger_dart_code_generator/src/code_generators/enum_model.dart';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_generator_base.dart';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_requests_generator.dart';
import 'package:swagger_dart_code_generator/src/code_generators/v2/swagger_models_generator_v2.dart';
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

  String generate({
    required SwaggerRoot root,
    required String fileName,
    required List<EnumModel> allEnums,
  });

  List<EnumModel> generateAllEnums({
    required SwaggerRoot root,
    required String fileName,
  }) {
    final requestBodies = root.components?.requestBodies ?? {};
    requestBodies.addAll(
        SwaggerModelsGeneratorV2(options).getRequestBodiesFromRequests(root));

    final responses = root.components?.responses ?? {};
    final definitions = root.components?.schemas ?? {};
    definitions.addAll(root.definitions);

    final enumsFromRequests = generateEnumsContentFromRequests(root, fileName);
    final enumsFromResponses = generateEnumsFromSchemaMap(responses);
    final enumsFromRequestBodies = generateEnumsFromSchemaMap(requestBodies);

    final enumsFromClasses = definitions.keys
        .map((String className) {
          final result = generateEnumsFromClasses(
            getValidatedClassName(className.pascalCase),
            definitions[className]!,
            definitions,
          );

          return result;
        })
        .expand((w) => w)
        .toList();

    final result = [
      ...enumsFromClasses,
      ...enumsFromRequests,
      ...enumsFromResponses,
      ...enumsFromRequestBodies,
    ];

    return result;
  }

  String generateFromMap(
    SwaggerRoot root,
    String fileName,
    Map<String, SwaggerSchema> definitions,
    Map<String, SwaggerSchema> responses,
    Map<String, SwaggerSchema> requestBodies,
    List<EnumModel> allEnums,
  ) {
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

      final enumNames = swaggerRequestParameter.schema?.enumNames ?? [];

      final isInteger =
          kIntegerTypes.contains(swaggerRequestParameter.schema?.type) ||
              kIntegerTypes.contains(swaggerRequestParameter.items?.type);

      if (enumValues.isNotEmpty &&
          swaggerRoot.components?.schemas.containsKey(key) != true) {
        final enumContent = EnumModel(
          name: getValidatedClassName(key),
          values: enumValues,
          enumNames: enumNames,
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

          final enumNames = swaggerRequestParameter.schema?.enumNames ?? [];

          final isInteger =
              kIntegerTypes.contains(swaggerRequestParameter.schema?.type) ||
                  kIntegerTypes.contains(swaggerRequestParameter.items?.type);

          if (enumValues.isNotEmpty) {
            final enumContent = EnumModel(
              name: getValidatedClassName(name),
              values: enumValues,
              enumNames: enumNames,
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

      final enumNames = schema.enumNames ?? [];

      final isInteger = isIntegerEnum(schema);

      return EnumModel(
        name: getValidatedClassName(enumName),
        values: enumValues,
        enumNames: enumNames,
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

        if (allOfModel?.allOf.isNotEmpty == true) {
          final allOfRef =
              allOfModel?.allOf.firstWhereOrNull((e) => e.hasRef)?.ref ?? '';
          final allOfModelInside = schemas[allOfRef.getUnformattedRef()];

          properties.addAll(allOfModelInside?.properties ?? {});
        }

        if (allOfModel?.allOf.isNotEmpty == true) {
          final allOfInside = allOfModel?.allOf.first;

          properties.addAll(allOfInside?.properties ?? {});
        }

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
