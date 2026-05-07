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

    test('Should return \$value if name is value', () {
      const name = 'value';
      const output = '\$value';
      final result = EnumModel.getValidatedEnumFieldName(
        name,
        name,
        false,
        [],
      );
      expect(result, contains(output));
    });

    test('Should generate toString method when overrideEnumToString is true', () {
      final enumModel = EnumModel(
        name: 'TestEnum',
        values: ['value1', 'value2'],
        isInteger: false,
        enumNames: [],
        options: GeneratorOptions(
          inputFolder: '',
          outputFolder: '',
          overrideEnumToString: true,
        ),
      );

      final result = enumModel.toString();

      expect(result, contains('@override'));
      expect(result, contains('String toString() => value ?? name;'));
    });

    test('Should NOT generate toString when overrideEnumToString is false', () {
      final enumModel = EnumModel(
        name: 'TestEnum',
        values: ['value1', 'value2'],
        isInteger: false,
        enumNames: [],
        options: GeneratorOptions(
          inputFolder: '',
          outputFolder: '',
          overrideEnumToString: false,
        ),
      );

      final result = enumModel.toString();

      expect(result, isNot(contains('@override')));
      expect(result, isNot(contains('String toString()')));
    });

    test('Should generate toString for integer enums with conversion', () {
      final enumModel = EnumModel(
        name: 'TestEnum',
        values: ['1', '2', '3'],
        isInteger: true,
        enumNames: [],
        options: GeneratorOptions(
          inputFolder: '',
          outputFolder: '',
          overrideEnumToString: true,
        ),
      );

      final result = enumModel.toString();

      expect(result, contains('value?.toString() ?? name'));
    });

  });

  group('getOriginalOrOverriddenRequestParameter', () {
    test('Should override parameter if needed', () {
      final incoming =
          SwaggerRequestParameter(ref: '#definitions/TestParameter');
      final overriddenParameters = [
        SwaggerRequestParameter(
            key: 'TestParameter', type: 'Overridden parameter')
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
