// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generator_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneratorOptions _$GeneratorOptionsFromJson(Map json) => GeneratorOptions(
      withBaseUrl: json['with_base_url'] as bool? ?? true,
      withConverter: json['with_converter'] as bool? ?? true,
      ignoreHeaders: json['ignore_headers'] as bool? ?? false,
      separateModels: json['separate_models'] as bool? ?? false,
      classesWithNullabeLists:
          (json['classes_with_nullabe_lists'] as List<dynamic>?)
                  ?.map((e) => e as String)
                  .toList() ??
              [],
      buildOnlyModels: json['build_only_models'] as bool? ?? false,
      defaultValuesMap: (json['default_values_map'] as List<dynamic>?)
              ?.map((e) =>
                  DefaultValueMap.fromJson(Map<String, dynamic>.from(e as Map)))
              .toList() ??
          [],
      defaultHeaderValuesMap:
          (json['default_header_values_map'] as List<dynamic>?)
                  ?.map((e) => DefaultHeaderValueMap.fromJson(
                      Map<String, dynamic>.from(e as Map)))
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
      useRequiredAttributeForHeaders:
          json['use_required_attribute_for_headers'] as bool? ?? true,
      usePathForRequestNames:
          json['use_path_for_request_names'] as bool? ?? true,
      includeIfNull: json['include_if_null'] as bool?,
      modelPostfix: json['model_postfix'] as String? ?? '',
      includePaths: (json['include_paths'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      excludePaths: (json['exclude_paths'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      inputUrls: (json['input_urls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      nullableModels: (json['nullable_models'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      cutFromModelNames: json['cut_from_model_names'] as String? ?? '',
      additionalHeaders: (json['additional_headers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      overrideEqualsAndHashcode:
          json['override_equals_and_hashcode'] as bool? ?? true,
      overrideToString: json['override_to_string'] as bool? ?? true,
      pageWidth: json['page_width'] as int?,
      overridenModels: (json['overriden_models'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$GeneratorOptionsToJson(GeneratorOptions instance) =>
    <String, dynamic>{
      'use_path_for_request_names': instance.usePathForRequestNames,
      'with_base_url': instance.withBaseUrl,
      'page_width': instance.pageWidth,
      'override_to_string': instance.overrideToString,
      'override_equals_and_hashcode': instance.overrideEqualsAndHashcode,
      'with_converter': instance.withConverter,
      'overriden_models': instance.overridenModels,
      'additional_headers': instance.additionalHeaders,
      'input_urls': instance.inputUrls,
      'nullable_models': instance.nullableModels,
      'separate_models': instance.separateModels,
      'use_required_attribute_for_headers':
          instance.useRequiredAttributeForHeaders,
      'ignore_headers': instance.ignoreHeaders,
      'enums_case_sensitive': instance.enumsCaseSensitive,
      'include_if_null': instance.includeIfNull,
      'input_folder': instance.inputFolder,
      'output_folder': instance.outputFolder,
      'classes_with_nullabe_lists': instance.classesWithNullabeLists,
      'cut_from_model_names': instance.cutFromModelNames,
      'build_only_models': instance.buildOnlyModels,
      'model_postfix': instance.modelPostfix,
      'default_values_map': instance.defaultValuesMap,
      'default_header_values_map': instance.defaultHeaderValuesMap,
      'response_override_value_map': instance.responseOverrideValueMap,
      'include_paths': instance.includePaths,
      'exclude_paths': instance.excludePaths,
    };

DefaultValueMap _$DefaultValueMapFromJson(Map<String, dynamic> json) =>
    DefaultValueMap(
      typeName: json['type_name'] as String? ?? '',
      defaultValue: json['default_value'] as String? ?? '',
    );

Map<String, dynamic> _$DefaultValueMapToJson(DefaultValueMap instance) =>
    <String, dynamic>{
      'type_name': instance.typeName,
      'default_value': instance.defaultValue,
    };

ResponseOverrideValueMap _$ResponseOverrideValueMapFromJson(
        Map<String, dynamic> json) =>
    ResponseOverrideValueMap(
      url: json['url'] as String? ?? '',
      method: json['method'] as String? ?? '',
      overriddenValue: json['overridden_value'] as String? ?? '',
    );

Map<String, dynamic> _$ResponseOverrideValueMapToJson(
        ResponseOverrideValueMap instance) =>
    <String, dynamic>{
      'url': instance.url,
      'method': instance.method,
      'overridden_value': instance.overriddenValue,
    };

DefaultHeaderValueMap _$DefaultHeaderValueMapFromJson(
        Map<String, dynamic> json) =>
    DefaultHeaderValueMap(
      headerName: json['header_name'] as String? ?? '',
      defaultValue: json['default_value'] as String? ?? '',
    );

Map<String, dynamic> _$DefaultHeaderValueMapToJson(
        DefaultHeaderValueMap instance) =>
    <String, dynamic>{
      'header_name': instance.headerName,
      'default_value': instance.defaultValue,
    };
