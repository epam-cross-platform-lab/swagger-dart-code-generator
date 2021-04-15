// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generator_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneratorOptions _$GeneratorOptionsFromJson(Map json) {
  return GeneratorOptions(
    withBaseUrl: json['with_base_url'] as bool? ?? true,
    withConverter: json['with_converter'] as bool? ?? true,
    ignoreHeaders: json['ignore_headers'] as bool? ?? false,
    useDefaultNullForLists:
        json['use_default_null_for_lists'] as bool? ?? false,
    buildOnlyModels: json['build_only_models'] as bool? ?? false,
    defaultValuesMap: (json['default_values_map'] as List<dynamic>?)
            ?.map((e) =>
                DefaultValueMap.fromJson(Map<String, dynamic>.from(e as Map)))
            .toList() ??
        [],
    responseOverrideValueMap:
        (json['response_override_value_map'] as List<dynamic>?)
                ?.map((e) => ResponseOverrideValueMap.fromJson(
                    Map<String, dynamic>.from(e as Map)))
                .toList() ??
            [],
    inputFolder: json['input_folder'] as String? ?? '',
    outputFolder: json['output_folder'] as String? ?? '',
    enumsCaseSensitive: json['enums_case_sensitive'] as bool? ?? false,
    usePathForRequestNames:
        json['use_path_for_request_names'] as bool? ?? false,
    useRequiredAttributeForHeaders:
        json['use_required_attribute_for_headers'] as bool? ?? true,
    useInheritance: json['use_inheritance'] as bool? ?? true,
    includeIfNull: json['include_if_null'] == null
        ? null
        : IncludeIfNull.fromJson(
            Map<String, dynamic>.from(json['include_if_null'] as Map)),
  );
}

Map<String, dynamic> _$GeneratorOptionsToJson(GeneratorOptions instance) =>
    <String, dynamic>{
      'with_base_url': instance.withBaseUrl,
      'with_converter': instance.withConverter,
      'use_required_attribute_for_headers':
          instance.useRequiredAttributeForHeaders,
      'ignore_headers': instance.ignoreHeaders,
      'use_inheritance': instance.useInheritance,
      'enums_case_sensitive': instance.enumsCaseSensitive,
      'use_path_for_request_names': instance.usePathForRequestNames,
      'include_if_null': instance.includeIfNull,
      'input_folder': instance.inputFolder,
      'output_folder': instance.outputFolder,
      'use_default_null_for_lists': instance.useDefaultNullForLists,
      'build_only_models': instance.buildOnlyModels,
      'default_values_map': instance.defaultValuesMap,
      'response_override_value_map': instance.responseOverrideValueMap,
    };

DefaultValueMap _$DefaultValueMapFromJson(Map<String, dynamic> json) {
  return DefaultValueMap(
    typeName: json['type_name'] as String? ?? '',
    defaultValue: json['default_value'] as String? ?? '',
  );
}

Map<String, dynamic> _$DefaultValueMapToJson(DefaultValueMap instance) =>
    <String, dynamic>{
      'type_name': instance.typeName,
      'default_value': instance.defaultValue,
    };

IncludeIfNull _$IncludeIfNullFromJson(Map<String, dynamic> json) {
  return IncludeIfNull(
    enabled: json['enabled'] as bool? ?? false,
    value: json['value'] as bool? ?? false,
  );
}

Map<String, dynamic> _$IncludeIfNullToJson(IncludeIfNull instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'value': instance.value,
    };

ResponseOverrideValueMap _$ResponseOverrideValueMapFromJson(
    Map<String, dynamic> json) {
  return ResponseOverrideValueMap(
    url: json['url'] as String? ?? '',
    method: json['method'] as String? ?? '',
    overriddenValue: json['overridden_value'] as String? ?? '',
  );
}

Map<String, dynamic> _$ResponseOverrideValueMapToJson(
        ResponseOverrideValueMap instance) =>
    <String, dynamic>{
      'url': instance.url,
      'method': instance.method,
      'overridden_value': instance.overriddenValue,
    };
