import 'package:swagger_dart_code_generator/src/code_generators/swagger_models_generator.dart';
import 'package:swagger_dart_code_generator/src/code_generators/v2/swagger_models_generator_v2.dart';
import 'package:swagger_dart_code_generator/src/code_generators/v3/swagger_models_generator_v3.dart';
import 'package:swagger_dart_code_generator/src/models/generator_options.dart';
import 'package:test/test.dart';
import '../code_examples.dart';

void main() {
  final generator = SwaggerModelsGeneratorV3();
  final generator2 = SwaggerModelsGeneratorV2();
  group('generate', () {
    const fileName = 'order_service.dart';

    test('Should parse object name as a field Type', () {
      final result = generator.generate(model_with_parameters_v3, fileName,
          GeneratorOptions(inputFolder: '', outputFolder: ''));

      expect(
          result, contains('final enums.TokensResponseTokenType? tokenType'));
    });

    test('Should generate .toLower() when caseSensitive: false', () {
      final result = generator.generate(
          model_with_parameters_v3,
          fileName,
          GeneratorOptions(
              enumsCaseSensitive: false, inputFolder: '', outputFolder: ''));

      expect(
          result,
          contains(
              'element.value.toLowerCase() == someEnumModel.toLowerCase()'));
    });

    test('Should NOT generate .toLower() when caseSensitive: false', () {
      final result = generator.generate(
          model_with_parameters_v3,
          fileName,
          GeneratorOptions(
              enumsCaseSensitive: true, inputFolder: '', outputFolder: ''));

      expect(result, contains('element.value == someEnumModel'));
    });

    test('Should parse object name as a field Type', () {
      final result = generator2.generate(model_with_parameters_v2, fileName,
          GeneratorOptions(inputFolder: '', outputFolder: ''));

      expect(
          result,
          contains(
              'final enums.ActiveOrderAndListSummaryShoppingType? shoppingType'));
    });

    test('Should parse object name as a field Type', () {
      const expectedResult = "@JsonKey(name: 'expires_in', defaultValue: 19)";
      final generatorOptions = GeneratorOptions(
        defaultValuesMap: <DefaultValueMap>[
          DefaultValueMap(
            typeName: 'int',
            defaultValue: '19',
          )
        ],
        inputFolder: '',
        outputFolder: '',
      );
      final result = generator.generate(
          model_with_parameters_v3, fileName, generatorOptions);

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
      final result = SwaggerModelsGenerator.generateFieldName(name);

      expect(result, contains(expectedResult));
    });

    test('Should return \$forbiddenFieldName', () {
      const name = '#';
      const expectedResult = '\$forbiddenFieldName';
      final result = SwaggerModelsGenerator.generateFieldName(name);

      expect(result, contains(expectedResult));
    });

    test('Should return \$null', () {
      const name = 'null';
      const expectedResult = '\$null';
      final result = SwaggerModelsGenerator.generateFieldName(name);

      expect(result, contains(expectedResult));
    });

    test('Should return \$number', () {
      const name = '5element';
      const expectedResult = '\$5element';
      final result = SwaggerModelsGenerator.generateFieldName(name);

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
          GeneratorOptions(inputFolder: '', outputFolder: ''));

      expect(result, contains(jsonKeyExpendedResult));
    });

    test('Should generate includeIfNull if option is true', () {
      final propertyEntryMap = <String, dynamic>{'originalRef': 'Pet'};
      const propertyName = 'shipDate';
      final result = generator.generatePropertyContentByDefault(
          propertyEntryMap,
          propertyName,
          [],
          [],
          GeneratorOptions(
              includeIfNull: false, inputFolder: '', outputFolder: ''));

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
          GeneratorOptions(
              includeIfNull: null, inputFolder: '', outputFolder: ''));

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
        GeneratorOptions(inputFolder: '', outputFolder: ''),
        {},
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
        GeneratorOptions(inputFolder: '', outputFolder: ''),
        {},
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
      final result = generator.generateEnumPropertyContent(key, className, [],
          [], GeneratorOptions(inputFolder: '', outputFolder: ''));

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
          className,
          map,
          {},
          <DefaultValueMap>[],
          useDefaultNullForLists,
          [],
          [],
          GeneratorOptions(inputFolder: '', outputFolder: ''));

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
          className,
          map,
          {},
          <DefaultValueMap>[],
          useDefaultNullForLists,
          [],
          [],
          GeneratorOptions(inputFolder: '', outputFolder: ''));

      expect(result, contains(classExpectedResult));
      expect(result, contains(factoryConstructorExpectedResult));
    });
  });

  group('generateConstructorPropertiesContent', () {
    test('Should return empty', () {
      const expectedResult = '';
      final result = generator.generateConstructorPropertiesContent(
        '',
        {},
        GeneratorOptions(inputFolder: '', outputFolder: ''),
        [],
        [],
        [],
      );

      expect(result, contains(expectedResult));
    });

    test('Should return validate constructor property', () {
      final map = <String, dynamic>{
        'Animal': {'type': 'dog'}
      };
      const expectedResult = 'this.animal';
      final result = generator.generateConstructorPropertiesContent(
        '',
        map,
        GeneratorOptions(inputFolder: '', outputFolder: ''),
        [],
        [],
        [],
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
        GeneratorOptions(inputFolder: '', outputFolder: ''),
        {},
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
        GeneratorOptions(inputFolder: '', outputFolder: ''),
        {},
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
          {},
          className,
          <DefaultValueMap>[],
          false,
          [],
          [],
          GeneratorOptions(inputFolder: '', outputFolder: ''));

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
          {},
          className,
          <DefaultValueMap>[],
          false,
          [],
          [],
          GeneratorOptions(inputFolder: '', outputFolder: ''));

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
          {},
          className,
          <DefaultValueMap>[],
          false,
          [],
          [],
          GeneratorOptions(inputFolder: '', outputFolder: ''));

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
          {},
          className,
          <DefaultValueMap>[],
          false,
          [],
          [],
          GeneratorOptions(inputFolder: '', outputFolder: ''));

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
        GeneratorOptions(inputFolder: '', outputFolder: ''),
        {},
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
        GeneratorOptions(inputFolder: '', outputFolder: ''),
        {},
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
        GeneratorOptions(inputFolder: '', outputFolder: ''),
        {},
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
        GeneratorOptions(inputFolder: '', outputFolder: ''),
        {},
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
        GeneratorOptions(inputFolder: '', outputFolder: ''),
        {},
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
        GeneratorOptions(inputFolder: '', outputFolder: ''),
        {},
      );

      expect(result, contains('final List<Object>? dog;'));
    });
  });

  group('getModelInheritedProperties', () {
    test('Should generate 2 levels of inheritance', () {
      final result = generator.generate(model_with_inheritance, 'MyClass',
          GeneratorOptions(inputFolder: '', outputFolder: ''));

      expect(
          result, contains('class ExtendedErrorModel extends BasicErrorModel'));
    });

    test('Should generate 3 levels of inheritance', () {
      final result = generator.generate(model_with_inheritance_3_levels,
          'MyClass', GeneratorOptions(inputFolder: '', outputFolder: ''));

      expect(result,
          contains('class MostExtendedErrorModel extends ExtendedErrorModel'));

      expect(
          result, contains('class ExtendedErrorModel extends BasicErrorModel'));
    });
  });

  group('Tests for getValidatedClassName', () {
    test('Should', () {
      final result = SwaggerModelsGenerator.getValidatedClassName('Request');

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
          GeneratorOptions(inputFolder: '', outputFolder: ''));

      expect(result, contains('final enums.ClassNameName? name;'));
    });
  });

  group('Tests for generateResponses', () {
    test('Should generate empty string for V2', () {
      final result = generator2.generateResponses(
          schemas_responses_with_response,
          'fileName',
          GeneratorOptions(inputFolder: '', outputFolder: ''));

      expect(result, equals(''));
    });

    test('Should generate class from responses V3', () {
      final result = generator.generateResponses(
          schemas_responses_with_response,
          'fileName',
          GeneratorOptions(inputFolder: '', outputFolder: ''));

      expect(result, contains('class SpaResponse'));
    });

    test('Should generate class from responses V3 and Schemas', () {
      final result = generator.generateResponses(
          schemas_responses_with_response_and_schemas,
          'fileName',
          GeneratorOptions(
            inputFolder: '',
            outputFolder: '',
          ));

      expect(result, contains('class SpaResponse'));
    });
  });

  group('Tests for getAllEnumNames', () {
    test('Should', () {
      final result = generator2.getAllEnumNames(enum_as_definition_v2);

      expect(result, contains('enums.SpaResponse'));
    });

    test('Should get enum name from schemas', () {
      final result =
          generator.getAllEnumNames(schemas_with_enums_in_properties);

      expect(result, contains('enums.SpaSchemaSuccessValues'));
    });

    test('Should get enum name from responses', () {
      final result =
          generator.getAllEnumNames(schemas_with_enums_in_properties);

      expect(result, contains('enums.SpaResponse'));
    });

    test('Should get enum name from responses with Enum items', () {
      final result =
          generator.getAllEnumNames(schemas_with_enums_in_properties);

      expect(result, contains('enums.SpaEnumResponseFailedValued'));
    });
  });
  group('Tests for models from responses', () {
    test('Should generate correct model from response', () {
      final result = generator.generate(
          request_with_return_type_injected,
          'my_service',
          GeneratorOptions(
            inputFolder: '',
            outputFolder: '',
          ));

      expect(result, contains('class ModelItemsGet\$Response'));
    });
  });
}
