import 'package:swagger_dart_code_generator/src/code_generators/swagger_converter_generator.dart';
import 'package:test/test.dart';

import '../converter_generator_definitions.dart';

void main() {
  group('Converter generator tests', () {
    final generator = SwaggerConverterGenerator();
    const fileName = 'file_name';

    test('Should create fromJsonFactory for model', () {
      final result = generator.generate(model_with_parameters, fileName);

      expect(
          result,
          contains(
              'ActiveOrderAndListSummary: ActiveOrderAndListSummary.fromJsonFactory'));
    });
  });
}
