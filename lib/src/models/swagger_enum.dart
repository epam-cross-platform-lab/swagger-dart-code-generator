import 'package:collection/collection.dart';
import 'package:swagger_dart_code_generator/src/code_generators/constants.dart';

class SwaggerEnum {
  const SwaggerEnum({
    required this.name,
    required this.isInteger,
    required this.defaultValue,
  });

  SwaggerEnum.fromSchema(Map<String, dynamic> schema)
      : name = schema['name'] as String,
        isInteger = kIntegerTypes.contains(schema['type']),
        defaultValue = schema['default'];

  final String name;

  /// Enums are either int or string
  final bool isInteger;

  final Object? defaultValue;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SwaggerEnum &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          isInteger == other.isInteger &&
          DeepCollectionEquality().equals(defaultValue, other.defaultValue);

  @override
  int get hashCode =>
      name.hashCode ^ isInteger.hashCode ^ defaultValue.hashCode;

  @override
  String toString() =>
      'SwaggerEnum{name: $name, isInteger: $isInteger, defaultValue: $defaultValue}';
}
