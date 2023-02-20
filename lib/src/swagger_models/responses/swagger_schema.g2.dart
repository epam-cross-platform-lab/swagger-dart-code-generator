// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'swagger_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SwaggerSchema _$SwaggerSchemaFromJson(Map<String, dynamic> json) =>
    SwaggerSchema(
      type: json['type'] as String? ?? '',
      originalRef: json['originalRef'] as String? ?? '',
      enumValuesObj: json['enum'] as List<dynamic>? ?? [],
      properties: (json['properties'] as Map<String, dynamic>?)?.map(
            (k, e) =>
                MapEntry(k, SwaggerSchema.fromJson(e as Map<String, dynamic>)),
          ) ??
          {},
      items: json['items'] == null
          ? null
          : SwaggerSchema.fromJson(json['items'] as Map<String, dynamic>),
      ref: json[r'$ref'] as String? ?? '',
      defaultValue: json['default'],
      format: json['format'] as String? ?? '',
      schema: json['schema'] == null
          ? null
          : SwaggerSchema.fromJson(json['schema'] as Map<String, dynamic>),
      oneOf: (json['oneOf'] as List<dynamic>?)
              ?.map((e) => SwaggerSchema.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      anyOf: (json['anyOf'] as List<dynamic>?)
              ?.map((e) => SwaggerSchema.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      allOf: (json['allOf'] as List<dynamic>?)
              ?.map((e) => SwaggerSchema.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      required: json['required'] == null
          ? const []
          : _requiredFromJson(json['required']),
      description: json['description'] as String? ?? '',
      enumNames: (json['enumNames'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      isNullable: json['nullable'] as bool? ?? false,
      hasAdditionalProperties: json['additionalProperties'] == null
          ? false
          : _additionalsFromJson(json['additionalProperties']),
      msEnum: json['x-ms-enum'] == null
          ? null
          : MsEnum.fromJson(json['x-ms-enum'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SwaggerSchemaToJson(SwaggerSchema instance) =>
    <String, dynamic>{
      'type': instance.type,
      'format': instance.format,
      'default': instance.defaultValue,
      'originalRef': instance.originalRef,
      r'$ref': instance.ref,
      'description': instance.description,
      'enum': instance.enumValuesObj,
      'x-ms-enum': instance.msEnum,
      'required': instance.required,
      'items': instance.items,
      'properties': instance.properties,
      'nullable': instance.isNullable,
      'schema': instance.schema,
      'oneOf': instance.oneOf,
      'anyOf': instance.anyOf,
      'allOf': instance.allOf,
      'additionalProperties': instance.hasAdditionalProperties,
      'enumNames': instance.enumNames,
    };

MsEnum _$MsEnumFromJson(Map<String, dynamic> json) => MsEnum(
      values: (json['values'] as List<dynamic>?)
              ?.map((e) => MsEnumValue.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$MsEnumToJson(MsEnum instance) => <String, dynamic>{
      'values': instance.values,
    };

MsEnumValue _$MsEnumValueFromJson(Map<String, dynamic> json) => MsEnumValue(
      value: json['value'] ?? const [],
    );

Map<String, dynamic> _$MsEnumValueToJson(MsEnumValue instance) =>
    <String, dynamic>{
      'value': instance.value,
    };
