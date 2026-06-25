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

  group('Multipart file upload', () {
    final root = SwaggerRoot.parse(multipartRefService);

    final result = SwaggerRequestsGenerator(GeneratorOptions(
      inputFolder: '',
      outputFolder: '',
      ignoreHeaders: true,
    )).generate(
      swaggerRoot: root,
      className: 'UploadService',
      fileName: 'upload_service',
      allEnums: [],
    );

    test('Should deparse a \$ref body into individual file parts', () {
      expect(result, contains('@Multipart()'));
      expect(result, contains("@PartFile('image') required List<int> image"));
      expect(result, isNot(contains('required BodyUpload')));
    });

    test('Should treat OpenAPI 3.1 contentMediaType as binary', () {
      expect(result, contains("@PartFile('doc') required List<int> doc"));
    });

    test('Should keep non-binary properties as plain @Part fields', () {
      expect(result, contains("@Part('caption')"));
      expect(result, isNot(contains("@PartFile('caption')")));
    });
  });
}

const multipartRefService = '''
{
    "openapi": "3.1.0",
    "info": {"title": "Upload", "version": "1.0.0"},
    "paths": {
        "/upload": {
            "post": {
                "operationId": "upload",
                "requestBody": {
                    "required": true,
                    "content": {
                        "multipart/form-data": {
                            "schema": {"\$ref": "#/components/schemas/Body_upload"}
                        }
                    }
                },
                "responses": {"200": {"description": "ok"}}
            }
        }
    },
    "components": {
        "schemas": {
            "Body_upload": {
                "type": "object",
                "required": ["image", "doc"],
                "properties": {
                    "image": {"type": "string", "format": "binary"},
                    "doc": {"type": "string", "contentMediaType": "application/octet-stream"},
                    "caption": {"type": "string"}
                }
            }
        }
    }
}
''';
