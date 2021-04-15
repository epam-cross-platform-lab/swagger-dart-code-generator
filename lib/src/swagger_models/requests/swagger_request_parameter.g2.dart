// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'swagger_request_parameter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SwaggerRequestParameter _$SwaggerRequestParameterFromJson(
    Map<String, dynamic> json) {
  return SwaggerRequestParameter(
    inParameter: json['in'] as String? ?? '',
    name: json['name'] as String? ?? '',
    description: json['description'] as String? ?? '',
    isRequired: json['required'] as bool? ?? false,
    type: json['type'] as String? ?? '',
    item: json['item'] == null
        ? null
        : ParameterItem.fromJson(json['item'] as Map<String, dynamic>),
    collectionFormat: json['collectionFormat'] as String? ?? '',
    items: json['items'] == null
        ? null
        : SwaggerRequestItems.fromJson(json['items'] as Map<String, dynamic>),
    schema: json['schema'] == null
        ? null
        : SwaggerParameterSchema.fromJson(
            json['schema'] as Map<String, dynamic>),
    ref: json[r'$ref'] as String? ?? '',
  );
}

Map<String, dynamic> _$SwaggerRequestParameterToJson(
        SwaggerRequestParameter instance) =>
    <String, dynamic>{
      'in': instance.inParameter,
      'name': instance.name,
      'description': instance.description,
      'required': instance.isRequired,
      r'$ref': instance.ref,
      'type': instance.type,
      'item': instance.item,
      'collectionFormat': instance.collectionFormat,
      'schema': instance.schema,
      'items': instance.items,
    };
