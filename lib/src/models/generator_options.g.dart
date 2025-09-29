// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generator_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneratorOptions _$GeneratorOptionsFromJson(Map json) => GeneratorOptions(
  withBaseUrl: json['with_base_url'] as bool? ?? true,
  addBasePathToRequests: json['add_base_path_to_requests'] as bool? ?? false,
  withConverter: json['with_converter'] as bool? ?? true,
  ignoreHeaders: json['ignore_headers'] as bool? ?? false,
  separateModels: json['separate_models'] as bool? ?? false,
  classesWithNullabeLists:
      (json['classes_with_nullabe_lists'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  buildOnlyModels: json['build_only_models'] as bool? ?? false,
  defaultValuesMap:
      (json['default_values_map'] as List<dynamic>?)
          ?.map(
            (e) =>
                DefaultValueMap.fromJson(Map<String, dynamic>.from(e as Map)),
          )
          .toList() ??
      const <DefaultValueMap>[],
  defaultHeaderValuesMap:
      (json['default_header_values_map'] as List<dynamic>?)
          ?.map(
            (e) => DefaultHeaderValueMap.fromJson(
              Map<String, dynamic>.from(e as Map),
            ),
          )
          .toList() ??
      const <DefaultHeaderValueMap>[],
  responseOverrideValueMap:
      (json['response_override_value_map'] as List<dynamic>?)
          ?.map(
            (e) => ResponseOverrideValueMap.fromJson(
              Map<String, dynamic>.from(e as Map),
            ),
          )
          .toList() ??
      const <ResponseOverrideValueMap>[],
  inputFolder: json['input_folder'] as String,
  outputFolder: json['output_folder'] as String,
  enumsCaseSensitive: json['enums_case_sensitive'] as bool? ?? true,
  useRequiredAttributeForHeaders:
      json['use_required_attribute_for_headers'] as bool? ?? true,
  usePathForRequestNames: json['use_path_for_request_names'] as bool? ?? true,
  includeIfNull: json['include_if_null'] as bool?,
  modelPostfix: json['model_postfix'] as String? ?? '',
  customReturnType: json['custom_return_type'] as String? ?? '',
  includePaths:
      (json['include_paths'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  importPaths:
      (json['import_paths'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  excludePaths:
      (json['exclude_paths'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  inputUrls:
      (json['input_urls'] as List<dynamic>?)
          ?.map((e) => InputUrl.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList() ??
      const [],
  nullableModels:
      (json['nullable_models'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  cutFromModelNames: json['cut_from_model_names'] as String? ?? '',
  additionalHeaders:
      (json['additional_headers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  overrideEqualsAndHashcode:
      json['override_equals_and_hashcode'] as bool? ?? true,
  overrideToString: json['override_to_string'] as bool? ?? true,
  pageWidth: (json['page_width'] as num?)?.toInt(),
  scalars:
      (json['scalars'] as Map?)?.map(
        (k, e) => MapEntry(
          k as String,
          CustomScalar.fromJson(Map<String, dynamic>.from(e as Map)),
        ),
      ) ??
      const {},
  overridenModels:
      (json['overriden_models'] as List<dynamic>?)
          ?.map(
            (e) => OverridenModelsItem.fromJson(
              Map<String, dynamic>.from(e as Map),
            ),
          )
          .toList() ??
      const [],
  generateToJsonFor:
      (json['generate_to_json_for'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  includeNullQueryVars: json['include_null_query_vars'] as bool? ?? false,
  multipartFileType: json['multipart_file_type'] as String? ?? 'List<int>',
  urlencodedFileType:
      json['urlencoded_file_type'] as String? ?? 'Map<String, String>',
  generateFirstSucceedResponse:
      json['generate_first_succeed_response'] as bool? ?? true,
  customAnnotations:
      (json['custom_annotations'] as List<dynamic>?)
          ?.map(
            (e) => CustomAnnotationMap.fromJson(
              Map<String, dynamic>.from(e as Map),
            ),
          )
          .toList() ??
      [],
);

Map<String, dynamic> _$GeneratorOptionsToJson(
  GeneratorOptions instance,
) => <String, dynamic>{
  'use_path_for_request_names': instance.usePathForRequestNames,
  'generate_first_succeed_response': instance.generateFirstSucceedResponse,
  'with_base_url': instance.withBaseUrl,
  'add_base_path_to_requests': instance.addBasePathToRequests,
  'include_null_query_vars': instance.includeNullQueryVars,
  'page_width': instance.pageWidth,
  'override_to_string': instance.overrideToString,
  'override_equals_and_hashcode': instance.overrideEqualsAndHashcode,
  'multipart_file_type': instance.multipartFileType,
  'urlencoded_file_type': instance.urlencodedFileType,
  'with_converter': instance.withConverter,
  'scalars': instance.scalars,
  'overriden_models': instance.overridenModels,
  'generate_to_json_for': instance.generateToJsonFor,
  'additional_headers': instance.additionalHeaders,
  'input_urls': instance.inputUrls,
  'nullable_models': instance.nullableModels,
  'separate_models': instance.separateModels,
  'use_required_attribute_for_headers': instance.useRequiredAttributeForHeaders,
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
  'import_paths': instance.importPaths,
  'custom_return_type': instance.customReturnType,
  'exclude_paths': instance.excludePaths,
  'custom_annotations': instance.customAnnotations,
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
  Map<String, dynamic> json,
) => ResponseOverrideValueMap(
  url: json['url'] as String? ?? '',
  method: json['method'] as String? ?? '',
  overriddenValue: json['overridden_value'] as String? ?? '',
);

Map<String, dynamic> _$ResponseOverrideValueMapToJson(
  ResponseOverrideValueMap instance,
) => <String, dynamic>{
  'url': instance.url,
  'method': instance.method,
  'overridden_value': instance.overriddenValue,
};

DefaultHeaderValueMap _$DefaultHeaderValueMapFromJson(
  Map<String, dynamic> json,
) => DefaultHeaderValueMap(
  headerName: json['header_name'] as String? ?? '',
  defaultValue: json['default_value'] as String? ?? '',
);

Map<String, dynamic> _$DefaultHeaderValueMapToJson(
  DefaultHeaderValueMap instance,
) => <String, dynamic>{
  'header_name': instance.headerName,
  'default_value': instance.defaultValue,
};

InputUrl _$InputUrlFromJson(Map<String, dynamic> json) => InputUrl(
  url: json['url'] as String,
  fileName: json['file_name'] as String?,
);

Map<String, dynamic> _$InputUrlToJson(InputUrl instance) => <String, dynamic>{
  'url': instance.url,
  'file_name': instance.fileName,
};

OverridenModelsItem _$OverridenModelsItemFromJson(Map<String, dynamic> json) =>
    OverridenModelsItem(
      fileName: json['file_name'] as String,
      overridenModels: (json['overriden_models'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      importUrl: json['import_url'] as String,
    );

Map<String, dynamic> _$OverridenModelsItemToJson(
  OverridenModelsItem instance,
) => <String, dynamic>{
  'file_name': instance.fileName,
  'overriden_models': instance.overridenModels,
  'import_url': instance.importUrl,
};

CustomScalar _$CustomScalarFromJson(Map<String, dynamic> json) => CustomScalar(
  type: json['type'] as String,
  deserialize: json['deserialize'] as String,
  serialize: json['serialize'] as String? ?? '',
);

Map<String, dynamic> _$CustomScalarToJson(CustomScalar instance) =>
    <String, dynamic>{
      'type': instance.type,
      'deserialize': instance.deserialize,
      'serialize': instance.serialize,
    };

CustomAnnotationMap _$CustomAnnotationMapFromJson(Map<String, dynamic> json) =>
    CustomAnnotationMap(
      typeName: json['type_name'] as String? ?? '',
      swaggerKey: json['swagger_key'] as String? ?? '',
    );

Map<String, dynamic> _$CustomAnnotationMapToJson(
  CustomAnnotationMap instance,
) => <String, dynamic>{
  'type_name': instance.typeName,
  'swagger_key': instance.swaggerKey,
};
