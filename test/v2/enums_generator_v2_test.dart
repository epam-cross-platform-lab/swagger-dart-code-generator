import 'package:swagger_dart_code_generator/src/code_generators/v2/swagger_enums_generator_v2.dart';
import 'package:test/test.dart';
import '../code_examples.dart';

void main() {
  final SwaggerEnumsGeneratorV2 _generator = SwaggerEnumsGeneratorV2();
  const String _fileName = 'orders_service';
  group('Converter generator tests', () {
    test('Should do something', () {
      final String result =
          _generator.generate(request_with_enum_in_parameter, _fileName);

      expect(result, contains('enum OrderStateRequest'));
    });

    test('Should generate enum values', () {
      final List<String> _values = <String>['file_sup'];
      const String _output = "\t@JsonValue('file_sup')\n\tfileSup";
      final String result = _generator.getEnumValuesContent(_values);

      expect(result, contains(_output));
    });

    test('Should return enum field name', () {
      const String _name = 'cat-dog_ Cars';
      const String _output = 'catDogCars';
      final String result = _generator.getValidatedEnumFieldName(_name);

      expect(result, contains(_output));
    });
  });
  group('Tests for getValidatedEnumFieldName', () {
    test('Should remove numbers at beginning if it is key word', () {
      final String result = _generator.getValidatedEnumFieldName('007');
      expect(result, equals('value007'));
    });
  });
}
