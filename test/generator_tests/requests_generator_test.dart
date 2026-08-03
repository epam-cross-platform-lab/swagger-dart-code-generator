import 'package:swagger_dart_code_generator/src/code_generators/swagger_requests_generator.dart';
import 'package:swagger_dart_code_generator/src/code_generators/v3/swagger_enums_generator_v3.dart';
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

  group('Enum response types', () {
    final root = SwaggerRoot.parse(enumResponseService);
    final options = GeneratorOptions(inputFolder: '', outputFolder: '');
    final allEnums =
        SwaggerEnumsGeneratorV3(options).generateAllEnums(root: root, fileName: 'api');

    final result = SwaggerRequestsGenerator(options).generate(
      swaggerRoot: root,
      className: 'Api',
      fileName: 'api',
      allEnums: allEnums,
    );

    test('Should reference an enum response with the enums. prefix', () {
      expect(result, contains('List<enums.AccountType>'));
      expect(result, isNot(contains('Response<List<AccountType>>')));
    });

    test('Should not register an enum as a model in generatedMapping', () {
      expect(result, isNot(contains('AccountType.fromJsonFactory')));
    });
  });
}

const enumResponseService = '''
{
    "openapi": "3.0.0",
    "info": {"title": "Api", "version": "1.0.0"},
    "paths": {
        "/types": {
            "get": {
                "operationId": "getTypes",
                "responses": {
                    "200": {
                        "description": "ok",
                        "content": {
                            "application/json": {
                                "schema": {
                                    "type": "array",
                                    "items": {"\$ref": "#/components/schemas/AccountType"}
                                }
                            }
                        }
                    }
                }
            }
        }
    },
    "components": {
        "schemas": {
            "AccountType": {"type": "string", "enum": ["student", "staff"]}
        }
    }
}
''';
