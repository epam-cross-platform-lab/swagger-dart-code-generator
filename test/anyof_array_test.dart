import 'package:swagger_dart_code_generator/src/code_generators/v3/swagger_models_generator_v3.dart';
import 'package:swagger_dart_code_generator/src/models/generator_options.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/responses/swagger_schema.dart';
import 'package:test/test.dart';

void main() {
  final generator = SwaggerModelsGeneratorV3(
    GeneratorOptions(
      inputFolder: '',
      outputFolder: '',
    ),
  );

  group('anyOf with arrays', () {
    test('Should handle anyOf with nullable array of strings', () {
      const className = 'PageResponse';
      const propertyName = 'options';
      const propertyKey = 'options';

      // This simulates the OpenAPI schema:
      // anyOf:
      //   - type: array
      //     items:
      //       type: string
      //   - type: 'null'
      final prop = SwaggerSchema(
        anyOf: [
          SwaggerSchema(
            type: 'array',
            items: SwaggerSchema(type: 'string'),
          ),
          SwaggerSchema(type: 'null'),
        ],
      );

      final result = generator.generatePropertyContentByAnyOf(
        prop: prop,
        propertyName: propertyName,
        propertyKey: propertyKey,
        className: className,
        allEnumNames: [],
        allEnumListNames: [],
        requiredProperties: [],
        isDeprecated: false,
      );

      // Should generate: final List<String>? options;
      // NOT: final ListString? options;
      expect(result, contains('final List<String>? options'));
      expect(result, isNot(contains('ListString')));
    });

    test('Should handle anyOf with array of integers', () {
      const className = 'TestClass';
      const propertyName = 'numbers';
      const propertyKey = 'numbers';

      final prop = SwaggerSchema(
        anyOf: [
          SwaggerSchema(
            type: 'array',
            items: SwaggerSchema(type: 'integer'),
          ),
          SwaggerSchema(type: 'null'),
        ],
      );

      final result = generator.generatePropertyContentByAnyOf(
        prop: prop,
        propertyName: propertyName,
        propertyKey: propertyKey,
        className: className,
        allEnumNames: [],
        allEnumListNames: [],
        requiredProperties: [],
        isDeprecated: false,
      );

      expect(result, contains('final List<int>? numbers'));
      expect(result, isNot(contains('ListInt')));
    });

    test('Should handle anyOf with non-nullable array', () {
      const className = 'TestClass';
      const propertyName = 'items';
      const propertyKey = 'items';

      final prop = SwaggerSchema(
        anyOf: [
          SwaggerSchema(
            type: 'array',
            items: SwaggerSchema(type: 'string'),
          ),
        ],
      );

      final result = generator.generatePropertyContentByAnyOf(
        prop: prop,
        propertyName: propertyName,
        propertyKey: propertyKey,
        className: className,
        allEnumNames: [],
        allEnumListNames: [],
        requiredProperties: ['items'], // Required property
        isDeprecated: false,
      );

      // Should be non-nullable when required
      expect(result, contains('final List<String> items'));
      expect(result, isNot(contains('List<String>? items')));
    });
  });
}
