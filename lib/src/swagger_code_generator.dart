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

  int _getApiVersion(Map map) {
    final openApi = map['openapi'] as String?;
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
    Map<String, dynamic> map,
    String fileName,
    GeneratorOptions options,
  ) =>
      _getSwaggerModelsGenerator(map, options).generateResponses(map, fileName);

  String generateRequestBodies(
    Map<String, dynamic> map,
    String fileName,
    GeneratorOptions options,
  ) =>
      _getSwaggerModelsGenerator(map, options)
          .generateRequestBodies(map, fileName);

  String generateEnums(
    Map<String, dynamic> map,
    String fileName,
    GeneratorOptions options,
  ) =>
      _getSwaggerEnumsGenerator(map, options).generate(map, fileName);

  String generateModels(Map<String, dynamic> dartCode, String fileName,
          GeneratorOptions options) =>
      _getSwaggerModelsGenerator(dartCode, options)
          .generate(dartCode, fileName);

  String generateRequests(Map<String, dynamic> map, String className,
          String fileName, GeneratorOptions options) =>
      _getSwaggerRequestsGenerator(map, options).generate(
        map: map,
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
    Map root,
    GeneratorOptions options,
  ) =>
      _getEnumsMap(options)[_getApiVersion(root)]!;

  SwaggerModelsGenerator _getSwaggerModelsGenerator(
    Map root,
    GeneratorOptions options,
  ) =>
      _getModelsMap(options)[_getApiVersion(root)]!;

  SwaggerRequestsGenerator _getSwaggerRequestsGenerator(
    Map root,
    GeneratorOptions options,
  ) =>
      SwaggerRequestsGenerator(options);
}
