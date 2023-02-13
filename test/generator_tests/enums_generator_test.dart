import 'package:swagger_dart_code_generator/src/code_generators/enum_model.dart';
import 'package:swagger_dart_code_generator/src/code_generators/v3/swagger_enums_generator_v3.dart';
import 'package:swagger_dart_code_generator/src/models/generator_options.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/requests/swagger_request_parameter.dart';
import 'package:test/test.dart';

void main() {
  final generator = SwaggerEnumsGeneratorV3(
    GeneratorOptions(
      inputFolder: '',
      outputFolder: '',
    ),
  );

  group('Converter generator tests', () {
    test('Should return enum field name', () {
      const name = 'cat-dog_ Cars';
      const output = 'catDogCars';
      final result = EnumModel.getValidatedEnumFieldName(
        name,
        name,
        false,
        [],
      );

      expect(result, contains(output));
    });

    test('Should return \$null if name is null', () {
      const name = 'null';
      const output = '\$null';
      final result = EnumModel.getValidatedEnumFieldName(
        name,
        name,
        false,
        [],
      );

      expect(result, contains(output));
    });
  });

  group('generateEnumName', () {
    final generator = SwaggerEnumsGeneratorV3(
      GeneratorOptions(
        inputFolder: '',
        outputFolder: '',
      ),
    );

    test('Should generate enum name', () {
      const className = 'animal';
      const enumName = 'cat';
      const expectedResult = 'AnimalCat';
      final result = generator.generateEnumName(className, enumName);

      expect(result, contains(expectedResult));
    });
  });

  group('getOriginalOrOverriddenRequestParameter', () {
    test('Should override parameter if needed', () {
      final incoming =
          SwaggerRequestParameter(ref: '#definitions/TestParameter');
      final overriddenParameters = [
        SwaggerRequestParameter(
            name: 'TestParameter', type: 'Overridden parameter')
      ];

      final result = generator.getOriginalOrOverriddenRequestParameter(
          incoming, overriddenParameters);

      expect(result.type, equals('Overridden parameter'));
    });

    test('Should NOT override parameter if needed', () {
      final incoming = SwaggerRequestParameter(
          ref: '#definitions/TestParameterWrong', name: 'Original parameter');
      final overriddenParameters = [
        SwaggerRequestParameter(
            key: 'TestParameter', name: 'Overridden parameter')
      ];

      final result = generator.getOriginalOrOverriddenRequestParameter(
          incoming, overriddenParameters);

      expect(result.name, equals('Original parameter'));
    });
  });
}
