import 'package:swagger_generator/src/code_generators/v2/swagger_enums_generator_v2.dart';
import 'package:test/test.dart';
import '../code_examples.dart';

void main() {
  final _generator = SwaggerEnumsGeneratorV2();
  final _fileName = 'orders_service';
  group('Converter generator tests', () {
    test('Should do something', () {
      final result =
          _generator.generate(request_with_enum_in_parameter, _fileName);

      expect(result, contains("enum OrderStateRequest"));
    });

    test('Should generate enum values', () {
      List<String> _values = ["file_sup"];
      String _output = "\t@JsonValue('file_sup')\n\tfileSup";
      final result = _generator.getEnumValuesContent(_values);

      expect(result, contains(_output));
    });

    test('Should return enum field name', () {
      String _name = "cat-dog_ Cars";
      String _output = "catDogCars";
      final result = _generator.getValidatedEnumFieldName(_name);

      expect(result, contains(_output));
    });
  });
  group('Tests for getValidatedEnumFieldName', () {
    test('Should remove numbers at beginning if it is key word', () {
      final result = _generator.getValidatedEnumFieldName("007");
      expect(result, equals('value007'));
    });
  });
}
