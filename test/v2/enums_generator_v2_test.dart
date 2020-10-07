import 'package:swagger_dart_code_generator/src/code_generators/v2/swagger_enums_generator_v2.dart';
import 'package:test/test.dart';
import '../code_examples.dart';
import 'requests_generator_definitions.dart';

void main() {
  final generator = SwaggerEnumsGeneratorV2();
  const fileName = 'orders_service';
  group('Converter generator tests', () {
    test('Should do something', () {
      final result =
          generator.generate(request_with_enum_in_parameter, fileName);

      expect(result, contains('enum V3OrderOrderIdStatePutOrderStateRequest'));
    });

    test('Should generate list<enum>', () {
      final result =
          generator.generate(request_with_list_of_enum_in_parameter, fileName);

      expect(result, contains('enum V3OrderOrderIdStatePutOrderStateRequest'));
    });

    test('Should generate enum values', () {
      final _values = <String>['file_sup'];
      const _output = "\t@JsonValue('file_sup')\n\tfileSup";
      final result = generator.getEnumValuesContent(_values);

      expect(result, contains(_output));
    });

    test('Should return enum field name', () {
      const _name = 'cat-dog_ Cars';
      const _output = 'catDogCars';
      final result = generator.getValidatedEnumFieldName(_name);

      expect(result, contains(_output));
    });

    test('Should return \$null if name is null', () {
      const name = 'null';
      const output = '\$null';
      final result = generator.getValidatedEnumFieldName(name);

      expect(result, contains(output));
    });
  });
  group('Tests for getValidatedEnumFieldName', () {
    test('Should remove numbers at beginning if it is key word', () {
      final result = generator.getValidatedEnumFieldName('007');
      expect(result, equals('value_007'));
    });

    test('Should remove numbers at beginning if it is key word', () {
      final result = generator.getEnumNames(request_with_enum);
      expect(result[0], equals('PetsPetIdItemsGetContentType'));
    });

    test('Should remove numbers at beginning if it is key word', () {
      final result =
          generator.getEnumNames(request_with_list_of_enum_in_parameter);
      expect(result[0], equals('V3OrderOrderIdStatePutOrderStateRequest'));
    });
  });
}
