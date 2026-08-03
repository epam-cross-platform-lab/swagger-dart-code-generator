import 'package:swagger_dart_code_generator/src/code_generators/swagger_requests_generator.dart';
import 'package:swagger_dart_code_generator/src/models/generator_options.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/swagger_root.dart';
import 'package:test/test.dart';

import 'test_data.dart';

void main() {
  group('Requests generator tests', () {
    final root = SwaggerRoot.parse(carsService);

    test('Should generate CarsApi', () {
      final result = SwaggerRequestsGenerator(GeneratorOptions(
        inputFolder: '',
        outputFolder: '',
        ignoreHeaders: true,
        responseOverrideValueMap: [
          ResponseOverrideValueMap(
            method: 'get',
            url: '/cars/schemaRefBody',
            overriddenValue: 'String',
          ),
          ResponseOverrideValueMap(
            method: '',
            url: '/cars/returnTypeTests',
            overriddenValue: 'int',
          ),
        ],
      )).generate(
        swaggerRoot: root,
        className: 'CarsService',
        fileName: 'cars_service',
        allEnums: [],
      );

      final result2 = SwaggerRequestsGenerator(GeneratorOptions(
          inputFolder: '',
          outputFolder: '',
          defaultHeaderValuesMap: [
            DefaultHeaderValueMap(
              defaultValue: '120',
              headerName: 'id',
            ),
          ],
          includePaths: [
            'car'
          ])).generate(
        swaggerRoot: root,
        allEnums: [],
        className: 'CarsService',
        fileName: 'cars_service',
      );

      expect(result2, contains('Future<chopper.Response<CarModel>>'));
      expect(result,
          contains('Future<chopper.Response<String>> carsSchemaRefBodyGet'));
      expect(result,
          contains('Future<chopper.Response<CarModel>> carsSchemaRefBodyPost'));
      expect(result,
          contains('Future<chopper.Response<int>> carsReturnTypeTestsGet'));
      expect(result,
          contains('Future<chopper.Response<int>> carsReturnTypeTestsPost'));
      expect(result,
          contains('Future<chopper.Response<int>> carsReturnTypeTestsPut'));
      expect(result, contains('Future<chopper.Response<CarModel>> carsGet'));
      expect(result, contains('Future<chopper.Response<CarModel>> carsPost'));
      expect(result,
          contains('Future<chopper.Response<CarModel>> carsMultipartPost'));
    });
  });

  group('Binary responses', () {
    final root = SwaggerRoot.parse(binaryResponseService);
    final result = SwaggerRequestsGenerator(
      GeneratorOptions(inputFolder: '', outputFolder: ''),
    ).generate(
      swaggerRoot: root,
      className: 'Api',
      fileName: 'api',
      allEnums: [],
    );

    test('Should type an OpenAPI 3.0 format:binary response as List<int>', () {
      expect(
        result,
        contains('Future<chopper.Response<List<int>>> pdf30Get'),
      );
    });

    test('Should type an OpenAPI 3.1 contentMediaType response as List<int>',
        () {
      expect(
        result,
        contains('Future<chopper.Response<List<int>>> pdf31Get'),
      );
    });
  });
}

const binaryResponseService = '''
{
    "openapi": "3.1.0",
    "info": {"title": "Api", "version": "1.0.0"},
    "paths": {
        "/pdf30": {
            "get": {
                "operationId": "getPdf30",
                "responses": {
                    "200": {
                        "description": "ok",
                        "content": {
                            "application/pdf": {
                                "schema": {"type": "string", "format": "binary"}
                            }
                        }
                    }
                }
            }
        },
        "/pdf31": {
            "get": {
                "operationId": "getPdf31",
                "responses": {
                    "200": {
                        "description": "ok",
                        "content": {
                            "application/octet-stream": {
                                "schema": {
                                    "type": "string",
                                    "contentMediaType": "application/octet-stream"
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
''';
