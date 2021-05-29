// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'swagger_path.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SwaggerPath _$SwaggerPathFromJson(Map<String, dynamic> json) {
  return SwaggerPath(
    requests: (json['requests'] as Map<String, dynamic>?)?.map(
          (k, e) =>
              MapEntry(k, SwaggerRequest.fromJson(e as Map<String, dynamic>)),
        ) ??
        {},
    parameters: (json['parameters'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(
              k, SwaggerRequestParameter.fromJson(e as Map<String, dynamic>)),
        ) ??
        {},
  );
}

Map<String, dynamic> _$SwaggerPathToJson(SwaggerPath instance) =>
    <String, dynamic>{
      'requests': instance.requests,
      'parameters': instance.parameters,
    };
