import 'package:swagger_dart_code_generator/src/code_generators/swagger_enums_generator.dart';
import 'package:swagger_dart_code_generator/src/code_generators/v2/swagger_enums_generator_v2.dart';
import 'package:swagger_dart_code_generator/src/code_generators/v3/swagger_enums_generator_v3.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/requests/swagger_request_parameter.dart';
import 'package:test/test.dart';
import '../code_examples.dart';
import '../requests_generator_definitions.dart';

void main() {
  final generator = SwaggerEnumsGeneratorV3();
  final generatorv2 = SwaggerEnumsGeneratorV2();

  group('Generate', () {
    test('Should generate enum from models', () {
      final result = generator.generate(model_with_parameters_v3, 'test_file');
      expect(result, contains('enum SomeEnumModel'));
    });

    test('Should generate enum from models', () {
      final result =
          generatorv2.generate(model_with_parameters_v2, 'test_file');
      expect(result, contains('enum ActiveOrderAndListSummaryEnumValue'));
    });

    test('Should generate enum from request parameter', () {
      final result =
          generator.generate(request_with_enum_in_parameter, 'test_file');
      expect(result, contains('enum V3OrderOrderIdStatePutOrderStateRequest'));
    });

    test('Should generate enums from responses', () {
      final result =
          generator.generate(schemas_with_enums_in_properties, 'test_file');
      expect(result, contains('enum SpaResponse'));
    });
  });
  group('Converter generator tests', () {
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
      expect(result, equals('value_007'));
    });

    test('Should remove numbers at beginning if it is key word', () {
      final result =
          SwaggerEnumsGenerator.getEnumNamesFromRequests(request_with_enum);
      expect(result[0], equals('PetsPetIdItemsGetContentType'));
    });

    test('Should remove numbers at beginning if it is key word', () {
      final result = SwaggerEnumsGenerator.getEnumNamesFromRequests(
          request_with_list_of_enum_in_parameter);
      expect(result[0], equals('V3OrderOrderIdStatePutOrderStateRequest'));
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

  group('getOriginalOrOverridenRequestParameter', () {
    test('Should override parameter if needed', () {
      final incoming =
          SwaggerRequestParameter(ref: "#definitions/TestParameter");
      final overridenParameters = [
        SwaggerRequestParameter(
            key: 'TestParameter', name: 'Overriden parameter')
      ];

      final result =
          SwaggerEnumsGenerator.getOriginalOrOverridenRequestParameter(
              incoming, overridenParameters);

      expect(result.name, equals('Overriden parameter'));
    });

    test('Should NOT override parameter if needed', () {
      final incoming = SwaggerRequestParameter(
          ref: "#definitions/TestParameterWrong", name: 'Original parameter');
      final overridenParameters = [
        SwaggerRequestParameter(
            key: 'TestParameter', name: 'Overriden parameter')
      ];

      final result =
          SwaggerEnumsGenerator.getOriginalOrOverridenRequestParameter(
              incoming, overridenParameters);

      expect(result.name, equals('Original parameter'));
    });
  });
}
