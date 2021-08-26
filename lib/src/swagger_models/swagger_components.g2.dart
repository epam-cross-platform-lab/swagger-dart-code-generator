// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'swagger_components.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SwaggerComponents _$SwaggerComponentsFromJson(Map<String, dynamic> json) {
  return SwaggerComponents(
    parameters: (json['parameters'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(
              k, SwaggerRequestParameter.fromJson(e as Map<String, dynamic>)),
        ) ??
        {},
    schemas: (json['schemas'] as Map<String, dynamic>?)?.map(
          (k, e) =>
              MapEntry(k, SwaggerSchema.fromJson(e as Map<String, dynamic>)),
        ) ??
        {},
    responses: _mapResponses(json['responses'] as Map<String, dynamic>?),
    requestBodies:
        _mapResponses(json['requestBodies'] as Map<String, dynamic>?),
  );
}

Map<String, dynamic> _$SwaggerComponentsToJson(SwaggerComponents instance) =>
    <String, dynamic>{
      'parameters': instance.parameters,
      'schemas': instance.schemas,
      'responses': instance.responses,
      'requestBodies': instance.requestBodies,
    };
