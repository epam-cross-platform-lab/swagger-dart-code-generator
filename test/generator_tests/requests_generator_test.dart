import 'dart:convert';

import 'package:swagger_dart_code_generator/src/code_generators/swagger_requests_generator.dart';
import 'package:swagger_dart_code_generator/src/models/generator_options.dart';
import 'package:test/test.dart';

import 'test_data.dart';

void main() {
  group('Additions generator tests', () {
    final generator = SwaggerRequestsGenerator();

    final map = jsonDecode(carsService) as Map<String, dynamic>;

    test('Should generate CarsApi', () {
      final result = generator.generate(
        map: map,
        className: 'CarsService',
        fileName: 'cars_service',
        options: GeneratorOptions(
          inputFolder: '',
          outputFolder: '',
          ignoreHeaders: true,
          responseOverrideValueMap: [
            ResponseOverrideValueMap(
              method: 'get',
              url: '/cars/schemaRefBody',
              overriddenValue: 'String',
            )
          ],
        ),
      );

      final result2 = generator.generate(
        map: map,
        className: 'CarsService',
        fileName: 'cars_service',
        options: GeneratorOptions(
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
            ]),
      );

      expect(result2, contains('Future<chopper.Response<CarModel>>'));
      expect(result, contains('Future<chopper.Response<CarModel>> carsGet'));
      expect(result, contains('Future<chopper.Response<CarModel>> carsPost'));
    });
  });
}
