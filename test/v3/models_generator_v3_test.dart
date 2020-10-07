import 'package:swagger_dart_code_generator/src/code_generators/v3/swagger_models_generator_v3.dart';
import 'package:swagger_dart_code_generator/src/models/generator_options.dart';
import 'package:test/test.dart';
import '../code_examples.dart';
import 'requests_generator_v3_definitions.dart';

void main() {
  group('generate', () {
    final generator = SwaggerModelsGeneratorV3();
    const fileName = 'order_service.dart';

    test('Should parse object name as a field Type', () {
      final result = generator.generate(
          model_with_parameters_v3, fileName, GeneratorOptions());

      expect(result, contains('final TokensResponseToken_type tokenType'));
    });

    test('Should parse object name as a field Type', () {
      const expectedResult = "@JsonKey(name: 'expires_in', defaultValue: 19)";
      final generatorOptions =
          GeneratorOptions(defaultValuesMap: <DefaultValueMap>[
        DefaultValueMap(
          typeName: 'int',
          defaultValue: '19',
        )
      ]);
      final result = generator.generate(
          model_with_parameters_v3, fileName, generatorOptions);

      expect(result, contains(expectedResult));
    });
  });

  group('generateEnumContentIfPossible', () {
    final generator = SwaggerModelsGeneratorV3();
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
    final generator = SwaggerModelsGeneratorV3();

    test('Should generate enum name', () {
      const className = 'animal';
      const enumName = 'cat';
      const expectedResult = 'AnimalCat';
      final result = generator.generateEnumName(className, enumName);

      expect(result, contains(expectedResult));
    });
  });

  group('generateDefaultValueFromMap', () {
    final generator = SwaggerModelsGeneratorV3();
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
    final generator = SwaggerModelsGeneratorV3();
    test('Should return validate parameter type name', () {
      const className = 'Animal';
      const parameterName = 'orderId';
      const parameter = <String, dynamic>{'type': 'object'};
      const expectedResult = 'Object';
      final result =
          generator.getParameterTypeName(className, parameterName, parameter);

      expect(result, contains(expectedResult));
    });

    test('Should return Object, because we dont jave map[items]', () {
      const className = 'Animal';
      const parameterName = 'orderId';
      const parameter = <String, dynamic>{'type': 'array'};
      const expectedResult = 'Object';
      final result =
          generator.getParameterTypeName(className, parameterName, parameter);

      expect(result, contains(expectedResult));
    });

    test('Should return Object, because we have map[oneOf]', () {
      const className = 'Animal';
      const parameterName = 'orderId';
      const parameter = <String, dynamic>{'oneOf': 'animals'};
      const expectedResult = 'Object';
      final result =
          generator.getParameterTypeName(className, parameterName, parameter);

      expect(result, contains(expectedResult));
    });

    test('Should return Object', () {
      const className = 'Animal';
      const parameterName = 'orderId';
      const expectedResult = 'Object';
      final result =
          generator.getParameterTypeName(className, parameterName, null);

      expect(result, contains(expectedResult));
    });

    test('Should return validate parameter type name', () {
      const className = 'Animal';
      const parameterName = 'orderId';
      const parameter = <String, dynamic>{'\$ref': '#/definitions/Pet'};
      const expectedResult = 'Pet';
      final result =
          generator.getParameterTypeName(className, parameterName, parameter);

      expect(result, contains(expectedResult));
    });

    test('Should return optional name parameter', () {
      const className = 'Animal';
      const parameterName = 'orderId';
      const refNameParameter = 'animals_Object';
      const expectedResult = 'AnimalsObject';
      final result = generator.getParameterTypeName(
          className, parameterName, null, refNameParameter);

      expect(result, contains(expectedResult));
    });

    test('Should return DateTime', () {
      const className = 'Animal';
      const parameterName = 'orderId';
      const parameter = <String, dynamic>{
        'type': 'string',
        'format': 'date-time'
      };
      const expectedResult = 'DateTime';
      final result =
          generator.getParameterTypeName(className, parameterName, parameter);

      expect(result, contains(expectedResult));
    });
  });

  group('getEnumFieldName', () {
    final generator = SwaggerModelsGeneratorV3();

    test('Should return validate enum field name', () {
      const name = 'cat-dog_ Cars';
      const expectedResult = 'catDogCars';
      final result = generator.getEnumFieldName(name);

      expect(result, contains(expectedResult));
    });

    test('Should return validate enum field name without forbidden symbols',
        () {
      const name = 'cat,dog..Cars';
      const expectedResult = 'catDogCars';
      final result = generator.getEnumFieldName(name);

      expect(result, contains(expectedResult));
    });

    test('Should return \$validateEnumFieldName', () {
      const name = '55element';
      const expectedResult = 'value_55element';
      final result = generator.getEnumFieldName(name);

      expect(result, contains(expectedResult));
    });

    test('Should return \$with', () {
      const name = 'with';
      const expectedResult = '\$with';
      final result = generator.getEnumFieldName(name);

      expect(result, contains(expectedResult));
    });
  });

  group('generateFieldName', () {
    test('Should return validate field name', () {
      const name = 'Cat_Dog-Animals';
      const expectedResult = 'catDogAnimals';
      final result = SwaggerModelsGeneratorV3.generateFieldName(name);

      expect(result, contains(expectedResult));
    });

    test('Should return \$forbiddenFieldName', () {
      const name = '#';
      const expectedResult = '\$forbiddenFieldName';
      final result = SwaggerModelsGeneratorV3.generateFieldName(name);

      expect(result, contains(expectedResult));
    });

    test('Should return \$null', () {
      const name = 'null';
      const expectedResult = '\$null';
      final result = SwaggerModelsGeneratorV3.generateFieldName(name);

      expect(result, contains(expectedResult));
    });

    test('Should return \$number', () {
      const name = '5element';
      const expectedResult = '\$5element';
      final result = SwaggerModelsGeneratorV3.generateFieldName(name);

      expect(result, contains(expectedResult));
    });
  });

  group('generatePropertyContentByDefault', () {
    final generator = SwaggerModelsGeneratorV3();
    test('Should return property with JsonKey', () {
      final propertyEntryMap = <String, dynamic>{'originalRef': 'Pet'};
      const propertyName = 'shipDate';
      const jsonKeyExpendedResult = "@JsonKey(name: '$propertyName'";
      final expectedResult =
          "\t$jsonKeyExpendedResult)\n  final ${propertyEntryMap['originalRef']} $propertyName;";

      final result = generator
          .generatePropertyContentByDefault(propertyEntryMap, propertyName, []);

      expect(result, contains(jsonKeyExpendedResult));
      expect(result, contains(expectedResult));
    });

    test('Should add unknownEnumValue', () {
      final propertyEntryMap = <String, dynamic>{'originalRef': 'Pet'};
      const propertyName = 'shipDate';
      final result = generator.generatePropertyContentByDefault(
          propertyEntryMap, propertyName, ['Pet']);

      expect(result, contains('unknownEnumValue: Pet.swaggerGeneratedUnknown'));
    });
  });

  group('generatePropertyContentByRef', () {
    final generator = SwaggerModelsGeneratorV3();
    test('Should return property with JsonKey', () {
      final propertyEntryMap = <String, dynamic>{'\$ref': '#/definitions/Pet'};
      const propertyName = 'shipDate';
      const propertyKey = 'shipDateGet';
      const className = 'Animals';
      const jsonKeyExpendedResult = "@JsonKey(name: '$propertyKey'";
      const expectedResult =
          '\t$jsonKeyExpendedResult)\n  final Pet $propertyName;';

      final result = generator.generatePropertyContentByRef(
          propertyEntryMap, propertyName, propertyKey, className, []);

      expect(result, contains(jsonKeyExpendedResult));
      expect(result, contains(expectedResult));
    });

    test('Should add unknownEnumValue', () {
      final propertyEntryMap = <String, dynamic>{'\$ref': '#/definitions/Pet'};
      const propertyName = 'shipDate';
      const propertyKey = 'shipDateGet';
      const className = 'Animals';

      final result = generator.generatePropertyContentByRef(
          propertyEntryMap, propertyName, propertyKey, className, ['Pet']);

      expect(result, contains('unknownEnumValue: Pet.swaggerGeneratedUnknown'));
    });
  });

  group('generateEnumValuesContent', () {
    final generator = SwaggerModelsGeneratorV3();
    test('Should return enum values', () {
      final list = <String>['Cats', 'dogs', 'Forgs'];
      const expectedResult = "\t@JsonValue('Cats')\n  cats";
      final result = generator.generateEnumValuesContent(list);

      expect(result, contains(expectedResult));
    });
  });

  group('generateEnumPropertyContent', () {
    final generator = SwaggerModelsGeneratorV3();
    test('Should return enum property with JsonKey', () {
      // ignore: prefer_const_declarations
      final key = 'dog';
      const className = 'animals';
      const jsonKeyExpectedResult =
          '@JsonKey(unknownEnumValue: AnimalsDog.swaggerGeneratedUnknown)';
      const expectedResult = 'final AnimalsDog dog;';
      final result = generator.generateEnumPropertyContent(key, className);

      expect(result, contains(jsonKeyExpectedResult));
      expect(result, contains(expectedResult));
    });
  });

  group('generateModelClassContent', () {
    final generator = SwaggerModelsGeneratorV3();
    test('Should return model class content', () {
      const map = <String, dynamic>{};
      const schemes = <String, dynamic>{};
      const className = 'Animals';
      const useDefaultNullForLists = false;
      const classExpectedResult = 'class Animals {';
      const factoryConstructorExpectedResult =
          '\tfactory Animals.fromJson(Map<String, dynamic> json) => _\$AnimalsFromJson(json);\n';
      final result = generator.generateModelClassContent(className, map,
          schemes, <DefaultValueMap>[], useDefaultNullForLists, []);

      expect(result, contains(classExpectedResult));
      expect(result, contains(factoryConstructorExpectedResult));
    });

    test('Should return enum if model is enum', () {
      final map = <String, dynamic>{
        'enum': ['Item1', 'Item2']
      };
      const schemes = <String, dynamic>{};
      const className = 'Animals';
      const useDefaultNullForLists = false;

      final result = generator.generateModelClassContent(className, map,
          schemes, <DefaultValueMap>[], useDefaultNullForLists, []);

      expect(result, contains('enum Animals {'));
    });
  });

  group('generateConstructorPropertiesContent', () {
    final generator = SwaggerModelsGeneratorV3();
    test('Should return empty', () {
      const expectedResult = '';
      final result = generator.generateConstructorPropertiesContent(null);

      expect(result, contains(expectedResult));
    });

    test('Should return validate constructor property', () {
      final map = <String, dynamic>{'Animal': 'dog'};
      const expectedResult = 'this.animal';
      final result = generator.generateConstructorPropertiesContent(map);

      expect(result, contains(expectedResult));
    });
  });

  group('generatePropertyContentBySchema', () {
    final generator = SwaggerModelsGeneratorV3();
    test('Should return property content by schema', () {
      final map = <String, dynamic>{
        'schema': <String, dynamic>{'\$ref': '#/definitions/Pet'}
      };
      const propertyName = 'dog';
      const className = 'Animals';
      const propertyKey = 'Dog';
      const jsonKeyExpectedResult = "\t@JsonKey(name: 'Dog')\n";
      const fieldExpectedResult = '\tfinal Pet dog';
      final result = generator.generatePropertyContentBySchema(
          map, propertyName, propertyKey, className, []);

      expect(result, contains(jsonKeyExpectedResult));
      expect(result, contains(fieldExpectedResult));
    });

    test('Should add unknownEnumValue', () {
      final map = <String, dynamic>{
        'schema': <String, dynamic>{'\$ref': '#/definitions/Pet'}
      };
      const propertyName = 'dog';
      const className = 'Animals';
      const propertyKey = 'Dog';

      final result = generator.generatePropertyContentBySchema(
          map, propertyName, propertyKey, className, ['Pet']);

      expect(result, contains('unknownEnumValue: Pet.swaggerGeneratedUnknown'));
    });
  });

  group('generatePropertiesContent', () {
    final generator = SwaggerModelsGeneratorV3();
    test('Should return properties from ref', () {
      final map = <String, dynamic>{
        'Animals': <String, dynamic>{'\$ref': '#/definitions/Pet'}
      };
      const className = 'Animals';
      const jsonKeyExpectedResult = "\t@JsonKey(name: 'Animals')\n";
      const fieldExpectedResult = 'final Pet animals';
      final result = generator.generatePropertiesContent(
          map, className, <DefaultValueMap>[], false, []);

      expect(result, contains(jsonKeyExpectedResult));
      expect(result, contains(fieldExpectedResult));
    });

    test('Should return properties from schema', () {
      final map = <String, dynamic>{
        'Animals': <String, dynamic>{
          'schema': <String, dynamic>{'\$ref': '#/definitions/Pet'}
        }
      };

      const className = 'Animals';
      const jsonKeyExpectedResult = "\t@JsonKey(name: 'Animals')\n";
      const fieldExpectedResult = 'final Pet animals';
      final result = generator.generatePropertiesContent(
          map, className, <DefaultValueMap>[], false, []);

      expect(result, contains(jsonKeyExpectedResult));
      expect(result, contains(fieldExpectedResult));
    });

    test('Should return properties from default originalRef', () {
      final map = <String, dynamic>{
        'Animals': <String, dynamic>{'originalRef': 'Pet'}
      };

      const className = 'Animals';
      const jsonKeyExpectedResult = "\t@JsonKey(name: 'Animals')\n";
      const fieldExpectedResult = 'final Pet animals';
      final result = generator.generatePropertiesContent(
          map, className, <DefaultValueMap>[], false, []);

      expect(result, contains(jsonKeyExpectedResult));
      expect(result, contains(fieldExpectedResult));
    });

    test('Should return property \$with', () {
      final map = <String, dynamic>{
        'with': <String, dynamic>{'originalRef': 'Pet'}
      };

      const className = 'Animals';
      const jsonKeyExpectedResult = "\t@JsonKey(name: '\$with')\n";
      const fieldExpectedResult = 'final Pet \$with';
      final result = generator.generatePropertiesContent(
          map, className, <DefaultValueMap>[], false, []);

      expect(result, contains(jsonKeyExpectedResult));
      expect(result, contains(fieldExpectedResult));
    });
  });

  group('generateListPropertyContent', () {
    final generator = SwaggerModelsGeneratorV3();
    test('Should return List<Object>', () {
      final map = <String, dynamic>{'items': null};
      const propertyName = 'dog';
      const className = 'Animals';
      const propertyKey = 'Dog';
      const jsonKeyExpectedResult =
          "@JsonKey(name: 'Dog', defaultValue: <Object>[])";

      const propertyExpectedResult = 'final List<Object> dog';
      final result = generator.generateListPropertyContent(
          propertyName, propertyKey, className, map, false, []);

      expect(result, contains(jsonKeyExpectedResult));
      expect(result, contains(propertyExpectedResult));
    });

    test('Should add unknownEnumValue', () {
      final map = <String, dynamic>{
        'items': {'originalRef': 'Dog'}
      };
      const propertyName = 'dog';
      const className = 'Animals';
      const propertyKey = 'Dog';
      final result = generator.generateListPropertyContent(
          propertyName, propertyKey, className, map, false, ['Dog']);

      expect(result, contains('unknownEnumValue: Dog.swaggerGeneratedUnknown'));
    });

    test('Should return List<Object>', () {
      final map = <String, dynamic>{
        'items': {'originalRef': 'TestOriginalRef'}
      };
      const propertyName = 'dog';
      const className = 'Animals';
      const propertyKey = 'Dog';

      final result = generator.generateListPropertyContent(
          propertyName, propertyKey, className, map, false, []);

      expect(result, contains('final List<TestOriginalRef> dog;'));
    });
  });

  group('generatePropertyContentByType', () {
    final generator = SwaggerModelsGeneratorV3();
    test('Should return property content by schema', () {
      final map = <String, String>{'type': 'enum'};
      const propertyName = 'dog';
      const className = 'Animals';
      const propertyKey = 'Dog';
      const jsonKeyExpectedResult =
          '@JsonKey(unknownEnumValue: AnimalsDog.swaggerGeneratedUnknown)';

      const propertyExpectedResult = 'final AnimalsDog dog';
      final result = generator.generatePropertyContentByType(map, propertyName,
          propertyKey, className, <DefaultValueMap>[], false, []);

      expect(result, contains(jsonKeyExpectedResult));
      expect(result, contains(propertyExpectedResult));
    });

    test('Should return property content by schema', () {
      final map = <String, String>{'type': 'array'};
      const propertyName = 'dog';
      const className = 'Animals';
      const propertyKey = 'Dog';

      final result = generator.generatePropertyContentByType(map, propertyName,
          propertyKey, className, <DefaultValueMap>[], false, []);

      expect(result, contains('final List<Object> dog;'));
    });
  });

  group('getModelInheritedProperties', () {
    final generator = SwaggerModelsGeneratorV3();
    test('Should generate 2 levels of inheritance', () {
      final result = generator.generate(
          model_with_inheritance, 'MyClass', GeneratorOptions());

      expect(
          result, contains('class ExtendedErrorModel extends BasicErrorModel'));
    });

    test('Should generate enum', () {
      final result =
          generator.generate(model_with_enum, 'MyClass', GeneratorOptions());

      expect(result, contains('enum BasicErrorModel'));
    });

    test('Should generate 3 levels of inheritance', () {
      final result = generator.generate(
          model_with_inheritance_3_levels, 'MyClass', GeneratorOptions());

      expect(result,
          contains('class MostExtendedErrorModel extends ExtendedErrorModel'));

      expect(
          result, contains('class ExtendedErrorModel extends BasicErrorModel'));
    });
  });
}
