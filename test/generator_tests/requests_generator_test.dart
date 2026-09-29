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

    test('Should expand a referenced multipart schema with file fields', () {
      final result = SwaggerRequestsGenerator(GeneratorOptions(
        inputFolder: '',
        outputFolder: '',
        ignoreHeaders: true,
      )).generate(
        swaggerRoot: root,
        className: 'CarsService',
        fileName: 'cars_service',
        allEnums: [],
      );

      expect(
        result,
        contains('_carsMultipartRefPost({@Part(\'filename\') required String? '
            'filename, @PartFile() required List<List<int>> photos,'),
      );
      expect(
        result,
        contains('_carsMultipartRefFieldsPost({@Part() required '
            'CarFieldsRequest body,'),
      );
    });
  });
}
