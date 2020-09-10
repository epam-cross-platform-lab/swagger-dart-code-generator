import 'package:swagger_generator/src/code_generators/v2/swagger_converter_generator_v2.dart';
import 'package:test/test.dart';
import '../code_examples.dart';

void main() {
  group('Converter generator tests', () {
    final SwaggerConverterGeneratorV2 _generator =
        SwaggerConverterGeneratorV2();
    const String _fileName = 'file_name';

    test('Should create fromJsonFactory for model', () {
      final String result =
          _generator.generate(model_with_parameters_v2, _fileName);

      expect(
          result,
          contains(
              'ActiveOrderAndListSummary: ActiveOrderAndListSummary.fromJsonFactory'));
    });
  });
}
