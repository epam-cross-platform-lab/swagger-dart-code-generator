import 'package:swagger_dart_code_generator/src/code_generators/v3/swagger_models_generator_v3.dart';
import 'package:swagger_dart_code_generator/src/models/generator_options.dart';
import 'package:test/test.dart';
import '../code_examples.dart';

void main() {
  group('generate', () {
    final _generator = SwaggerModelsGeneratorV3();
    const _fileName = 'order_service.dart';

    test('Should parse object name as a field Type', () {
      final result = _generator.generate(
          model_with_parameters_v3, _fileName, GeneratorOptions());

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
      final result = _generator.generate(
          model_with_parameters_v3, _fileName, generatorOptions);

      expect(result, contains(expectedResult));
    });
  });

  group('generateEnumName', () {
    final _generator = SwaggerModelsGeneratorV3();

    test('Should generate enum name', () {
      const _className = 'animal';
      const _enumName = 'cat';
      const _expectedResult = 'AnimalCat';
      final result = _generator.generateEnumName(_className, _enumName);

      expect(result, contains(_expectedResult));
    });
  });

  group('generateDefaultValueFromMap', () {
    final _generator = SwaggerModelsGeneratorV3();
    test('Should return default value', () {
      const _defaultValue = 'true';
      const _typeName = 'bool';
      const _expectedResult = 'true';
      final result = _generator.generateDefaultValueFromMap(
          DefaultValueMap(defaultValue: _defaultValue, typeName: _typeName));

      expect(result, contains(_expectedResult));
    });

    test('Should return default from switch', () {
      const _defaultValue = 'Animal';
      const _typeName = 'Object';
      const _expectedResult = 'Animal';
      final result = _generator.generateDefaultValueFromMap(
          DefaultValueMap(defaultValue: _defaultValue, typeName: _typeName));

      expect(result, contains(_expectedResult));
    });
  });

  group('getParameterTypeName', () {
    final _generator = SwaggerModelsGeneratorV3();
    test('Should return validate parameter type name', () {
      const _className = 'Animal';
      const _parameterName = 'orderId';
      const _parameter = <String, dynamic>{'type': 'object'};
      const _expectedResult = 'Object';
      final result = _generator.getParameterTypeName(
          _className, _parameterName, _parameter);

      expect(result, contains(_expectedResult));
    });

    test('Should return Object, because we dont jave map[items]', () {
      const _className = 'Animal';
      const _parameterName = 'orderId';
      const _parameter = <String, dynamic>{'type': 'array'};
      const _expectedResult = 'Object';
      final result = _generator.getParameterTypeName(
          _className, _parameterName, _parameter);

      expect(result, contains(_expectedResult));
    });

    test('Should return Object, because we have map[oneOf]', () {
      const _className = 'Animal';
      const _parameterName = 'orderId';
      const _parameter = <String, dynamic>{'oneOf': 'animals'};
      const _expectedResult = 'Object';
      final result = _generator.getParameterTypeName(
          _className, _parameterName, _parameter);

      expect(result, contains(_expectedResult));
    });

    test('Should return Object', () {
      const _className = 'Animal';
      const _parameterName = 'orderId';
      const _expectedResult = 'Object';
      final result =
          _generator.getParameterTypeName(_className, _parameterName, null);

      expect(result, contains(_expectedResult));
    });

    test('Should return validate parameter type name', () {
      const _className = 'Animal';
      const _parameterName = 'orderId';
      const _parameter = <String, dynamic>{'\$ref': '#/definitions/Pet'};
      const _expectedResult = 'Pet';
      final result = _generator.getParameterTypeName(
          _className, _parameterName, _parameter);

      expect(result, contains(_expectedResult));
    });

    test('Should return optional name parameter', () {
      const _className = 'Animal';
      const _parameterName = 'orderId';
      const _refNameParameter = 'animals_Object';
      const _expectedResult = 'AnimalsObject';
      final result = _generator.getParameterTypeName(
          _className, _parameterName, null, _refNameParameter);

      expect(result, contains(_expectedResult));
    });

    test('Should return DateTime', () {
      const _className = 'Animal';
      const _parameterName = 'orderId';
      const _parameter = <String, dynamic>{
        'type': 'string',
        'format': 'date-time'
      };
      const _expectedResult = 'DateTime';
      final result = _generator.getParameterTypeName(
          _className, _parameterName, _parameter);

      expect(result, contains(_expectedResult));
    });
  });

  group('getEnumFieldName', () {
    final _generator = SwaggerModelsGeneratorV3();

    test('Should return validate enum field name', () {
      const _name = 'cat-dog_ Cars';
      const _expectedResult = 'catDogCars';
      final result = _generator.getEnumFieldName(_name);

      expect(result, contains(_expectedResult));
    });

    test('Should return validate enum field name without forbidden symbols',
        () {
      const _name = 'cat,dog..Cars';
      const _expectedResult = 'catDogCars';
      final result = _generator.getEnumFieldName(_name);

      expect(result, contains(_expectedResult));
    });

    test('Should return \$validateEnumFieldName', () {
      const _name = '55element';
      const _expectedResult = '\$55element';
      final result = _generator.getEnumFieldName(_name);

      expect(result, contains(_expectedResult));
    });

    test('Should return \$with', () {
      const _name = 'with';
      const _expectedResult = '\$with';
      final result = _generator.getEnumFieldName(_name);

      expect(result, contains(_expectedResult));
    });
  });

  group('generateFieldName', () {
    final _generator = SwaggerModelsGeneratorV3();

    test('Should return validate field name', () {
      const _name = 'Cat_Dog-Animals';
      const _expectedResult = 'catDogAnimals';
      final result = _generator.generateFieldName(_name);

      expect(result, contains(_expectedResult));
    });

    test('Should return \$forbiddenFieldName', () {
      const _name = '#';
      const _expectedResult = '\$forbiddenFieldName';
      final result = _generator.generateFieldName(_name);

      expect(result, contains(_expectedResult));
    });

    test('Should return \$null', () {
      const _name = 'null';
      const _expectedResult = '\$null';
      final result = _generator.generateFieldName(_name);

      expect(result, contains(_expectedResult));
    });

    test('Should return \$number', () {
      const _name = '5element';
      const _expectedResult = '\$5element';
      final result = _generator.generateFieldName(_name);

      expect(result, contains(_expectedResult));
    });
  });

  group('generatePropertyContentByDefault', () {
    final _generator = SwaggerModelsGeneratorV3();
    test('Should return property with JsonKey', () {
      final _propertyEntryMap = <String, dynamic>{'originalRef': 'Pet'};
      const _propertyName = 'shipDate';
      const _jsonKeyExpendedResult = "@JsonKey(name: '$_propertyName'";
      final _expectedResult =
          "\t$_jsonKeyExpendedResult)\n  final ${_propertyEntryMap['originalRef']} $_propertyName;";

      final result = _generator.generatePropertyContentByDefault(
        _propertyEntryMap,
        _propertyName,
      );

      expect(result, contains(_jsonKeyExpendedResult));
      expect(result, contains(_expectedResult));
    });
  });

  group('generatePropertyContentByRef', () {
    final _generator = SwaggerModelsGeneratorV3();
    test('Should return property with JsonKey', () {
      final _propertyEntryMap = <String, dynamic>{'\$ref': '#/definitions/Pet'};
      const _propertyName = 'shipDate';
      const _propertyKey = 'shipDateGet';
      const _className = 'Animals';
      const _jsonKeyExpendedResult = "@JsonKey(name: '$_propertyKey'";
      const _expectedResult =
          '\t$_jsonKeyExpendedResult)\n  final Pet $_propertyName;';

      final result = _generator.generatePropertyContentByRef(
        _propertyEntryMap,
        _propertyName,
        _propertyKey,
        _className,
      );

      expect(result, contains(_jsonKeyExpendedResult));
      expect(result, contains(_expectedResult));
    });
  });

  group('generateEnumValuesContent', () {
    final _generator = SwaggerModelsGeneratorV3();
    test('Should return enum values', () {
      final list = <String>['Cats', 'dogs', 'Forgs'];
      const _expectedResult = "\t@JsonValue('Cats')\n  cats";
      final result = _generator.generateEnumValuesContent(list);

      expect(result, contains(_expectedResult));
    });
  });

  group('generateEnumPropertyContent', () {
    final _generator = SwaggerModelsGeneratorV3();
    test('Should return enum property with JsonKey', () {
      // ignore: prefer_const_declarations
      final key = 'dog';
      const className = 'animals';
      const _jsonKeyExpectedResult =
          '@JsonKey(unknownEnumValue: AnimalsDog.swaggerGeneratedUnknown)';
      const _expectedResult = 'final AnimalsDog dog;';
      final result = _generator.generateEnumPropertyContent(key, className);

      expect(result, contains(_jsonKeyExpectedResult));
      expect(result, contains(_expectedResult));
    });
  });

  group('generateModelClassContent', () {
    final _generator = SwaggerModelsGeneratorV3();
    test('Should return model class content', () {
      const map = <String, dynamic>{};
      const className = 'Animals';
      const useDefaultNullForLists = false;
      const _classExpectedResult = 'class Animals{';
      const _factoryConstructorExpectedResult =
          '\tfactory Animals.fromJson(Map<String, dynamic> json) => _\$AnimalsFromJson(json);\n';
      final result = _generator.generateModelClassContent(
          className, map, <DefaultValueMap>[], useDefaultNullForLists);

      expect(result, contains(_classExpectedResult));
      expect(result, contains(_factoryConstructorExpectedResult));
    });
  });

  group('generateConstructorPropertiesContent', () {
    final _generator = SwaggerModelsGeneratorV3();
    test('Should return empty', () {
      const expectedResult = '';
      final result = _generator.generateConstructorPropertiesContent(null);

      expect(result, contains(expectedResult));
    });

    test('Should return validate constructor property', () {
      final map = <String, dynamic>{'Animal': 'dog'};
      const expectedResult = 'this.animal';
      final result = _generator.generateConstructorPropertiesContent(map);

      expect(result, contains(expectedResult));
    });
  });

  group('generatePropertyContentBySchema', () {
    final _generator = SwaggerModelsGeneratorV3();
    test('Should return property content by schema', () {
      final map = <String, dynamic>{
        'schema': <String, dynamic>{'\$ref': '#/definitions/Pet'}
      };
      const propertyName = 'dog';
      const className = 'Animals';
      const propertyKey = 'Dog';
      const _jsonKeyExpectedResult = "\t@JsonKey(name: 'Dog')\n";
      const _fieldExpectedResult = '\tfinal Pet dog';
      final result = _generator.generatePropertyContentBySchema(
          map, propertyName, propertyKey, className);

      expect(result, contains(_jsonKeyExpectedResult));
      expect(result, contains(_fieldExpectedResult));
    });
  });

  group('generatePropertiesContent', () {
    final _generator = SwaggerModelsGeneratorV3();
    test('Should return properties from ref', () {
      final map = <String, dynamic>{
        'Animals': <String, dynamic>{'\$ref': '#/definitions/Pet'}
      };
      const className = 'Animals';
      const _jsonKeyExpectedResult = "\t@JsonKey(name: 'Animals')\n";
      const _fieldExpectedResult = 'final Pet animals';
      final result = _generator.generatePropertiesContent(
          map, className, <DefaultValueMap>[], false);

      expect(result, contains(_jsonKeyExpectedResult));
      expect(result, contains(_fieldExpectedResult));
    });

    test('Should return properties from schema', () {
      final map = <String, dynamic>{
        'Animals': <String, dynamic>{
          'schema': <String, dynamic>{'\$ref': '#/definitions/Pet'}
        }
      };

      const className = 'Animals';
      const _jsonKeyExpectedResult = "\t@JsonKey(name: 'Animals')\n";
      const _fieldExpectedResult = 'final Pet animals';
      final result = _generator.generatePropertiesContent(
          map, className, <DefaultValueMap>[], false);

      expect(result, contains(_jsonKeyExpectedResult));
      expect(result, contains(_fieldExpectedResult));
    });

    test('Should return properties from default originalRef', () {
      final map = <String, dynamic>{
        'Animals': <String, dynamic>{'originalRef': 'Pet'}
      };

      const className = 'Animals';
      const _jsonKeyExpectedResult = "\t@JsonKey(name: 'Animals')\n";
      const _fieldExpectedResult = 'final Pet animals';
      final result = _generator.generatePropertiesContent(
          map, className, <DefaultValueMap>[], false);

      expect(result, contains(_jsonKeyExpectedResult));
      expect(result, contains(_fieldExpectedResult));
    });

    test('Should return property \$with', () {
      final map = <String, dynamic>{
        'with': <String, dynamic>{'originalRef': 'Pet'}
      };

      const className = 'Animals';
      const _jsonKeyExpectedResult = "\t@JsonKey(name: '\$with')\n";
      const _fieldExpectedResult = 'final Pet \$with';
      final result = _generator.generatePropertiesContent(
          map, className, <DefaultValueMap>[], false);

      expect(result, contains(_jsonKeyExpectedResult));
      expect(result, contains(_fieldExpectedResult));
    });
  });

  group('generateListPropertyContent', () {
    final _generator = SwaggerModelsGeneratorV3();
    test('Should return List<Object>', () {
      final map = <String, dynamic>{'items': null};
      const propertyName = 'dog';
      const className = 'Animals';
      const propertyKey = 'Dog';
      const _jsonKeyExpectedResult =
          "@JsonKey(name: 'Dog', defaultValue: <Object>[])";

      const _propertyExpectedResult = 'final List<Object> dog';
      final result = _generator.generateListPropertyContent(
          propertyName, propertyKey, className, map, false);

      expect(result, contains(_jsonKeyExpectedResult));
      expect(result, contains(_propertyExpectedResult));
    });
  });

  group('generatePropertyContentByType', () {
    final _generator = SwaggerModelsGeneratorV3();
    test('Should return property content by schema', () {
      final map = <String, String>{'type': 'enum'};
      const propertyName = 'dog';
      const className = 'Animals';
      const propertyKey = 'Dog';
      const jsonKeyExpectedResult =
          '@JsonKey(unknownEnumValue: AnimalsDog.swaggerGeneratedUnknown)';

      const propertyExpectedResult = 'final AnimalsDog dog';
      final result = _generator.generatePropertyContentByType(map, propertyName,
          propertyKey, className, <DefaultValueMap>[], false);

      expect(result, contains(jsonKeyExpectedResult));
      expect(result, contains(propertyExpectedResult));
    });
  });
}
