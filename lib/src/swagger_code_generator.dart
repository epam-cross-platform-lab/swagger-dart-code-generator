import 'dart:convert';

import 'package:swagger_dart_code_generator/src/code_generators/swagger_additions_generator.dart';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_converter_generator.dart';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_enums_generator.dart';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_models_generator.dart';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_requests_generator.dart';
import 'package:swagger_dart_code_generator/src/code_generators/v2/swagger_additions_generator_v2.dart';
import 'package:swagger_dart_code_generator/src/code_generators/v2/swagger_converter_generator_v2.dart';
import 'package:swagger_dart_code_generator/src/code_generators/v2/swagger_enums_generator_v2.dart';
import 'package:swagger_dart_code_generator/src/code_generators/v2/swagger_models_generator_v2.dart';
import 'package:swagger_dart_code_generator/src/code_generators/v2/swagger_requests_generator_v2.dart';
import 'package:swagger_dart_code_generator/src/code_generators/v3/swagger_additions_generator_v3.dart';
import 'package:swagger_dart_code_generator/src/code_generators/v3/swagger_converter_generator_v3.dart';
import 'package:swagger_dart_code_generator/src/code_generators/v3/swagger_enums_generator_v3.dart';
import 'package:swagger_dart_code_generator/src/code_generators/v3/swagger_models_generator_v3.dart';
import 'package:swagger_dart_code_generator/src/code_generators/v3/swagger_requests_generator_v3.dart';
import 'package:swagger_dart_code_generator/src/models/generator_options.dart';

class SwaggerCodeGenerator {
  final Map<int, SwaggerAdditionsGenerator> _additionsMap =
      <int, SwaggerAdditionsGenerator>{
    2: SwaggerAdditionsGeneratorV2(),
    3: SwaggerAdditionsGeneratorV3()
  };

  final Map<int, SwaggerConverterGenerator> _converterMap =
      <int, SwaggerConverterGenerator>{
    2: SwaggerConverterGeneratorV2(),
    3: SwaggerConverterGeneratorV3()
  };

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

  final Map<int, SwaggerRequestsGenerator> _requestsMap =
      <int, SwaggerRequestsGenerator>{
    2: SwaggerRequestsGeneratorV2(),
    3: SwaggerRequestsGeneratorV3()
  };

  int _getApiVersion(String dartCode) {
    final dynamic map = jsonDecode(dartCode);

    final String openApi = map['openapi'] as String;
    return openApi != null ? 3 : 2;
  }

  String generateIndexes(
          String dartCode, Map<String, List<String>> buildExtensions) =>
      _getSwaggerAdditionsGenerator(dartCode).generateIndexes(buildExtensions);

  String generateConverterMappings(
          String dartCode, Map<String, List<String>> buildExtensions) =>
      _getSwaggerAdditionsGenerator(dartCode)
          .generateConverterMappings(buildExtensions);

  String generateImportsContent(
          String dartCode, String swaggerFileName, bool hasModels) =>
      _getSwaggerAdditionsGenerator(dartCode)
          .generateImportsContent(swaggerFileName, hasModels);

  String generateConverter(String dartCode, String fileName) =>
      _getSwaggerConverterGenerator(dartCode).generate(dartCode, fileName);

  String generateEnums(String dartCode, String fileName) =>
      _getSwaggerEnumsGenerator(dartCode).generate(dartCode, fileName);

  String generateModels(
          String dartCode, String fileName, GeneratorOptions options) =>
      _getSwaggerModelsGenerator(dartCode)
          .generate(dartCode, fileName, options);

  String generateRequests(String dartCode, String className, String fileName,
          GeneratorOptions options) =>
      _getSwaggerRequestsGenerator(dartCode)
          .generate(dartCode, className, fileName, options);

  String generateCustomJsonConverter(String dartCode, String fileName) =>
      _getSwaggerAdditionsGenerator(dartCode)
          .generateCustomJsonConverter(fileName);

  SwaggerAdditionsGenerator _getSwaggerAdditionsGenerator(String dartCode) =>
      _additionsMap[_getApiVersion(dartCode)];

  SwaggerConverterGenerator _getSwaggerConverterGenerator(String dartCode) =>
      _converterMap[_getApiVersion(dartCode)];

  SwaggerEnumsGenerator _getSwaggerEnumsGenerator(String dartCode) =>
      _enumsMap[_getApiVersion(dartCode)];

  SwaggerModelsGenerator _getSwaggerModelsGenerator(String dartCode) =>
      _modelsMap[_getApiVersion(dartCode)];

  SwaggerRequestsGenerator _getSwaggerRequestsGenerator(String dartCode) =>
      _requestsMap[_getApiVersion(dartCode)];
}
