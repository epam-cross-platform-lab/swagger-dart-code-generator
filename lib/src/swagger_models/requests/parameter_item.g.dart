// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parameter_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParameterItem _$ParameterItemFromJson(Map<String, dynamic> json) =>
    ParameterItem(
      type: json['type'] as String? ?? '',
      enumValues:
          (json['enum'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      defaultValue: json['default'] as String? ?? '',
    );

Map<String, dynamic> _$ParameterItemToJson(ParameterItem instance) =>
    <String, dynamic>{
      'type': instance.type,
      'enum': instance.enumValues,
      'default': instance.defaultValue,
    };
