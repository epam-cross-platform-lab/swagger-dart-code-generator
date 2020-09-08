// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'swagger_parameter_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SwaggerParameterSchema _$SwaggerParameterSchemaFromJson(
    Map<String, dynamic> json) {
  return SwaggerParameterSchema(
    type: json['type'] as String,
    ref: json['\$ref'] as String,
    enumValues: (json['enum'] as List<dynamic>)
        ?.map((dynamic e) => e as String)
        ?.toList(),
    originalRef: json['originalRef'] as String,
  );
}

Map<String, dynamic> _$SwaggerParameterSchemaToJson(
        SwaggerParameterSchema instance) =>
    <String, dynamic>{
      'type': instance.type,
      '\$ref': instance.ref,
      'enum': instance.enumValues,
      'originalRef': instance.originalRef,
    };
