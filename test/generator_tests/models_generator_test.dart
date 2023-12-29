import 'package:swagger_dart_code_generator/src/code_generators/v2/swagger_models_generator_v2.dart';
import 'package:swagger_dart_code_generator/src/code_generators/v3/swagger_models_generator_v3.dart';
import 'package:swagger_dart_code_generator/src/models/generator_options.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/responses/swagger_schema.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/swagger_root.dart';
import 'package:test/test.dart';

import '../code_examples.dart';

void main() {
  final generator = SwaggerModelsGeneratorV3(
    GeneratorOptions(
      inputFolder: '',
      outputFolder: '',
    ),
  );
  final generator2 = SwaggerModelsGeneratorV2(
    GeneratorOptions(
      inputFolder: '',
      outputFolder: '',
    ),
  );

  group('generateDefaultValueFromMap', () {
    test('Should return default value', () {
      const defaultValue = 'true';
      const typeName = 'bool';
      const expectedResult = 'true';
      final result = generator.generateDefaultValueFromMap(
          DefaultValueMap(defaultValue: defaultValue, typeName: typeName));

      expect(result, contains(expectedResult));
    });

    test('Should return default from switch', () {
      const defaultValue = 'Animal';
      const typeName = 'Object';
      const expectedResult = 'Animal';
      final result = generator.generateDefaultValueFromMap(
          DefaultValueMap(defaultValue: defaultValue, typeName: typeName));

      expect(result, contains(expectedResult));
    });
  });

  group('getParameterTypeName', () {
    test('Should return validate parameter type name', () {
      const className = 'Animal';
      const parameterName = 'orderId';
      final parameter = SwaggerSchema(type: 'object');
      const expectedResult = 'Object';
      final result = generator.getParameterTypeName(
          className, parameterName, parameter, '', null);

      expect(result, contains(expectedResult));
    });

    test('Should return Object, because we dont jave map[items]', () {
      const className = 'Animal';
      const parameterName = 'orderId';
      final parameter = SwaggerSchema(type: 'array');
      const expectedResult = 'Object';
      final result = generator.getParameterTypeName(
          className, parameterName, parameter, '', null);

      expect(result, contains(expectedResult));
    });

    test('Should return Object, because we have map[oneOf]', () {
      const className = 'Animal';
      const parameterName = 'orderId';
      final parameter = SwaggerSchema(oneOf: [SwaggerSchema(type: 'animals')]);
      const expectedResult = 'Object';
      final result = generator.getParameterTypeName(
          className, parameterName, parameter, '', null);

      expect(result, contains(expectedResult));
    });

    test('Should return Object', () {
      const className = 'Animal';
      const parameterName = 'orderId';
      const expectedResult = 'Object';
      final result = generator.getParameterTypeName(
          className, parameterName, null, '', null);

      expect(result, contains(expectedResult));
    });

    test('Should return validate parameter type name', () {
      const className = 'Animal';
      const parameterName = 'orderId';
      final parameter = SwaggerSchema(ref: '#/definitions/Pet');
      const expectedResult = 'Pet';
      final result = generator.getParameterTypeName(
          className, parameterName, parameter, '', null);

      expect(result, contains(expectedResult));
    });

    test('Should return optional name parameter', () {
      const className = 'Animal';
      const parameterName = 'orderId';
      const refNameParameter = 'animals_Object';
      const expectedResult = 'AnimalsObject';
      final result = generator.getParameterTypeName(
          className, parameterName, null, '', refNameParameter);

      expect(result, contains(expectedResult));
    });

    test('Should return DateTime', () {
      const className = 'Animal';
      const parameterName = 'orderId';
      final parameter = SwaggerSchema(type: 'string', format: 'date-time');
      const expectedResult = 'DateTime';
      final result = generator.getParameterTypeName(
          className, parameterName, parameter, '', null);

      expect(result, contains(expectedResult));
    });
  });

  group('generateFieldName', () {
    test('Should return validate field name', () {
      const name = 'Cat_Dog-Animals';
      const expectedResult = 'catDogAnimals';
      final result = generator.generateFieldName(name);

      expect(result, contains(expectedResult));
    });

    test('Should return \$forbiddenFieldName', () {
      const name = '#';
      const expectedResult = '\$forbiddenFieldName';
      final result = generator.generateFieldName(name);

      expect(result, contains(expectedResult));
    });

    test('Should return \$null', () {
      const name = 'null';
      const expectedResult = '\$null';
      final result = generator.generateFieldName(name);

      expect(result, contains(expectedResult));
    });

    test('Should return \$number', () {
      const name = '5element';
      const expectedResult = '\$5element';
      final result = generator.generateFieldName(name);

      expect(result, contains(expectedResult));
    });
  });

  group('generatePropertyContentByDefault', () {
    test('Should return property with JsonKey', () {
      final propertyEntryMap = SwaggerSchema(originalRef: 'Pet');
      const propertyName = 'shipDate';
      const jsonKeyExpendedResult = "@JsonKey(name: '$propertyName'";
      final result = generator.generatePropertyContentByDefault(
        prop: propertyEntryMap,
        propertyName: propertyName,
        allEnumNames: [],
        allEnumListNames: [],
        requiredProperties: [],
        isDeprecated: false,
      );

      expect(result, contains(jsonKeyExpendedResult));
    });

    test('Should generate includeIfNull if option is true', () {
      final propertyEntryMap = SwaggerSchema(originalRef: 'Pet');
      const propertyName = 'shipDate';
      final result = SwaggerModelsGeneratorV3(GeneratorOptions(
        inputFolder: '',
        outputFolder: '',
        includeIfNull: false,
      )).generatePropertyContentByDefault(
        prop: propertyEntryMap,
        propertyName: propertyName,
        allEnumNames: [],
        allEnumListNames: [],
        requiredProperties: [],
        isDeprecated: false,
      );

      expect(result, contains(', includeIfNull: false'));
    });

    test('Should NOT generate includeIfNull if option is false', () {
      final propertyEntryMap = SwaggerSchema(originalRef: 'Pet');
      const propertyName = 'shipDate';
      final result = generator.generatePropertyContentByDefault(
        prop: propertyEntryMap,
        propertyName: propertyName,
        allEnumNames: [],
        allEnumListNames: [],
        requiredProperties: [],
        isDeprecated: false,
      );

      expect(result.contains(', includeIfNull: false'), equals(false));
    });
  });

  group('generateModelClassContent', () {
    test('Should return model class content', () {
      final map = SwaggerSchema.fromJson({});
      const className = 'Animals';
      const classExpectedResult = 'class Animals{';
      const factoryConstructorExpectedResult =
          '\tfactory Animals.fromJson(Map<String, dynamic> json) => _\$AnimalsFromJson(json);\n';
      final result = generator.generateModelClassContent(
        SwaggerRoot.empty,
        className,
        map,
        {},
        <DefaultValueMap>[],
        [],
        [],
        [],
        {},
        'fle_name',
      );

      expect(result, contains(classExpectedResult));
      expect(result, contains(factoryConstructorExpectedResult));
    });

    test('Should return model class content', () {
      final map = SwaggerSchema.fromJson({});
      const className = 'Animals';
      const classExpectedResult = 'class Animals{';
      const factoryConstructorExpectedResult =
          '\tfactory Animals.fromJson(Map<String, dynamic> json) => _\$AnimalsFromJson(json);\n';
      final result = generator2.generateModelClassContent(
        SwaggerRoot.empty,
        className,
        map,
        {},
        <DefaultValueMap>[],
        [],
        [],
        [],
        {},
        'fle_name',
      );

      expect(result, contains(classExpectedResult));
      expect(result, contains(factoryConstructorExpectedResult));
    });
  });

  group('generateConstructorPropertiesContent', () {
    test('Should return empty', () {
      const expectedResult = '';
      final result = generator.generateConstructorPropertiesContent(
        className: '',
        entityMap: {},
        defaultValues: [],
        requiredProperties: [],
        allEnumNames: [],
        allEnumListNames: [],
      );

      expect(result, contains(expectedResult));
    });

    test('Should return validate constructor property', () {
      final map = <String, SwaggerSchema>{'Animal': SwaggerSchema()};
      const expectedResult = 'this.animal';
      final result = generator.generateConstructorPropertiesContent(
        className: '',
        entityMap: map,
        defaultValues: [],
        requiredProperties: [],
        allEnumNames: [],
        allEnumListNames: [],
      );

      expect(result, contains(expectedResult));
    });
  });

  group('generatePropertyContentBySchema', () {
    test('Should return property content by schema', () {
      final map = SwaggerSchema(schema: SwaggerSchema(ref: 'Pet'));
      const propertyName = 'dog';
      const className = 'Animals';
      const propertyKey = 'Dog';
      const jsonKeyExpectedResult = "\t@JsonKey(name: 'Dog')\n";
      const fieldExpectedResult = '\tfinal Pet dog';
      final result = generator.generatePropertyContentBySchema(
        map,
        propertyName,
        propertyKey,
        className,
        [],
        [],
        {},
        [],
      );

      expect(result, contains(jsonKeyExpectedResult));
      expect(result, contains(fieldExpectedResult));
    });
  });

  group('generatePropertiesContent', () {
    test('Should return properties from ref', () {
      final map = {
        'Animals': SwaggerSchema(ref: '#/definitions/Pet'),
      };

      const className = 'Animals';
      const jsonKeyExpectedResult = "\t@JsonKey(name: 'Animals')\n";
      const fieldExpectedResult = 'final Pet? animals';
      final result = generator.generatePropertiesContent(
        SwaggerRoot.empty,
        map,
        {},
        className,
        <DefaultValueMap>[],
        [],
        [],
        [],
        [],
        {},
      );

      expect(result, contains(jsonKeyExpectedResult));
      expect(result, contains(fieldExpectedResult));
    });

    test('Should return properties from schema', () {
      final map = {
        'Animals': SwaggerSchema(
          schema: SwaggerSchema(ref: '#/definitions/Pet'),
        )
      };

      const className = 'Animals';
      const jsonKeyExpectedResult = "\t@JsonKey(name: 'Animals')\n";
      const fieldExpectedResult = 'final Pet animals';
      final result = generator.generatePropertiesContent(
        SwaggerRoot.empty,
        map,
        {},
        className,
        <DefaultValueMap>[],
        [],
        [],
        [],
        [],
        {},
      );

      expect(result, contains(jsonKeyExpectedResult));
      expect(result, contains(fieldExpectedResult));
    });

    test('Should return properties from default originalRef', () {
      final map = {
        'Animals': SwaggerSchema(originalRef: 'Pet'),
      };

      const className = 'Animals';
      const jsonKeyExpectedResult = "\t@JsonKey(name: 'animals')\n";
      const fieldExpectedResult = 'final Pet animals';
      final result = generator.generatePropertiesContent(
        SwaggerRoot.empty,
        map,
        {},
        className,
        <DefaultValueMap>[],
        [],
        [],
        [],
        [],
        {},
      );

      expect(result, contains(jsonKeyExpectedResult));
      expect(result, contains(fieldExpectedResult));
    });

    test('Should return property \$with', () {
      final map = {
        'with': SwaggerSchema(originalRef: 'Pet'),
      };

      const className = 'Animals';
      const jsonKeyExpectedResult = "\t@JsonKey(name: '\\\$with')\n";
      const fieldExpectedResult = 'final Pet \$with';
      final result = generator.generatePropertiesContent(
        SwaggerRoot.empty,
        map,
        {},
        className,
        <DefaultValueMap>[],
        [],
        [],
        [],
        [],
        {},
      );

      expect(result, contains(jsonKeyExpectedResult));
      expect(result, contains(fieldExpectedResult));
    });
  });

  group('generateListPropertyContent', () {
    test('Should return List<Object>', () {
      final map = SwaggerSchema(items: null);
      const propertyName = 'dog';
      const className = 'Animals';
      const propertyKey = 'Dog';
      const jsonKeyExpectedResult =
          "@JsonKey(name: 'Dog', defaultValue: <Object>[])";

      const propertyExpectedResult = 'final List<Object>? dog';
      final result = generator.generateListPropertyContent(
        propertyName: propertyName,
        propertyKey: propertyKey,
        className: className,
        prop: map,
        classesWithNullableLists: [],
        allEnumNames: [],
        allEnumListNames: [],
        basicTypesMap: {},
        requiredProperties: [],
        allClasses: {},
        isDeprecated: false,
      );

      expect(result, contains(jsonKeyExpectedResult));
      expect(result, contains(propertyExpectedResult));
    });

    test('Should add fromJson and toJson', () {
      final map = SwaggerSchema(items: SwaggerSchema(originalRef: 'Dog'));
      const propertyName = 'dog';
      const className = 'Animals';
      const propertyKey = 'Dog';
      final result = generator.generateListPropertyContent(
        propertyName: propertyName,
        propertyKey: propertyKey,
        className: className,
        prop: map,
        classesWithNullableLists: [],
        allEnumNames: [],
        allEnumListNames: [],
        basicTypesMap: {},
        requiredProperties: [],
        allClasses: {},
        isDeprecated: false,
      );

      expect(
          result, contains('toJson: dogListToJson, fromJson: dogListFromJson'));
    });

    test('Should return List<Object>', () {
      final map =
          SwaggerSchema(items: SwaggerSchema(originalRef: 'TestOriginalRef'));
      const propertyName = 'dog';
      const className = 'Animals';
      const propertyKey = 'Dog';

      final result = generator.generateListPropertyContent(
        propertyName: propertyName,
        propertyKey: propertyKey,
        className: className,
        prop: map,
        classesWithNullableLists: [],
        allEnumNames: [],
        allEnumListNames: [],
        basicTypesMap: {},
        requiredProperties: [],
        allClasses: {},
        isDeprecated: false,
      );

      expect(result, contains('final List<TestOriginalRef>? dog;'));
    });

    test('Should return List<Object> by ref', () {
      final map =
          SwaggerSchema(items: SwaggerSchema(ref: '#/definitions/TestObject'));
      const propertyName = 'dog';
      const className = 'Animals';
      const propertyKey = 'Dog';

      final result = generator.generateListPropertyContent(
        propertyName: propertyName,
        propertyKey: propertyKey,
        className: className,
        prop: map,
        classesWithNullableLists: [],
        allEnumNames: [],
        allEnumListNames: [],
        basicTypesMap: {},
        requiredProperties: [],
        allClasses: {},
        isDeprecated: false,
      );

      expect(result, contains('final List<TestObject>? dog;'));
    });
  });

  group('Tests for getValidatedClassName', () {
    test('Should', () {
      final result = generator.getValidatedClassName('Request');

      expect(result, equals('Request\$'));
    });
  });

  group('Tests for generateResponses', () {
    test('Should generate empty string for V2', () {
      final map = SwaggerRoot.parse(schemasResponsesWithResponse);
      final result = generator2.generate(
        root: map,
        fileName: 'fileName',
        allEnums: [],
      );

      expect(result, equals(''));
    });
  });

  group('Tests for models from responses', () {
    test('Should generate correct model from response', () {
      final map = SwaggerRoot.parse(requestWithReturnTypeInjected);
      final result = generator.generate(
        root: map,
        fileName: 'fileName',
        allEnums: [],
      );

      expect(result, contains('class ModelItemsGet\$Response'));
    });
  });

  group('Tests for additionalProperties', () {
    test('Should generate dynamic map type', () {
      final map = SwaggerRoot.parse(objectWithadditionalProperties);
      final result = generator.generate(
        root: map,
        fileName: 'fileName',
        allEnums: [],
      );

      expect(result, contains('final Map<String,dynamic>? metadata'));
    });
  });
}
