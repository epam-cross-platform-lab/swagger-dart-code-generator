import 'package:swagger_dart_code_generator/src/code_generators/v2/swagger_converter_generator_v2.dart';
import 'package:test/test.dart';
import '../code_examples.dart';

void main() {
  group('Converter generator tests', () {
    final generator = SwaggerConverterGeneratorV2();
    const fileName = 'file_name';

    test('Should create fromJsonFactory for model', () {
      final result = generator.generate(model_with_parameters_v2, fileName);

      expect(
          result,
          contains(
              'ActiveOrderAndListSummary: ActiveOrderAndListSummary.fromJsonFactory'));
    });
  });
}
