import 'package:swagger_generator/src/code_generators/v2/swagger_models_generator_v2.dart';
import 'package:swagger_generator/src/models/generator_options.dart';
import 'package:test/test.dart';
import 'code_examples.dart';

void main() {
  group('Models generator testing group', () {
    final _generator = SwaggerModelsGeneratorV2();
    final _fileName = 'order_service.dart';

    test('Should parse object name as a field Type', () {
      final result = _generator.generate(
          model_with_parameters, _fileName, GeneratorOptions());

      expect(result, contains("final DeliveryDto deliveryDate"));
    });

    test('Should parse object name as a field Type', () {
      final result = _generator.generate(
          model_with_parameters,
          _fileName,
          GeneratorOptions(defaultValuesMap: [
            DefaultValueMap(
              typeName: "int",
              defaultValue: "19",
            )
          ]));

      expect(result, contains("@JsonKey(name: 'id', defaultValue: 19)"));
    });

    test('Should generate enum name', () {
      String _className = "animal";
      String _enumName = "cat";
      String _output = "AnimalCat";
      final result = _generator.generateEnumName(_className, _enumName);

      expect(result, contains(_output));
    });

    test('Should return default value', () {
      String _defaultValue = "true";
      String _typeName = "bool";
      String _output = "true";
      final String result = _generator.generateDefaultValueFromMap(
          DefaultValueMap(defaultValue: _defaultValue, typeName: _typeName));

      expect(result, contains(_output));
    });

    test('Should return parameter type name', () {
      String _className = "Animal";
      String _parameterName = "orderId";
      Map<String, dynamic> _parameter = {"type": "string"};
      String _output = "String";
      final result = _generator.getParameterTypeName(
          _className, _parameterName, _parameter);

      expect(result, contains(_output));
    });

    test('Should return enum field name', () {
      String _name = "cat-dog_ Cars";
      String _output = "catDogCars";
      final result = _generator.getEnumFieldName(_name);

      expect(result, contains(_output));
    });
  });
}
