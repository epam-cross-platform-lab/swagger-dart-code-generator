import 'package:swagger_generator/src/code_generators/v3/swagger_models_generator_v3.dart';
import 'package:swagger_generator/src/models/generator_options.dart';
import 'package:test/test.dart';
import '../code_examples.dart';

void main() {
  group('generate', () {
    final SwaggerModelsGeneratorV3 _generator = SwaggerModelsGeneratorV3();
    const String _fileName = 'order_service.dart';

    test('Should parse object name as a field Type', () {
      final String result = _generator.generate(
          model_with_parameters_v3, _fileName, GeneratorOptions());

      expect(result, contains('final TokensResponseToken_type tokenType'));
    });

    test('Should parse object name as a field Type', () {
      const String expectedResult =
          "@JsonKey(name: 'expires_in', defaultValue: 19)";
      final GeneratorOptions generatorOptions =
          GeneratorOptions(defaultValuesMap: <DefaultValueMap>[
        DefaultValueMap(
          typeName: 'int',
          defaultValue: '19',
        )
      ]);
      final String result = _generator.generate(
          model_with_parameters_v3, _fileName, generatorOptions);

      expect(result, contains(expectedResult));
    });
  });

  group('generateEnumName', () {
    final SwaggerModelsGeneratorV3 _generator = SwaggerModelsGeneratorV3();

    test('Should generate enum name', () {
      const String _className = 'animal';
      const String _enumName = 'cat';
      const String _expectedResult = 'AnimalCat';
      final String result = _generator.generateEnumName(_className, _enumName);

      expect(result, contains(_expectedResult));
    });
  });

  group('generateDefaultValueFromMap', () {
    final SwaggerModelsGeneratorV3 _generator = SwaggerModelsGeneratorV3();
    test('Should return default value', () {
      const String _defaultValue = 'true';
      const String _typeName = 'bool';
      const String _expectedResult = 'true';
      final String result = _generator.generateDefaultValueFromMap(
          DefaultValueMap(defaultValue: _defaultValue, typeName: _typeName));

      expect(result, contains(_expectedResult));
    });

    test('Should return default from switch', () {
      const String _defaultValue = 'Animal';
      const String _typeName = 'Object';
      const String _expectedResult = 'Animal';
      final String result = _generator.generateDefaultValueFromMap(
          DefaultValueMap(defaultValue: _defaultValue, typeName: _typeName));

      expect(result, contains(_expectedResult));
    });
  });

  group('getParameterTypeName', () {
    final SwaggerModelsGeneratorV3 _generator = SwaggerModelsGeneratorV3();
    test('Should return validate parameter type name', () {
      const String _className = 'Animal';
      const String _parameterName = 'orderId';
      const Map<String, dynamic> _parameter = <String, dynamic>{
        'type': 'object'
      };
      const String _expectedResult = 'Object';
      final String result = _generator.getParameterTypeName(
          _className, _parameterName, _parameter);

      expect(result, contains(_expectedResult));
    });

    test('Should return Object, because we dont jave map[items]', () {
      const String _className = 'Animal';
      const String _parameterName = 'orderId';
      const Map<String, dynamic> _parameter = <String, dynamic>{
        'type': 'array'
      };
      const String _expectedResult = 'Object';
      final String result = _generator.getParameterTypeName(
          _className, _parameterName, _parameter);

      expect(result, contains(_expectedResult));
    });

    test('Should return Object, because we have map[oneOf]', () {
      const String _className = 'Animal';
      const String _parameterName = 'orderId';
      const Map<String, dynamic> _parameter = <String, dynamic>{
        'oneOf': 'animals'
      };
      const String _expectedResult = 'Object';
      final String result = _generator.getParameterTypeName(
          _className, _parameterName, _parameter);

      expect(result, contains(_expectedResult));
    });

    test('Should return Object', () {
      const String _className = 'Animal';
      const String _parameterName = 'orderId';
      const String _expectedResult = 'Object';
      final String result =
          _generator.getParameterTypeName(_className, _parameterName, null);

      expect(result, contains(_expectedResult));
    });

    test('Should return validate parameter type name', () {
      const String _className = 'Animal';
      const String _parameterName = 'orderId';
      const Map<String, dynamic> _parameter = <String, dynamic>{
        '\$ref': '#/definitions/Pet'
      };
      const String _expectedResult = 'Pet';
      final String result = _generator.getParameterTypeName(
          _className, _parameterName, _parameter);

      expect(result, contains(_expectedResult));
    });

    test('Should return optional name parameter', () {
      const String _className = 'Animal';
      const String _parameterName = 'orderId';
      const String _refNameParameter = 'animals_Object';
      const String _expectedResult = 'AnimalsObject';
      final String result = _generator.getParameterTypeName(
          _className, _parameterName, null, _refNameParameter);

      expect(result, contains(_expectedResult));
    });

    test('Should return DateTime', () {
      const String _className = 'Animal';
      const String _parameterName = 'orderId';
      const Map<String, dynamic> _parameter = <String, dynamic>{
        'type': 'string',
        'format': 'date-time'
      };
      const String _expectedResult = 'DateTime';
      final String result = _generator.getParameterTypeName(
          _className, _parameterName, _parameter);

      expect(result, contains(_expectedResult));
    });
  });

  group('getEnumFieldName', () {
    final SwaggerModelsGeneratorV3 _generator = SwaggerModelsGeneratorV3();

    test('Should return validate enum field name', () {
      const String _name = 'cat-dog_ Cars';
      const String _expectedResult = 'catDogCars';
      final String result = _generator.getEnumFieldName(_name);

      expect(result, contains(_expectedResult));
    });

    test('Should return validate enum field name without forbidden symbols',
        () {
      const String _name = 'cat,dog..Cars';
      const String _expectedResult = 'catDogCars';
      final String result = _generator.getEnumFieldName(_name);

      expect(result, contains(_expectedResult));
    });

    test('Should return \$validateEnumFieldName', () {
      const String _name = '55element';
      const String _expectedResult = '\$55element';
      final String result = _generator.getEnumFieldName(_name);

      expect(result, contains(_expectedResult));
    });

    test('Should return \$with', () {
      const String _name = 'with';
      const String _expectedResult = '\$with';
      final String result = _generator.getEnumFieldName(_name);

      expect(result, contains(_expectedResult));
    });
  });

  group('generateFieldName', () {
    final SwaggerModelsGeneratorV3 _generator = SwaggerModelsGeneratorV3();

    test('Should return validate field name', () {
      const String _name = 'Cat_Dog-Animals';
      const String _expectedResult = 'catDogAnimals';
      final String result = _generator.generateFieldName(_name);

      expect(result, contains(_expectedResult));
    });

    test('Should return \$forbiddenFieldName', () {
      const String _name = '#';
      const String _expectedResult = '\$forbiddenFieldName';
      final String result = _generator.generateFieldName(_name);

      expect(result, contains(_expectedResult));
    });

    test('Should return \$null', () {
      const String _name = 'null';
      const String _expectedResult = '\$null';
      final String result = _generator.generateFieldName(_name);

      expect(result, contains(_expectedResult));
    });

    test('Should return \$number', () {
      const String _name = '5element';
      const String _expectedResult = '\$5element';
      final String result = _generator.generateFieldName(_name);

      expect(result, contains(_expectedResult));
    });
  });

  group('generatePropertyContentByDefault', () {
    final SwaggerModelsGeneratorV3 _generator = SwaggerModelsGeneratorV3();
    test('Should return property with JsonKey', () {
      final Map<String, dynamic> _propertyEntryMap = <String, dynamic>{
        'originalRef': 'Pet'
      };
      const String _propertyName = 'shipDate';
      const String _jsonKeyExpendedResult = "@JsonKey(name: '$_propertyName'";
      final String _expectedResult =
          "\t$_jsonKeyExpendedResult)\n  final ${_propertyEntryMap['originalRef']} $_propertyName;";

      final String result = _generator.generatePropertyContentByDefault(
        _propertyEntryMap,
        _propertyName,
      );

      expect(result, contains(_jsonKeyExpendedResult));
      expect(result, contains(_expectedResult));
    });
  });

  group('generatePropertyContentByRef', () {
    final SwaggerModelsGeneratorV3 _generator = SwaggerModelsGeneratorV3();
    test('Should return property with JsonKey', () {
      final Map<String, dynamic> _propertyEntryMap = <String, dynamic>{
        '\$ref': '#/definitions/Pet'
      };
      const String _propertyName = 'shipDate';
      const String _propertyKey = 'shipDateGet';
      const String _className = 'Animals';
      const String _jsonKeyExpendedResult = "@JsonKey(name: '$_propertyKey'";
      const String _expectedResult =
          "\t$_jsonKeyExpendedResult)\n  final Pet $_propertyName;";

      final String result = _generator.generatePropertyContentByRef(
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
    final SwaggerModelsGeneratorV3 _generator = SwaggerModelsGeneratorV3();
    test('Should return enum values', () {
      final List<String> list = <String>['Cats', 'dogs', 'Forgs'];
      const String _expectedResult = "\t@JsonValue('Cats')\n  cats";
      final String result = _generator.generateEnumValuesContent(list);

      expect(result, contains(_expectedResult));
    });
  });

  group('generateEnumPropertyContent', () {
    final SwaggerModelsGeneratorV3 _generator = SwaggerModelsGeneratorV3();
    test('Should return enum property with JsonKey', () {
      // ignore: prefer_const_declarations
      final String key = 'dog';
      const String className = 'animals';
      const String _jsonKeyExpectedResult =
          '@JsonKey(unknownEnumValue: AnimalsDog.swaggerGeneratedUnknown)';
      const String _expectedResult = 'final AnimalsDog dog;';
      final String result =
          _generator.generateEnumPropertyContent(key, className);

      expect(result, contains(_jsonKeyExpectedResult));
      expect(result, contains(_expectedResult));
    });
  });

  group('generateModelClassContent', () {
    final SwaggerModelsGeneratorV3 _generator = SwaggerModelsGeneratorV3();
    test('Should return model class content', () {
      const Map<String, dynamic> map = <String, dynamic>{};
      const String className = 'Animals';
      const bool useDefaultNullForLists = false;
      const String _classExpectedResult = 'class Animals{';
      const String _factoryConstructorExpectedResult =
          '\tfactory Animals.fromJson(Map<String, dynamic> json) => _\$AnimalsFromJson(json);\n';
      final String result = _generator.generateModelClassContent(
          className, map, <DefaultValueMap>[], useDefaultNullForLists);

      expect(result, contains(_classExpectedResult));
      expect(result, contains(_factoryConstructorExpectedResult));
    });
  });

  group('generateConstructorPropertiesContent', () {
    final SwaggerModelsGeneratorV3 _generator = SwaggerModelsGeneratorV3();
    test('Should return empty', () {
      const String expectedResult = '';
      final String result =
          _generator.generateConstructorPropertiesContent(null);

      expect(result, contains(expectedResult));
    });

    test('Should return validate constructor property', () {
      final Map<String, dynamic> map = <String, dynamic>{'Animal': 'dog'};
      const String expectedResult = 'this.animal';
      final String result =
          _generator.generateConstructorPropertiesContent(map);

      expect(result, contains(expectedResult));
    });
  });

  group('generatePropertyContentBySchema', () {
    final SwaggerModelsGeneratorV3 _generator = SwaggerModelsGeneratorV3();
    test('Should return property content by schema', () {
      final Map<String, dynamic> map = <String, dynamic>{
        'schema': <String, dynamic>{'\$ref': '#/definitions/Pet'}
      };
      const String propertyName = 'dog';
      const String className = 'Animals';
      const String propertyKey = 'Dog';
      const String _jsonKeyExpectedResult = "\t@JsonKey(name: 'Dog')\n";
      const String _fieldExpectedResult = '\tfinal Pet dog';
      final String result = _generator.generatePropertyContentBySchema(
          map, propertyName, propertyKey, className);

      expect(result, contains(_jsonKeyExpectedResult));
      expect(result, contains(_fieldExpectedResult));
    });
  });

  group('generatePropertiesContent', () {
    final SwaggerModelsGeneratorV3 _generator = SwaggerModelsGeneratorV3();
    test('Should return properties from ref', () {
      final Map<String, dynamic> map = <String, dynamic>{
        'Animals': <String, dynamic>{'\$ref': '#/definitions/Pet'}
      };
      const String className = 'Animals';
      const String _jsonKeyExpectedResult = "\t@JsonKey(name: 'Animals')\n";
      const String _fieldExpectedResult = 'final Pet animals';
      final String result = _generator.generatePropertiesContent(
          map, className, <DefaultValueMap>[], false);

      expect(result, contains(_jsonKeyExpectedResult));
      expect(result, contains(_fieldExpectedResult));
    });

    test('Should return properties from schema', () {
      final Map<String, dynamic> map = <String, dynamic>{
        'Animals': <String, dynamic>{
          'schema': <String, dynamic>{'\$ref': '#/definitions/Pet'}
        }
      };

      const String className = 'Animals';
      const String _jsonKeyExpectedResult = "\t@JsonKey(name: 'Animals')\n";
      const String _fieldExpectedResult = 'final Pet animals';
      final String result = _generator.generatePropertiesContent(
          map, className, <DefaultValueMap>[], false);

      expect(result, contains(_jsonKeyExpectedResult));
      expect(result, contains(_fieldExpectedResult));
    });

    test('Should return properties from default originalRef', () {
      final Map<String, dynamic> map = <String, dynamic>{
        'Animals': <String, dynamic>{'originalRef': 'Pet'}
      };

      const String className = 'Animals';
      const String _jsonKeyExpectedResult = "\t@JsonKey(name: 'Animals')\n";
      const String _fieldExpectedResult = 'final Pet animals';
      final String result = _generator.generatePropertiesContent(
          map, className, <DefaultValueMap>[], false);

      expect(result, contains(_jsonKeyExpectedResult));
      expect(result, contains(_fieldExpectedResult));
    });

    test('Should return property \$with', () {
      final Map<String, dynamic> map = <String, dynamic>{
        'with': <String, dynamic>{'originalRef': 'Pet'}
      };

      const String className = 'Animals';
      const String _jsonKeyExpectedResult = "\t@JsonKey(name: '\$with')\n";
      const String _fieldExpectedResult = 'final Pet \$with';
      final String result = _generator.generatePropertiesContent(
          map, className, <DefaultValueMap>[], false);

      expect(result, contains(_jsonKeyExpectedResult));
      expect(result, contains(_fieldExpectedResult));
    });
  });

  group('generateListPropertyContent', () {
    final SwaggerModelsGeneratorV3 _generator = SwaggerModelsGeneratorV3();
    test('Should return List<Object>', () {
      final Map<String, dynamic> map = <String, dynamic>{'items': null};
      const String propertyName = 'dog';
      const String className = 'Animals';
      const String propertyKey = 'Dog';
      const String _jsonKeyExpectedResult =
          "@JsonKey(name: 'Dog', defaultValue: <Object>[])";

      const String _propertyExpectedResult = 'final List<Object> dog';
      final String result = _generator.generateListPropertyContent(
          propertyName, propertyKey, className, map, false);

      expect(result, contains(_jsonKeyExpectedResult));
      expect(result, contains(_propertyExpectedResult));
    });
  });

  group('generatePropertyContentByType', () {
    final SwaggerModelsGeneratorV3 _generator = SwaggerModelsGeneratorV3();
    test('Should return property content by schema', () {
      final Map<String, String> map = <String, String>{'type': 'enum'};
      const String propertyName = 'dog';
      const String className = 'Animals';
      const String propertyKey = 'Dog';
      const String _jsonKeyExpectedResult =
          '@JsonKey(unknownEnumValue: AnimalsDog.swaggerGeneratedUnknown)';

      const String _propertyExpectedResult = 'final AnimalsDog dog';
      final String result = _generator.generatePropertyContentByType(map,
          propertyName, propertyKey, className, <DefaultValueMap>[], false);

      expect(result, contains(_jsonKeyExpectedResult));
      expect(result, contains(_propertyExpectedResult));
    });
  });
}
