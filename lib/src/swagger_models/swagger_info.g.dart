// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'swagger_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SwaggerInfo _$SwaggerInfoFromJson(Map<String, dynamic> json) => SwaggerInfo(
      description: json['description'] as String? ?? '',
      version: json['version'] as String? ?? '',
      title: json['title'] as String? ?? '',
      termsOfService: json['termsOfService'] as String? ?? '',
    );

Map<String, dynamic> _$SwaggerInfoToJson(SwaggerInfo instance) =>
    <String, dynamic>{
      'description': instance.description,
      'version': instance.version,
      'title': instance.title,
      'termsOfService': instance.termsOfService,
    };
