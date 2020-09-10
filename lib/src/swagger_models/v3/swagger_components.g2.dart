// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'swagger_components.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SwaggerComponents _$SwaggerComponentsFromJson(Map<String, dynamic> json) {
  return SwaggerComponents(
    parameters: (json['parameters'] as List<SwaggerRequestParameter>)
        ?.map((SwaggerRequestParameter e) => e == null
            ? null
            : SwaggerRequestParameter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SwaggerComponentsToJson(SwaggerComponents instance) =>
    <String, dynamic>{
      'parameters': instance.parameters,
    };
