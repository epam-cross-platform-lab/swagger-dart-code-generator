import 'package:swagger_dart_code_generator/src/code_generators/v3/swagger_enums_generator_v3.dart';
import 'package:test/test.dart';
import '../code_examples.dart';

void main() {
  final generator = SwaggerEnumsGeneratorV3();
  const fileName = 'orders_service';
  group('Converter generator tests', () {
    test('Should do something', () {
      final result =
          generator.generate(request_with_enum_in_parameter, fileName);

      expect(result, contains('enum OrderStateRequest'));
    });

    test('Should generate enum values', () {
      final values = <String>['file_sup'];
      const output = "\t@JsonValue('file_sup')\n\tfileSup";
      final result = generator.getEnumValuesContent(values);

      expect(result, contains(output));
    });

    test('Should return enum field name', () {
      const name = 'cat-dog_ Cars';
      const output = 'catDogCars';
      final result = generator.getValidatedEnumFieldName(name);

      expect(result, contains(output));
    });
  });
  group('Tests for getValidatedEnumFieldName', () {
    test('Should remove numbers at beginning if it is key word', () {
      final result = generator.getValidatedEnumFieldName('007');
      expect(result, equals('value007'));
    });
  });
}
