// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'swagger_parameter_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SwaggerParameterSchema _$SwaggerParameterSchemaFromJson(
    Map<String, dynamic> json) {
  return SwaggerParameterSchema(
    type: json['type'] as String,
    enumValues: SwaggerParameterSchema.enumsFromJson(json['enum'] as List),
    originalRef: json['originalRef'] as String,
    ref: json[r'$ref'] as String,
  );
}

Map<String, dynamic> _$SwaggerParameterSchemaToJson(
        SwaggerParameterSchema instance) =>
    <String, dynamic>{
      'type': instance.type,
      'enum': instance.enumValues,
      'originalRef': instance.originalRef,
      r'$ref': instance.ref,
    };
