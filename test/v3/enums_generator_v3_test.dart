import 'package:swagger_dart_code_generator/src/code_generators/v3/swagger_enums_generator_v3.dart';
import 'package:test/test.dart';
import '../code_examples.dart';

void main() {
  final _generator = SwaggerEnumsGeneratorV3();
  const _fileName = 'orders_service';
  group('Converter generator tests', () {
    test('Should do something', () {
      final result =
          _generator.generate(request_with_enum_in_parameter, _fileName);

      expect(result, contains('enum OrderStateRequest'));
    });

    test('Should generate enum values', () {
      final _values = <String>['file_sup'];
      const _output = "\t@JsonValue('file_sup')\n\tfileSup";
      final result = _generator.getEnumValuesContent(_values);

      expect(result, contains(_output));
    });

    test('Should return enum field name', () {
      const _name = 'cat-dog_ Cars';
      const _output = 'catDogCars';
      final result = _generator.getValidatedEnumFieldName(_name);

      expect(result, contains(_output));
    });
  });
  group('Tests for getValidatedEnumFieldName', () {
    test('Should remove numbers at beginning if it is key word', () {
      final result = _generator.getValidatedEnumFieldName('007');
      expect(result, equals('value007'));
    });
  });
}
