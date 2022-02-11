import 'package:swagger_dart_code_generator/src/code_generators/swagger_additions_generator.dart';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_enums_generator.dart';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_models_generator.dart';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_requests_generator.dart';
import 'package:swagger_dart_code_generator/src/code_generators/v2/swagger_enums_generator_v2.dart';
import 'package:swagger_dart_code_generator/src/code_generators/v2/swagger_models_generator_v2.dart';
import 'package:swagger_dart_code_generator/src/code_generators/v3/swagger_enums_generator_v3.dart';
import 'package:swagger_dart_code_generator/src/code_generators/v3/swagger_models_generator_v3.dart';
import 'package:swagger_dart_code_generator/src/models/generator_options.dart';

class SwaggerCodeGenerator {
  final Map<int, SwaggerEnumsGenerator> _enumsMap =
      <int, SwaggerEnumsGenerator>{
    2: SwaggerEnumsGeneratorV2(),
    3: SwaggerEnumsGeneratorV3()
  };

  final Map<int, SwaggerModelsGenerator> _modelsMap =
      <int, SwaggerModelsGenerator>{
    2: SwaggerModelsGeneratorV2(),
    3: SwaggerModelsGeneratorV3()
  };

  int _getApiVersion(Map map) {
    final openApi = map['openapi'] as String?;
    return openApi != null ? 3 : 2;
  }

  String generateIndexes(List<String> fileNames) =>
      _getSwaggerAdditionsGenerator().generateIndexes(fileNames);

  String generateConverterMappings(bool hasModels) =>
      _getSwaggerAdditionsGenerator().generateConverterMappings(hasModels);

  String generateImportsContent(
    String swaggerFileName,
    bool hasModels,
    bool buildOnlyModels,
    bool hasEnums,
    bool separateModels,
  ) =>
      _getSwaggerAdditionsGenerator().generateImportsContent(swaggerFileName,
          hasModels, buildOnlyModels, hasEnums, separateModels);

  String generateResponses(
    Map<String, dynamic> map,
    String fileName,
    GeneratorOptions options,
  ) =>
      _getSwaggerModelsGenerator(map).generateResponses(map, fileName, options);

  String generateRequestBodies(
    Map<String, dynamic> map,
    String fileName,
    GeneratorOptions options,
  ) =>
      _getSwaggerModelsGenerator(map)
          .generateRequestBodies(map, fileName, options);

  String generateEnums(Map<String, dynamic> map, String fileName) =>
      _getSwaggerEnumsGenerator(map).generate(map, fileName);

  String generateModels(Map<String, dynamic> dartCode, String fileName,
          GeneratorOptions options) =>
      _getSwaggerModelsGenerator(dartCode)
          .generate(dartCode, fileName, options);

  String generateRequests(Map<String, dynamic> map, String className,
          String fileName, GeneratorOptions options) =>
      _getSwaggerRequestsGenerator(map).generate(
        map: map,
        className: className,
        fileName: fileName,
        options: options,
      );

  String generateCustomJsonConverter(
          String fileName, GeneratorOptions options) =>
      _getSwaggerAdditionsGenerator()
          .generateCustomJsonConverter(fileName, options);

  String generateDateToJson() =>
      _getSwaggerAdditionsGenerator().generateDateToJson();

  SwaggerAdditionsGenerator _getSwaggerAdditionsGenerator() =>
      SwaggerAdditionsGenerator();

  SwaggerEnumsGenerator _getSwaggerEnumsGenerator(Map root) =>
      _enumsMap[_getApiVersion(root)]!;

  SwaggerModelsGenerator _getSwaggerModelsGenerator(Map root) =>
      _modelsMap[_getApiVersion(root)]!;

  SwaggerRequestsGenerator _getSwaggerRequestsGenerator(Map root) =>
      SwaggerRequestsGenerator();
}
