// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'swagger_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SwaggerResponse _$SwaggerResponseFromJson(Map<String, dynamic> json) =>
    SwaggerResponse(
      description: json['description'] as String? ?? '',
      type: json['type'] as String? ?? '',
      schema: json['schema'] == null
          ? null
          : SwaggerSchema.fromJson(json['schema'] as Map<String, dynamic>),
      enumValue: (json['enumValue'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      content: _mapContent(json['content'] as Map<String, dynamic>?),
      ref: json[r'$ref'] as String? ?? '',
    );

Map<String, dynamic> _$SwaggerResponseToJson(SwaggerResponse instance) =>
    <String, dynamic>{
      r'$ref': instance.ref,
      'description': instance.description,
      'type': instance.type,
      'schema': instance.schema,
      'enumValue': instance.enumValue,
      'content': instance.content,
    };

Content _$ContentFromJson(Map<String, dynamic> json) => Content(
      items: json['items'] == null
          ? null
          : SwaggerSchema.fromJson(json['items'] as Map<String, dynamic>),
      ref: json['ref'] as String? ?? '',
      responseType: json['responseType'] as String? ?? '',
      type: json['type'] as String? ?? '',
      schema: json['schema'] == null
          ? null
          : SwaggerSchema.fromJson(json['schema'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
      'responseType': instance.responseType,
      'type': instance.type,
      'items': instance.items,
      'schema': instance.schema,
      'ref': instance.ref,
    };
