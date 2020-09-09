import 'package:swagger_generator/src/code_generators/v2/swagger_models_generator_v2.dart';
import 'package:swagger_generator/src/models/generator_options.dart';
import 'package:test/test.dart';
import 'code_examples.dart';

void main() {
  group('generate', () {
    final _generator = SwaggerModelsGeneratorV2();
    final _fileName = 'order_service.dart';

    test('Should parse object name as a field Type', () {
      final result = _generator.generate(
          model_with_parameters, _fileName, GeneratorOptions());

      expect(result, contains("final DeliveryDto deliveryDate"));
    });

    test('Should parse object name as a field Type', () {
      final String expectedResult = "@JsonKey(name: 'id', defaultValue: 19)";
      final result = _generator.generate(
          model_with_parameters,
          _fileName,
          GeneratorOptions(defaultValuesMap: [
            DefaultValueMap(
              typeName: "int",
              defaultValue: "19",
            )
          ]));

      expect(result, contains(expectedResult));
    });
  });

  group('generateEnumName', () {
    final _generator = SwaggerModelsGeneratorV2();

    test('Should generate enum name', () {
      String _className = "animal";
      String _enumName = "cat";
      String _expectedResult = "AnimalCat";
      final result = _generator.generateEnumName(_className, _enumName);

      expect(result, contains(_expectedResult));
    });
  });

  group('generateDefaultValueFromMap', () {
    final _generator = SwaggerModelsGeneratorV2();
    test('Should return default value', () {
      String _defaultValue = "true";
      String _typeName = "bool";
      String _expectedResult = "true";
      final String result = _generator.generateDefaultValueFromMap(
          DefaultValueMap(defaultValue: _defaultValue, typeName: _typeName));

      expect(result, contains(_expectedResult));
    });
  });

  group('getParameterTypeName', () {
    final _generator = SwaggerModelsGeneratorV2();
    test('Should return validate parameter type name', () {
      String _className = "Animal";
      String _parameterName = "orderId";
      Map<String, dynamic> _parameter = {"type": "string"};
      String _expectedResult = "String";
      final result = _generator.getParameterTypeName(
          _className, _parameterName, _parameter);

      expect(result, contains(_expectedResult));
    });

    test('Should return Object', () {
      String _className = "Animal";
      String _parameterName = "orderId";
      String _expectedResult = "Object";
      final result =
          _generator.getParameterTypeName(_className, _parameterName, null);

      expect(result, contains(_expectedResult));
    });

    test('Should return validate parameter type name', () {
      String _className = "Animal";
      String _parameterName = "orderId";
      Map<String, dynamic> _parameter = {"\$ref": "#/definitions/Pet"};
      String _expectedResult = "Pet";
      final result = _generator.getParameterTypeName(
          _className, _parameterName, _parameter);

      expect(result, contains(_expectedResult));
    });

    test('Should return optional name parameter', () {
      String _className = "Animal";
      String _parameterName = "orderId";
      String _refNameParameter = "animals_Object";
      String _expectedResult = "AnimalsObject";
      final result = _generator.getParameterTypeName(
          _className, _parameterName, null, _refNameParameter);

      expect(result, contains(_expectedResult));
    });

    test('Should return DateTime', () {
      String _className = "Animal";
      String _parameterName = "orderId";
      Map<String, dynamic> _parameter = {
        "type": "string",
        "format": "date-time"
      };
      String _expectedResult = "DateTime";
      final result = _generator.getParameterTypeName(
          _className, _parameterName, _parameter);

      expect(result, contains(_expectedResult));
    });
  });

  group('getEnumFieldName', () {
    final _generator = SwaggerModelsGeneratorV2();

    test('Should return validate enum field name', () {
      String _name = "cat-dog_ Cars";
      String _expectedResult = "catDogCars";
      final result = _generator.getEnumFieldName(_name);

      expect(result, contains(_expectedResult));
    });

    test('Should return validate enum field name without forbidden symbols',
        () {
      String _name = "cat,dog..Cars";
      String _expectedResult = "catDogCars";
      final result = _generator.getEnumFieldName(_name);

      expect(result, contains(_expectedResult));
    });

    test('Should return \$validateEnumFieldName', () {
      String _name = "55element";
      String _expectedResult = "\$55element";
      final result = _generator.getEnumFieldName(_name);

      expect(result, contains(_expectedResult));
    });
  });

  group('generateFieldName', () {
    final _generator = SwaggerModelsGeneratorV2();

    test('Should return validate field name', () {
      String _name = "Cat_Dog-Animals";
      String _expectedResult = 'catDogAnimals';
      final result = _generator.generateFieldName(_name);

      expect(result, contains(_expectedResult));
    });

    test('Should return \$forbiddenFieldName', () {
      String _name = "#";
      String _expectedResult = '\$forbiddenFieldName';
      final result = _generator.generateFieldName(_name);

      expect(result, contains(_expectedResult));
    });

    test('Should return \$null', () {
      String _name = "null";
      String _expectedResult = '\$null';
      final result = _generator.generateFieldName(_name);

      expect(result, contains(_expectedResult));
    });

    test('Should return \$number', () {
      String _name = "5element";
      String _expectedResult = '\$5element';
      final result = _generator.generateFieldName(_name);

      expect(result, contains(_expectedResult));
    });
  });

  group('generatePropertyContentByDefault', () {
    final _generator = SwaggerModelsGeneratorV2();
    test('Should return property with JsonKey', () {
      final Map<String, dynamic> _propertyEntryMap = {"originalRef": "Pet"};
      final String _propertyName = "shipDate";
      final String _jsonKeyExpendedResult = "@JsonKey(name: '$_propertyName'";
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
    final _generator = SwaggerModelsGeneratorV2();
    test('Should return property with JsonKey', () {
      final Map<String, dynamic> _propertyEntryMap = {
        "\$ref": "#/definitions/Pet"
      };
      final String _propertyName = "shipDate";
      final String _propertyKey = "shipDateGet";
      final String _className = "Animals";
      final String _jsonKeyExpendedResult = "@JsonKey(name: '$_propertyKey'";
      final String _expectedResult =
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
    final _generator = SwaggerModelsGeneratorV2();
    test('Should return enum values', () {
      final List<String> list = ["Cats", "dogs", "Forgs"];
      final String _expectedResult = "\t@JsonValue('Cats')\n  cats";
      final String result = _generator.generateEnumValuesContent(list);

      expect(result, contains(_expectedResult));
    });
  });

  group('generateEnumPropertyContent', () {
    final _generator = SwaggerModelsGeneratorV2();
    test('Should return enum property with JsonKey', () {
      final String key = "dog";
      final String className = "animals";
      final String _jsonKeyExpectedResult =
          "@JsonKey(unknownEnumValue: AnimalsDog.swaggerGeneratedUnknown)";
      final String _expectedResult = 'final AnimalsDog dog;';
      final String result =
          _generator.generateEnumPropertyContent(key, className);

      expect(result, contains(_jsonKeyExpectedResult));
      expect(result, contains(_expectedResult));
    });
  });
}
