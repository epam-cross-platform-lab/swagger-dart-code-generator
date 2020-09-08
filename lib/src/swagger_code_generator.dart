import 'dart:convert';

import 'package:swagger_generator/src/code_generators/swagger_additions_generator.dart';
import 'package:swagger_generator/src/code_generators/swagger_converter_generator.dart';
import 'package:swagger_generator/src/code_generators/swagger_enums_generator.dart';
import 'package:swagger_generator/src/code_generators/swagger_models_generator.dart';
import 'package:swagger_generator/src/code_generators/swagger_requests_generator.dart';
import 'package:swagger_generator/src/code_generators/v2/swagger_additions_generator_v2.dart';
import 'package:swagger_generator/src/code_generators/v2/swagger_converter_generator_v2.dart';
import 'package:swagger_generator/src/code_generators/v2/swagger_enums_generator_v2.dart';
import 'package:swagger_generator/src/code_generators/v2/swagger_models_generator_v2.dart';
import 'package:swagger_generator/src/code_generators/v2/swagger_requests_generator_v2.dart';
import 'package:swagger_generator/src/code_generators/v3/swagger_additions_generator_v3.dart';
import 'package:swagger_generator/src/code_generators/v3/swagger_converter_generator_v3.dart';
import 'package:swagger_generator/src/code_generators/v3/swagger_enums_generator_v3.dart';
import 'package:swagger_generator/src/code_generators/v3/swagger_models_generator_v3.dart';
import 'package:swagger_generator/src/code_generators/v3/swagger_requests_generator_v3.dart';
import 'package:swagger_generator/src/models/generator_options.dart';

class SwaggerCodeGenerator {
  Map<int, SwaggerAdditionsGenerator> _additionsMap = {
    2: SwaggerAdditionsGeneratorV2(),
    3: SwaggerAdditionsGeneratorV3()
  };

  Map<int, SwaggerConverterGenerator> _converterMap = {
    2: SwaggerConverterGeneratorV2(),
    3: SwaggerConverterGeneratorV3()
  };

  Map<int, SwaggerEnumsGenerator> _enumsMap = {
    2: SwaggerEnumsGeneratorV2(),
    3: SwaggerEnumsGeneratorV3()
  };

  Map<int, SwaggerModelsGenerator> _modelsMap = {
    2: SwaggerModelsGeneratorV2(),
    3: SwaggerModelsGeneratorV3()
  };

  Map<int, SwaggerRequestsGenerator> _requestsMap = {
    2: SwaggerRequestsGeneratorV2(),
    3: SwaggerRequestsGeneratorV3()
  };

  int _getApiVersion(String dartCode) {
    final dynamic map = jsonDecode(dartCode);

    final String openApi = map["openapi"];
    return openApi != null ? 3 : 2;
  }

  String generateIndexes(
          String dartCode, Map<String, List<String>> buildExtensions) =>
      getSwaggerAdditionsGenerator(dartCode).generateIndexes(buildExtensions);

  String generateConverterMappings(
          String dartCode, Map<String, List<String>> buildExtensions) =>
      getSwaggerAdditionsGenerator(dartCode)
          .generateConverterMappings(buildExtensions);

  String generateImportsContent(
          String dartCode, String swaggerFileName, bool hasModels) =>
      getSwaggerAdditionsGenerator(dartCode)
          .generateImportsContent(swaggerFileName, hasModels);

  String generateConverter(String dartCode, String fileName) =>
      getSwaggerConverterGenerator(dartCode).generate(dartCode, fileName);

  String generateEnums(String dartCode, String fileName) =>
      getSwaggerEnumsGenerator(dartCode).generate(dartCode, fileName);

  String generateModels(
          String dartCode, String fileName, GeneratorOptions options) =>
      getSwaggerModelsGenerator(dartCode).generate(dartCode, fileName, options);

  String generateRequests(String dartCode, String className, String fileName,
          GeneratorOptions options) =>
      getSwaggerRequestsGenerator(dartCode)
          .generate(dartCode, className, fileName, options);

  SwaggerAdditionsGenerator getSwaggerAdditionsGenerator(String dartCode) =>
      _additionsMap[_getApiVersion(dartCode)];

  SwaggerConverterGenerator getSwaggerConverterGenerator(String dartCode) =>
      _converterMap[_getApiVersion(dartCode)];

  SwaggerEnumsGenerator getSwaggerEnumsGenerator(String dartCode) =>
      _enumsMap[_getApiVersion(dartCode)];

  SwaggerModelsGenerator getSwaggerModelsGenerator(String dartCode) =>
      _modelsMap[_getApiVersion(dartCode)];

  SwaggerRequestsGenerator getSwaggerRequestsGenerator(String dartCode) =>
      _requestsMap[_getApiVersion(dartCode)];
}
