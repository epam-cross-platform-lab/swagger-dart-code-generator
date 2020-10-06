import 'package:swagger_dart_code_generator/src/code_generators/v3/swagger_enums_generator_v3.dart';
import 'package:test/test.dart';
import '../code_examples.dart';
import 'requests_generator_v3_definitions.dart';

void main() {
  final generator = SwaggerEnumsGeneratorV3();
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
      expect(result, equals('value007'));
    });

    test('Should remove numbers at beginning if it is key word', () {
      final result = generator.getEnumNames(request_with_enum);
      expect(result[0], equals('contentType'));
    });

    test('Should remove numbers at beginning if it is key word', () {
      final result =
          generator.getEnumNames(request_with_list_of_enum_in_parameter);
      expect(result[0], equals('orderStateRequest'));
    });
  });

  group('generateEnumContentIfPossible', () {
    final generator = SwaggerEnumsGeneratorV3();
    test('Should generate enum', () {
      final map = <String, dynamic>{
        'items': {
          'enum': ['Item1', 'Item2']
        }
      };
      const enumName = 'TestName';
      final result = generator.generateEnumContentIfPossible(map, enumName);

      expect(result, contains('enum TestName'));
    });
  });

  group('generateEnumName', () {
    final generator = SwaggerEnumsGeneratorV3();

    test('Should generate enum name', () {
      const className = 'animal';
      const enumName = 'cat';
      const expectedResult = 'AnimalCat';
      final result = generator.generateEnumName(className, enumName);

      expect(result, contains(expectedResult));
    });
  });

  group('generateEnumValuesContent', () {
    final generator = SwaggerEnumsGeneratorV3();
    test('Should return enum values', () {
      final list = <String>['Cats', 'dogs', 'Forgs'];
      const expectedResult = "\t@JsonValue('Cats')\n  cats";
      final result = generator.generateEnumValuesContent(list);

      expect(result, contains(expectedResult));
    });
  });
}
