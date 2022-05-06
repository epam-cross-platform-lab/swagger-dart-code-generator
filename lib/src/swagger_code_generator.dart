import 'package:swagger_dart_code_generator/src/code_generators/swagger_additions_generator.dart';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_enums_generator.dart';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_models_generator.dart';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_requests_generator.dart';
import 'package:swagger_dart_code_generator/src/code_generators/v2/swagger_enums_generator_v2.dart';
import 'package:swagger_dart_code_generator/src/code_generators/v2/swagger_models_generator_v2.dart';
import 'package:swagger_dart_code_generator/src/code_generators/v3/swagger_enums_generator_v3.dart';
import 'package:swagger_dart_code_generator/src/code_generators/v3/swagger_models_generator_v3.dart';
import 'package:swagger_dart_code_generator/src/models/generator_options.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/swagger_root.dart';

class SwaggerCodeGenerator {
  Map<int, SwaggerEnumsGenerator> _getEnumsMap(GeneratorOptions options) {
    return <int, SwaggerEnumsGenerator>{
      2: SwaggerEnumsGeneratorV2(options),
      3: SwaggerEnumsGeneratorV3(options)
    };
  }

  Map<int, SwaggerModelsGenerator> _getModelsMap(GeneratorOptions options) {
    return <int, SwaggerModelsGenerator>{
      2: SwaggerModelsGeneratorV2(options),
      3: SwaggerModelsGeneratorV3(options)
    };
  }

  int _getApiVersion(SwaggerRoot root) {
    final openApi = root.openapiVersion;
    return openApi != null ? 3 : 2;
  }

  String generateIndexes(List<String> fileNames, GeneratorOptions options) =>
      _getSwaggerAdditionsGenerator(options).generateIndexes(fileNames);

  String generateConverterMappings(bool hasModels, GeneratorOptions options) =>
      _getSwaggerAdditionsGenerator(options)
          .generateConverterMappings(hasModels);

  String generateImportsContent(
    String swaggerFileName,
    bool hasModels,
    bool buildOnlyModels,
    bool hasEnums,
    bool separateModels,
    GeneratorOptions options,
  ) =>
      _getSwaggerAdditionsGenerator(options).generateImportsContent(
          swaggerFileName,
          hasModels,
          buildOnlyModels,
          hasEnums,
          separateModels);

  String generateResponses(
    SwaggerRoot root,
    String fileName,
    GeneratorOptions options,
  ) =>
      _getSwaggerModelsGenerator(root, options)
          .generateResponses(root, fileName);

  String generateRequestBodies(
    SwaggerRoot root,
    String fileName,
    GeneratorOptions options,
  ) =>
      _getSwaggerModelsGenerator(root, options)
          .generateRequestBodies(root, fileName);

  String generateEnums(
    SwaggerRoot root,
    String fileName,
    GeneratorOptions options,
  ) =>
      _getSwaggerEnumsGenerator(root, options).generate(root, fileName);

  String generateModels(
          SwaggerRoot root, String fileName, GeneratorOptions options) =>
      _getSwaggerModelsGenerator(root, options).generate(root, fileName);

  String generateRequests(SwaggerRoot root, String className, String fileName,
          GeneratorOptions options) =>
      _getSwaggerRequestsGenerator(root, options).generate(
        swaggerRoot: root,
        className: className,
        fileName: fileName,
      );

  String generateCustomJsonConverter(
          String fileName, GeneratorOptions options) =>
      _getSwaggerAdditionsGenerator(options)
          .generateCustomJsonConverter(fileName);

  String generateDateToJson(GeneratorOptions options) =>
      _getSwaggerAdditionsGenerator(options).generateDateToJson();

  SwaggerAdditionsGenerator _getSwaggerAdditionsGenerator(
          GeneratorOptions options) =>
      SwaggerAdditionsGenerator(options);

  SwaggerEnumsGenerator _getSwaggerEnumsGenerator(
    SwaggerRoot root,
    GeneratorOptions options,
  ) =>
      _getEnumsMap(options)[_getApiVersion(root)]!;

  SwaggerModelsGenerator _getSwaggerModelsGenerator(
    SwaggerRoot root,
    GeneratorOptions options,
  ) =>
      _getModelsMap(options)[_getApiVersion(root)]!;

  SwaggerRequestsGenerator _getSwaggerRequestsGenerator(
    SwaggerRoot root,
    GeneratorOptions options,
  ) =>
      SwaggerRequestsGenerator(options);
}
