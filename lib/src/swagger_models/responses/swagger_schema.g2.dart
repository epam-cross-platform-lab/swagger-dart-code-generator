// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'swagger_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SwaggerSchema _$SwaggerSchemaFromJson(Map<String, dynamic> json) {
  return SwaggerSchema(
    type: json['type'] as String? ?? '',
    originalRef: json['originalRef'] as String? ?? '',
    enumValues:
        (json['enum'] as List<dynamic>?)?.map((e) => e as String).toList() ??
            [],
    properties: (json['properties'] as Map<String, dynamic>?)?.map(
          (k, e) =>
              MapEntry(k, SwaggerSchema.fromJson(e as Map<String, dynamic>)),
        ) ??
        {},
    items: json['items'] == null
        ? null
        : SwaggerSchema.fromJson(json['items'] as Map<String, dynamic>),
    ref: json[r'$ref'] as String? ?? '',
    defaultValue: json['default'],
    format: json['format'] as String? ?? '',
    schema: json['schema'] == null
        ? null
        : SwaggerSchema.fromJson(json['schema'] as Map<String, dynamic>),
    oneOf: (json['oneOf'] as List<dynamic>?)
            ?.map((e) => SwaggerSchema.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$SwaggerSchemaToJson(SwaggerSchema instance) =>
    <String, dynamic>{
      'type': instance.type,
      'format': instance.format,
      'default': instance.defaultValue,
      'originalRef': instance.originalRef,
      r'$ref': instance.ref,
      'enum': instance.enumValues,
      'items': instance.items,
      'properties': instance.properties,
      'schema': instance.schema,
      'oneOf': instance.oneOf,
    };
