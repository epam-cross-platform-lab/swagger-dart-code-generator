// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemSchema _$ItemSchemaFromJson(Map<String, dynamic> json) {
  return ItemSchema(
    originalRef: json['originalRef'] as String? ?? '',
    ref: json[r'$ref'] as String? ?? '',
    type: json['type'] as String? ?? '',
  );
}

Map<String, dynamic> _$ItemSchemaToJson(ItemSchema instance) =>
    <String, dynamic>{
      'originalRef': instance.originalRef,
      r'$ref': instance.ref,
      'type': instance.type,
    };
