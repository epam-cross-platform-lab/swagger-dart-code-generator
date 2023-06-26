import 'package:swagger_dart_code_generator/src/code_generators/enum_model.dart';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_models_generator.dart';
import 'package:swagger_dart_code_generator/src/code_generators/v2/swagger_models_generator_v2.dart';
import 'package:swagger_dart_code_generator/src/extensions/string_extension.dart';
import 'package:swagger_dart_code_generator/src/models/generator_options.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/responses/swagger_schema.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/swagger_root.dart';

class SwaggerModelsGeneratorV3 extends SwaggerModelsGenerator {
  SwaggerModelsGeneratorV3(GeneratorOptions options) : super(options);

  @override
  String generate({
    required SwaggerRoot root,
    required String fileName,
    required List<EnumModel> allEnums,
  }) {
    final components = root.components;
    final requestBodies = components?.requestBodies ?? {};
    final responses = components?.responses ?? {};

    requestBodies.addAll(
        SwaggerModelsGeneratorV2(options).getRequestBodiesFromRequests(root));

    final formattedRequestBodies = <String, SwaggerSchema>{};
    requestBodies.forEach((key, value) {
      formattedRequestBodies['$key\$RequestBody'] = value;
    });

    final formattedResponses = <String, SwaggerSchema>{};
    responses.forEach((key, value) {
      formattedResponses['$key\$Response'] = value;
    });

    final allClasses = {
      ...root.definitions,
      ...root.components?.schemas ?? {},
      ...formattedResponses,
      ...formattedRequestBodies
    };

    final distinctClasses = <String, SwaggerSchema>{};
    allClasses.forEach(
      (key, value) => distinctClasses[getValidatedClassName(key)] = value,
    );

    return generateBase(
      root: root,
      fileName: fileName,
      classes: distinctClasses,
      generateEnumsMethods: true,
      allEnums: allEnums,
    );
  }

  @override
  List<String> getAllListEnumNames(SwaggerRoot root) {
    final results = getEnumsFromRequests(root).map((e) => e.name).toList();

    final components = root.components;

    final schemas = components?.schemas;

    if (schemas != null) {
      schemas.forEach((className, schema) {
        if (schema.isListEnum) {
          results.add(getValidatedClassName(className.capitalize));
          return;
        }
      });
    }

    final resultsWithPrefix = results.map((element) {
      return 'enums.$element';
    }).toList();

    return resultsWithPrefix;
  }

  @override
  String getExtendsString(SwaggerSchema schema) {
    final allOf = schema.allOf;
    if (allOf.isNotEmpty) {
      final refItem = allOf.firstWhere((m) => m.hasRef);

      final ref = refItem.ref.split('/').last;

      final className = getValidatedClassName(ref);

      return 'extends $className';
    }

    return '';
  }
}
