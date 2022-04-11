import 'package:swagger_dart_code_generator/src/code_generators/constants.dart';

class SwaggerEnum {
  const SwaggerEnum({
    required this.name,
    required this.isInteger,
  });

  SwaggerEnum.fromSchema(Map<String, dynamic> schema)
      : name = schema['name'] as String,
        isInteger = kIntegerTypes.contains(schema['type']);

  final String name;

  /// Enums are either int or string
  final bool isInteger;
}
