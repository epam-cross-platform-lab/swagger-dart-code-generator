// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'swagger_request_parameter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SwaggerRequestParameter _$SwaggerRequestParameterFromJson(
        Map<String, dynamic> json) =>
    SwaggerRequestParameter(
      inParameter: json['in'] as String? ?? '',
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      format: json['format'] as String? ?? null,
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
          : SwaggerSchema.fromJson(json['schema'] as Map<String, dynamic>),
      ref: json[r'$ref'] as String? ?? '',
      key: json['key'] as String? ?? '',
      enumValuesObj: json['enum'] as List<dynamic>? ?? [],
    );

Map<String, dynamic> _$SwaggerRequestParameterToJson(
        SwaggerRequestParameter instance) =>
    <String, dynamic>{
      'in': instance.inParameter,
      'name': instance.name,
      'description': instance.description,
      'format': instance.format,
      'required': instance.isRequired,
      r'$ref': instance.ref,
      'type': instance.type,
      'item': instance.item,
      'enum': instance.enumValuesObj,
      'collectionFormat': instance.collectionFormat,
      'schema': instance.schema,
      'items': instance.items,
      'key': instance.key,
    };
