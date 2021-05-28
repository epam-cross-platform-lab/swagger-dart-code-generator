import 'package:swagger_dart_code_generator/src/code_generators/swagger_converter_generator.dart';
import 'package:swagger_dart_code_generator/src/models/generator_options.dart';
import 'package:test/test.dart';

import '../converter_generator_definitions.dart';

void main() {
  group('Converter generator tests', () {
    final generator = SwaggerConverterGenerator();
    const fileName = 'file_name';

    test('Should create fromJsonFactory for model', () {
      final result = generator.generate(
        model_with_parameters,
        fileName,
        GeneratorOptions(inputFolder: '', outputFolder: ''),
      );

      expect(
          result,
          contains(
              'ActiveOrderAndListSummary: ActiveOrderAndListSummary.fromJsonFactory'));
    });

    test(
        'Should not create fromJsonFactory for model with array enums parameters',
        () {
      final result = generator.generate(model_with_enunm_array_parameters_v2,
          fileName, GeneratorOptions(inputFolder: '', outputFolder: ''));

      final isContains = result.contains(
          'ActiveOrderAndListSummary: ActiveOrderAndListSummary.fromJsonFactory');

      expect(isContains, equals(false));
    });

    test('Should create fromJsonFactory for model', () {
      final result = generator.generate(model_with_parameters_v2, fileName,
          GeneratorOptions(inputFolder: '', outputFolder: ''));

      expect(
          result,
          contains(
              'ActiveOrderAndListSummary: ActiveOrderAndListSummary.fromJsonFactory'));
    });
  });
}
