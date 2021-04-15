// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseSchema _$ResponseSchemaFromJson(Map<String, dynamic> json) {
  return ResponseSchema(
    type: json['type'] as String? ?? '',
    originalRef: json['originalRef'] as String? ?? '',
    enumValue:
        (json['enum'] as List<dynamic>?)?.map((e) => e as String).toList() ??
            [],
    items: json['items'] == null
        ? null
        : ItemSchema.fromJson(json['items'] as Map<String, dynamic>),
    ref: json[r'$ref'] as String? ?? '',
  );
}

Map<String, dynamic> _$ResponseSchemaToJson(ResponseSchema instance) =>
    <String, dynamic>{
      'type': instance.type,
      'originalRef': instance.originalRef,
      r'$ref': instance.ref,
      'enum': instance.enumValue,
      'items': instance.items,
    };
