import 'dart:convert';

import 'package:swagger_dart_code_generator/src/code_generators/v2/swagger_models_generator_v2.dart';
import 'package:swagger_dart_code_generator/src/code_generators/v3/swagger_models_generator_v3.dart';
import 'package:swagger_dart_code_generator/src/models/generator_options.dart';
import 'package:swagger_dart_code_generator/src/models/swagger_enum.dart';
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
  group('generate', () {
    const fileName = 'order_service.dart';

    test('Should parse object name as a field Type', () {
      final map = jsonDecode(modelWithParametersV3) as Map<String, dynamic>;
      final result = generator.generate(map, fileName);

      expect(
          result, contains('final enums.TokensResponseTokenType? tokenType'));
    });

    test('Should generate .toLower() when caseSensitive: false', () {
      final map = jsonDecode(modelWithParametersV3) as Map<String, dynamic>;
      final result = SwaggerModelsGeneratorV3(GeneratorOptions(
        inputFolder: '',
        outputFolder: '',
        enumsCaseSensitive: false,
      )).generate(map, fileName);

      expect(
          result,
          contains(
              'element.value.toLowerCase() == someEnumModel.toLowerCase()'));
    });

    test('Should NOT generate .toLower() when caseSensitive: false', () {
      final map = jsonDecode(modelWithParametersV3) as Map<String, dynamic>;
      final result = generator.generate(map, fileName);

      expect(result, contains('element.value == someEnumModel'));
    });

    test('Should parse object name as a field Type', () {
      final map = jsonDecode(modelWithParametersV2) as Map<String, dynamic>;
      final result = generator2.generate(map, fileName);

      expect(
          result,
          contains(
              'final enums.ActiveOrderAndListSummaryShoppingType shoppingType'));
    });

    test('Should parse object name as a field Type', () {
      const expectedResult = "@JsonKey(name: 'expires_in', defaultValue: 19)";
      final map = jsonDecode(modelWithParametersV3) as Map<String, dynamic>;
      final result = SwaggerModelsGeneratorV3(
        GeneratorOptions(
          inputFolder: '',
          outputFolder: '',
          defaultValuesMap: [
            DefaultValueMap(
              typeName: 'int',
              defaultValue: '19',
            ),
          ],
        ),
      ).generate(map, fileName);

      expect(result, contains(expectedResult));
    });
  });

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
      const parameter = <String, dynamic>{'type': 'object'};
      const expectedResult = 'Object';
      final result = generator.getParameterTypeName(
          className, parameterName, parameter, '', null);

      expect(result, contains(expectedResult));
    });

    test('Should return Object, because we dont jave map[items]', () {
      const className = 'Animal';
      const parameterName = 'orderId';
      const parameter = <String, dynamic>{'type': 'array'};
      const expectedResult = 'Object';
      final result = generator.getParameterTypeName(
          className, parameterName, parameter, '', null);

      expect(result, contains(expectedResult));
    });

    test('Should return Object, because we have map[oneOf]', () {
      const className = 'Animal';
      const parameterName = 'orderId';
      const parameter = <String, dynamic>{'oneOf': 'animals'};
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
          className, parameterName, {}, '', null);

      expect(result, contains(expectedResult));
    });

    test('Should return validate parameter type name', () {
      const className = 'Animal';
      const parameterName = 'orderId';
      const parameter = <String, dynamic>{'\$ref': '#/definitions/Pet'};
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
          className, parameterName, {}, '', refNameParameter);

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
      final propertyEntryMap = <String, dynamic>{'originalRef': 'Pet'};
      const propertyName = 'shipDate';
      const jsonKeyExpendedResult = "@JsonKey(name: '$propertyName'";
      final result = generator.generatePropertyContentByDefault(
        propertyEntryMap,
        propertyName,
        [],
        [],
      );

      expect(result, contains(jsonKeyExpendedResult));
    });

    test('Should generate includeIfNull if option is true', () {
      final propertyEntryMap = <String, dynamic>{'originalRef': 'Pet'};
      const propertyName = 'shipDate';
      final result = SwaggerModelsGeneratorV3(GeneratorOptions(
        inputFolder: '',
        outputFolder: '',
        includeIfNull: false,
      )).generatePropertyContentByDefault(
        propertyEntryMap,
        propertyName,
        [],
        [],
      );

      expect(result, contains(', includeIfNull: false'));
    });

    test('Should NOT generate includeIfNull if option is false', () {
      final propertyEntryMap = <String, dynamic>{'originalRef': 'Pet'};
      const propertyName = 'shipDate';
      final result = generator.generatePropertyContentByDefault(
        propertyEntryMap,
        propertyName,
        [],
        [],
      );

      expect(result.contains(', includeIfNull: false'), equals(false));
    });
  });

  group('generatePropertyContentByRef', () {
    test('Should return property with JsonKey', () {
      final propertyEntryMap = <String, dynamic>{'\$ref': '#/definitions/Pet'};
      const propertyName = 'shipDate';
      const propertyKey = 'shipDateGet';
      const className = 'Animals';
      const jsonKeyExpendedResult = "@JsonKey(name: '$propertyKey'";
      const expectedResult =
          '\t$jsonKeyExpendedResult)\n\tfinal Pet? $propertyName;';

      final result = generator.generatePropertyContentByRef(
        propertyEntryMap,
        propertyName,
        propertyKey,
        className,
        [],
        [],
        {},
        [],
      );

      expect(result, contains(jsonKeyExpendedResult));
      expect(result, contains(expectedResult));
    });

    test('Should add toJsonFromJson', () {
      final propertyEntryMap = <String, dynamic>{'\$ref': '#/definitions/Pet'};
      const propertyName = 'shipDate';
      const propertyKey = 'shipDateGet';
      const className = 'Animals';

      final result = generator.generatePropertyContentByRef(
        propertyEntryMap,
        propertyName,
        propertyKey,
        className,
        ['enums.Pet'],
        [],
        {},
        [],
      );

      expect(result, contains('toJson: petToJson, fromJson: petFromJson'));
    });
  });

  group('generateEnumPropertyContent', () {
    test('Should return enum property with JsonKey with fromJson and toJson',
        () {
      const key = 'dog';
      const className = 'animals';
      const jsonKeyExpectedResult =
          'toJson: animalsDogToJson, fromJson: animalsDogFromJson';
      const expectedResult = 'final AnimalsDog? dog;';
      final result = generator.generateEnumPropertyContent(
        key,
        className,
        key,
        [],
        [],
        {},
        [],
      );

      expect(result, contains(jsonKeyExpectedResult));
      expect(result, contains(expectedResult));
    });
  });

  group('generateModelClassContent', () {
    test('Should return model class content', () {
      const map = <String, dynamic>{};
      const className = 'Animals';
      const useDefaultNullForLists = false;
      const classExpectedResult = 'class Animals {';
      const factoryConstructorExpectedResult =
          '\tfactory Animals.fromJson(Map<String, dynamic> json) => _\$AnimalsFromJson(json);\n';
      final result = generator.generateModelClassContent(
        {},
        className,
        map,
        {},
        <DefaultValueMap>[],
        useDefaultNullForLists,
        [],
        [],
      );

      expect(result, contains(classExpectedResult));
      expect(result, contains(factoryConstructorExpectedResult));
    });

    test('Should return model class content', () {
      const map = <String, dynamic>{};
      const className = 'Animals';
      const useDefaultNullForLists = false;
      const classExpectedResult = 'class Animals {';
      const factoryConstructorExpectedResult =
          '\tfactory Animals.fromJson(Map<String, dynamic> json) => _\$AnimalsFromJson(json);\n';
      final result = generator2.generateModelClassContent(
        {},
        className,
        map,
        {},
        <DefaultValueMap>[],
        useDefaultNullForLists,
        [],
        [],
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
      final map = <String, dynamic>{
        'Animal': {'type': 'dog'}
      };
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
      final map = <String, dynamic>{
        'schema': <String, dynamic>{'\$ref': '#/definitions/Pet'}
      };
      const propertyName = 'dog';
      const className = 'Animals';
      const propertyKey = 'Dog';
      const jsonKeyExpectedResult = "\t@JsonKey(name: 'Dog')\n";
      const fieldExpectedResult = '\tfinal Pet? dog';
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

    test('Should add fromJson and toJson by ref', () {
      final map = <String, dynamic>{
        'schema': <String, dynamic>{'\$ref': '#/definitions/Pet'}
      };
      const propertyName = 'dog';
      const className = 'Animals';
      const propertyKey = 'Dog';

      final result = generator.generatePropertyContentBySchema(
        map,
        propertyName,
        propertyKey,
        className,
        ['enums.Pet'],
        [],
        {},
        [],
      );

      expect(result, contains('toJson: petToJson, fromJson: petFromJson'));
    });
  });

  group('generatePropertiesContent', () {
    test('Should return properties from ref', () {
      final map = <String, dynamic>{
        'Animals': <String, dynamic>{'\$ref': '#/definitions/Pet'}
      };

      const className = 'Animals';
      const jsonKeyExpectedResult = "\t@JsonKey(name: 'Animals')\n";
      const fieldExpectedResult = 'final Pet? animals';
      final result = generator.generatePropertiesContent(
        map,
        map,
        {},
        className,
        <DefaultValueMap>[],
        false,
        [],
        [],
        [],
      );

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
      const fieldExpectedResult = 'final Pet? animals';
      final result = generator.generatePropertiesContent(
        map,
        map,
        {},
        className,
        <DefaultValueMap>[],
        false,
        [],
        [],
        [],
      );

      expect(result, contains(jsonKeyExpectedResult));
      expect(result, contains(fieldExpectedResult));
    });

    test('Should return properties from default originalRef', () {
      final map = <String, dynamic>{
        'Animals': <String, dynamic>{'originalRef': 'Pet'}
      };

      const className = 'Animals';
      const jsonKeyExpectedResult = "\t@JsonKey(name: 'animals')\n";
      const fieldExpectedResult = 'final Pet? animals';
      final result = generator.generatePropertiesContent(
        map,
        map,
        {},
        className,
        <DefaultValueMap>[],
        false,
        [],
        [],
        [],
      );

      expect(result, contains(jsonKeyExpectedResult));
      expect(result, contains(fieldExpectedResult));
    });

    test('Should return property \$with', () {
      final map = <String, dynamic>{
        'with': <String, dynamic>{'originalRef': 'Pet'}
      };

      const className = 'Animals';
      const jsonKeyExpectedResult = "\t@JsonKey(name: '\$with')\n";
      const fieldExpectedResult = 'final Pet? \$with';
      final result = generator.generatePropertiesContent(
        map,
        map,
        {},
        className,
        <DefaultValueMap>[],
        false,
        [],
        [],
        [],
      );

      expect(result, contains(jsonKeyExpectedResult));
      expect(result, contains(fieldExpectedResult));
    });
  });

  group('generateListPropertyContent', () {
    test('Should return List<Object>', () {
      final map = <String, dynamic>{'items': null};
      const propertyName = 'dog';
      const className = 'Animals';
      const propertyKey = 'Dog';
      const jsonKeyExpectedResult =
          "@JsonKey(name: 'Dog', defaultValue: <Object>[])";

      const propertyExpectedResult = 'final List<Object>? dog';
      final result = generator.generateListPropertyContent(
        propertyName,
        propertyKey,
        className,
        map,
        false,
        [],
        [],
        {},
        [],
      );

      expect(result, contains(jsonKeyExpectedResult));
      expect(result, contains(propertyExpectedResult));
    });

    test('Should add fromJson and toJson', () {
      final map = <String, dynamic>{
        'items': {'originalRef': 'Dog'}
      };
      const propertyName = 'dog';
      const className = 'Animals';
      const propertyKey = 'Dog';
      final result = generator.generateListPropertyContent(
        propertyName,
        propertyKey,
        className,
        map,
        false,
        ['Dog'],
        [],
        {},
        [],
      );

      expect(
          result, contains('toJson: dogListToJson, fromJson: dogListFromJson'));
    });

    test('Should return List<Object>', () {
      final map = <String, dynamic>{
        'items': {'originalRef': 'TestOriginalRef'}
      };
      const propertyName = 'dog';
      const className = 'Animals';
      const propertyKey = 'Dog';

      final result = generator.generateListPropertyContent(
        propertyName,
        propertyKey,
        className,
        map,
        false,
        [],
        [],
        {},
        [],
      );

      expect(result, contains('final List<TestOriginalRef>? dog;'));
    });

    test('Should return List<Object> by ref', () {
      final map = <String, dynamic>{
        'items': {'\$ref': '#/definitions/TestObject'}
      };
      const propertyName = 'dog';
      const className = 'Animals';
      const propertyKey = 'Dog';

      final result = generator.generateListPropertyContent(
        propertyName,
        propertyKey,
        className,
        map,
        false,
        [],
        [],
        {},
        [],
      );

      expect(result, contains('final List<TestObject>? dog;'));
    });
  });

  group('generatePropertyContentByType', () {
    test('Should return property content by schema', () {
      final map = <String, String>{'type': 'enum'};
      const propertyName = 'dog';
      const className = 'Animals';
      const propertyKey = 'Dog';
      final result = generator.generatePropertyContentByType(
        map,
        propertyName,
        propertyKey,
        className,
        <DefaultValueMap>[],
        false,
        [],
        [],
        {},
        [],
      );

      expect(result,
          contains('toJson: animalsDogToJson, fromJson: animalsDogFromJson'));
    });

    test('Should return property content by schema', () {
      final map = <String, String>{'type': 'array'};
      const propertyName = 'dog';
      const className = 'Animals';
      const propertyKey = 'Dog';

      final result = generator.generatePropertyContentByType(
        map,
        propertyName,
        propertyKey,
        className,
        <DefaultValueMap>[],
        false,
        [],
        [],
        {},
        [],
      );

      expect(result, contains('final List<Object>? dog;'));
    });
  });

  group('Tests for getValidatedClassName', () {
    test('Should', () {
      final result = generator.getValidatedClassName('Request');

      expect(result, equals('Request\$'));
    });
  });

  group('Tests for generateGeneralPropertyContent', () {
    test('Should', () {
      final result = generator.generateGeneralPropertyContent(
        'name',
        'key',
        'className',
        [],
        {'\$ref': 'ClassNameName'},
        ['enums.ClassNameName'],
        [],
        [],
      );

      expect(result, contains('final enums.ClassNameName? name;'));
    });
  });

  group('Tests for generateResponses', () {
    test('Should generate empty string for V2', () {
      final map =
          jsonDecode(schemasResponsesWithResponse) as Map<String, dynamic>;
      final result = generator2.generateResponses(map, 'fileName');

      expect(result, equals(''));
    });

    test('Should generate class from responses V3', () {
      final map =
          jsonDecode(schemasResponsesWithResponse) as Map<String, dynamic>;
      final result = generator.generateResponses(map, 'fileName');

      expect(result, contains('class SpaResponse'));
    });

    test('Should generate class from responses V3 and Schemas', () {
      final map = jsonDecode(schemasResponsesWithResponseAndSchemas)
          as Map<String, dynamic>;
      final result = generator.generateResponses(map, 'fileName');

      expect(result, contains('class SpaResponse'));
    });
  });

  group('Tests for getAllEnumNames', () {
    test('Should', () {
      final map = jsonDecode(enumAsDefinitionV2) as Map<String, dynamic>;
      final result = generator2.getAllEnumNames(map);

      expect(result, contains('enums.SpaResponse'));
    });

    test('Should get enum name from schemas', () {
      final map =
          jsonDecode(schemasWithEnumsInProperties) as Map<String, dynamic>;
      final result = generator.getAllEnumNames(map);

      expect(result, contains('enums.SpaSchemaSuccessValues'));
    });

    test('Should get enum name from responses', () {
      final map =
          jsonDecode(schemasWithEnumsInProperties) as Map<String, dynamic>;
      final result = generator.getAllEnumNames(map);

      expect(result, contains('enums.SpaResponse'));
    });

    test('Should get enum name from responses with Enum items', () {
      final map =
          jsonDecode(schemasWithEnumsInProperties) as Map<String, dynamic>;
      final result = generator.getAllEnumNames(map);

      expect(result, contains('enums.SpaEnumResponseFailedValued'));
    });
  });

  group('Tests for getAllEnums', () {
    test('Should get enums with integer return types', () {
      final map = jsonDecode(schemasWithIntegers) as Map<String, dynamic>;
      final result = generator.getAllEnums(map);

      expect(
        result,
        contains(SwaggerEnum(name: 'enums.AccountType', isInteger: true)),
      );
    });

    test('Should get enums with integer return types in properties', () {
      final map = jsonDecode(schemasWithIntegers) as Map<String, dynamic>;
      final result = generator.getAllEnums(map);

      expect(
        result,
        contains(
          SwaggerEnum(name: 'enums.SpaSchemaSuccessValues', isInteger: true),
        ),
      );
    });

    test('Should get enums with integer return types in response', () {
      final map = jsonDecode(schemasWithIntegers) as Map<String, dynamic>;
      final result = generator.getAllEnums(map);

      expect(
        result,
        contains(
          SwaggerEnum(name: 'enums.SpaResponse', isInteger: true),
        ),
      );
    });

    test('Should get enums with integer return types in response properties',
        () {
      final map = jsonDecode(schemasWithIntegers) as Map<String, dynamic>;
      final result = generator.getAllEnums(map);

      expect(
        result,
        contains(
          SwaggerEnum(
            name: 'enums.SpaEnumResponseFailedValued',
            isInteger: true,
          ),
        ),
      );
    });
  });

  group('Tests allOf enums', () {
    test('Class properties should get enums. prefix', () {
      final map = jsonDecode(schemasWithEnumsFromAllOf) as Map<String, dynamic>;
      final result = generator.generateResponses(map, 'fileName');

      expect(result, contains('final enums.Success? success'));
    });
  });

  group('Tests for enum default values', () {
    test('Enums should have default values', () {
      final map = jsonDecode(schemasWithEnumsFromAllOf) as Map<String, dynamic>;
      final result = generator.generateResponses(map, 'fileName');

      expect(
        result,
        contains(
          '@JsonKey(name: \'success\', toJson: successToJson, fromJson: successFromJson, defaultValue: enums.Success.one)',
        ),
      );
    });

    test('Enum list should have default values', () {
      final map = jsonDecode(schemasWithEnumList) as Map<String, dynamic>;
      final result = generator.generateResponses(map, 'fileName');

      expect(
        result,
        contains(
          '@JsonKey(name: \'successes\', toJson: successListToJson, fromJson: successListFromJson, defaultValue: [enums.Success.one, enums.Success.two])',
        ),
      );
    });
  });

  group('Tests for models from responses', () {
    test('Should generate correct model from response', () {
      final map =
          jsonDecode(requestWithReturnTypeInjected) as Map<String, dynamic>;
      final result = generator.generate(map, 'my_service');

      expect(result, contains('class ModelItemsGet\$Response'));
    });
  });
}
