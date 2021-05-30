// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'swagger_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SwaggerRequest _$SwaggerRequestFromJson(Map<String, dynamic> json) {
  return SwaggerRequest(
    summary: json['summary'] as String? ?? '',
    description: json['description'] as String? ?? '',
    operationId: json['operationId'] as String? ?? '',
    consumes: (json['consumes'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    responses: (json['responses'] as Map<String, dynamic>?)?.map(
          (k, e) =>
              MapEntry(k, SwaggerResponse.fromJson(e as Map<String, dynamic>)),
        ) ??
        {},
    parameters: (json['parameters'] as List<dynamic>?)
            ?.map((e) =>
                SwaggerRequestParameter.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    produces: (json['produces'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    requestBody: json['requestBody'] == null
        ? null
        : RequestBody.fromJson(json['requestBody'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SwaggerRequestToJson(SwaggerRequest instance) =>
    <String, dynamic>{
      'summary': instance.summary,
      'description': instance.description,
      'operationId': instance.operationId,
      'consumes': instance.consumes,
      'produces': instance.produces,
      'responses': instance.responses,
      'parameters': instance.parameters,
      'requestBody': instance.requestBody,
    };

RequestBody _$RequestBodyFromJson(Map<String, dynamic> json) {
  return RequestBody(
    content: json['content'] == null
        ? null
        : RequestContent.fromJson(json['content'] as Map<String, dynamic>),
    ref: json['ref'] as String? ?? '',
  );
}

Map<String, dynamic> _$RequestBodyToJson(RequestBody instance) =>
    <String, dynamic>{
      'content': instance.content,
      'ref': instance.ref,
    };

RequestContent _$RequestContentFromJson(Map<String, dynamic> json) {
  return RequestContent(
    items: json['items'] == null
        ? null
        : SwaggerSchema.fromJson(json['items'] as Map<String, dynamic>),
    ref: json['ref'] as String? ?? '',
    responseType: json['responseType'] as String? ?? '',
    type: json['type'] as String? ?? '',
  );
}

Map<String, dynamic> _$RequestContentToJson(RequestContent instance) =>
    <String, dynamic>{
      'responseType': instance.responseType,
      'type': instance.type,
      'items': instance.items,
      'ref': instance.ref,
    };
