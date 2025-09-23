// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'swagger_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SwaggerRequest _$SwaggerRequestFromJson(
  Map<String, dynamic> json,
) => SwaggerRequest(
  summary: json['summary'] as String? ?? '',
  description: json['description'] as String? ?? '',
  operationId: json['operationId'] as String? ?? '',
  consumes:
      (json['consumes'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  responses:
      (json['responses'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, SwaggerResponse.fromJson(e as Map<String, dynamic>)),
      ) ??
      const {},
  parameters:
      (json['parameters'] as List<dynamic>?)
          ?.map(
            (e) => SwaggerRequestParameter.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  produces:
      (json['produces'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  security: json['security'] == null
      ? const []
      : _securityFromJson(json['security'] as List?),
  requestBody: json['requestBody'] == null
      ? null
      : RequestBody.fromJson(json['requestBody'] as Map<String, dynamic>),
  deprecated: json['deprecated'] as bool? ?? false,
  tags:
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
);

Map<String, dynamic> _$SwaggerRequestToJson(SwaggerRequest instance) =>
    <String, dynamic>{
      'summary': instance.summary,
      'description': instance.description,
      'deprecated': instance.deprecated,
      'operationId': instance.operationId,
      'consumes': instance.consumes,
      'produces': instance.produces,
      'responses': instance.responses,
      'security': instance.security,
      'parameters': instance.parameters,
      'requestBody': instance.requestBody,
      'tags': instance.tags,
    };

RequestBody _$RequestBodyFromJson(Map<String, dynamic> json) => RequestBody(
  content: _contentFromJson(json['content'] as Map<String, dynamic>?),
  ref: json[r'$ref'] as String? ?? '',
);

Map<String, dynamic> _$RequestBodyToJson(RequestBody instance) =>
    <String, dynamic>{'content': instance.content, r'$ref': instance.ref};

RequestContent _$RequestContentFromJson(Map<String, dynamic> json) =>
    RequestContent(
      isMultipart: json['isMultipart'] as bool?,
      isUrlencoded: json['isUrlencoded'] as bool?,
      schema: json['schema'] == null
          ? null
          : SwaggerSchema.fromJson(json['schema'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RequestContentToJson(RequestContent instance) =>
    <String, dynamic>{
      'schema': instance.schema,
      'isMultipart': instance.isMultipart,
      'isUrlencoded': instance.isUrlencoded,
    };
