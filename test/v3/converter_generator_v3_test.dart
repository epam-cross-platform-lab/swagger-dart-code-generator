import 'package:swagger_dart_code_generator/src/code_generators/v3/swagger_converter_generator_v3.dart';
import 'package:test/test.dart';
import 'converter_generator_v3_definitions.dart';

void main() {
  group('Converter generator tests', () {
    final SwaggerConverterGeneratorV3 _generator =
        SwaggerConverterGeneratorV3();
    const String _fileName = 'file_name';

    test('Should create fromJsonFactory for model', () {
      final String result =
          _generator.generate(model_with_parameters, _fileName);

      expect(
          result,
          contains(
              'ActiveOrderAndListSummary: ActiveOrderAndListSummary.fromJsonFactory'));
    });
  });
}
