import 'package:swagger_dart_code_generator/src/code_generators/v2/swagger_enums_generator_v2.dart';
import 'package:test/test.dart';
import '../code_examples.dart';
import 'requests_generator_definitions.dart';

void main() {
  final generator = SwaggerEnumsGeneratorV2();

  group('Generate', () {
    test('Should generate enum from models', () {
      final result = generator.generate(model_with_parameters_v2, 'test_file');
      expect(result, contains('enum ActiveOrderAndListSummaryShoppingType'));
    });

    test('Should generate enum from request parameter', () {
      final result =
          generator.generate(request_with_enum_in_parameter, 'test_file');
      expect(result, contains('enum V3OrderOrderIdStatePutOrderStateRequest'));
    });
  });

  group('Converter generator tests', () {
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

  group('generateEnumName', () {
    final generator = SwaggerEnumsGeneratorV2();

    test('Should generate enum name', () {
      const _className = 'animal';
      const _enumName = 'cat';
      const _expectedResult = 'AnimalCat';
      final result = generator.generateEnumName(_className, _enumName);

      expect(result, contains(_expectedResult));
    });
  });

  group('generateEnumValuesContent', () {
    final generator = SwaggerEnumsGeneratorV2();
    test('Should return enum values', () {
      final list = <String>['Cats', 'dogs', 'Forgs'];
      const expectedResult = "\t@JsonValue('Cats')\n  cats";
      final result = generator.generateEnumValuesContent(list);

      expect(result, contains(expectedResult));
    });
  });
}
