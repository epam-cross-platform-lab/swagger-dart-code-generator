import 'package:json_annotation/json_annotation.dart';

part 'generator_options.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, anyMap: true)
class GeneratorOptions {
  /// Instantiate generator options.
  GeneratorOptions({
    this.withBaseUrl = true,
    this.addBasePathToRequests = false,
    this.withConverter = true,
    this.ignoreHeaders = false,
    this.separateModels = false,
    this.classesWithNullabeLists = const [],
    this.buildOnlyModels = false,
    this.defaultValuesMap = const <DefaultValueMap>[],
    this.defaultHeaderValuesMap = const <DefaultHeaderValueMap>[],
    this.responseOverrideValueMap = const <ResponseOverrideValueMap>[],
    required this.inputFolder,
    required this.outputFolder,
    this.enumsCaseSensitive = true,
    this.useRequiredAttributeForHeaders = true,
    this.usePathForRequestNames = true,
    this.includeIfNull,
    this.modelPostfix = '',
    this.customReturnType = '',
    this.includePaths = const [],
    this.importPaths = const [],
    this.excludePaths = const [],
    this.inputUrls = const [],
    this.nullableModels = const [],
    this.cutFromModelNames = '',
    this.additionalHeaders = const [],
    this.overrideEqualsAndHashcode = true,
    this.overrideToString = true,
    this.pageWidth,
    this.scalars = const {},
    this.overridenModels = const [],
    this.generateToJsonFor = const [],
    this.includeNullQueryVars = false,
    this.multipartFileType = 'List<int>',
    this.urlencodedFileType = 'Map<String, String>',
    this.generateFirstSucceedResponse = true,
    this.customAnnotations = const[],
  });

  /// Build options from a JSON map.
  factory GeneratorOptions.fromJson(Map<String, dynamic> json) =>
      _$GeneratorOptionsFromJson(json);

  final bool usePathForRequestNames;
  final bool generateFirstSucceedResponse;
  final bool withBaseUrl;
  final bool addBasePathToRequests;
  final bool includeNullQueryVars;
  final int? pageWidth;
  final bool overrideToString;
  final bool overrideEqualsAndHashcode;
  final String multipartFileType;
  final String urlencodedFileType;
  final bool withConverter;
  final Map<String, CustomScalar> scalars;
  final List<OverridenModelsItem> overridenModels;
  final List<String> generateToJsonFor;
  final List<String> additionalHeaders;
  final List<InputUrl> inputUrls;
  final List<String> nullableModels;
  final bool separateModels;
  final bool useRequiredAttributeForHeaders;
  final bool ignoreHeaders;
  final bool enumsCaseSensitive;
  final bool? includeIfNull;
  final String inputFolder;
  final String outputFolder;
  final List<String> classesWithNullabeLists;
  final String cutFromModelNames;
  final bool buildOnlyModels;
  final String modelPostfix;
  final List<DefaultValueMap> defaultValuesMap;
  final List<DefaultHeaderValueMap> defaultHeaderValuesMap;
  final List<ResponseOverrideValueMap> responseOverrideValueMap;
  final List<String> includePaths;
  final List<String> importPaths;
  final String customReturnType;
  final List<String> excludePaths;

  @JsonKey(defaultValue: <CustomAnnotationMap>[])
  final List<CustomAnnotationMap> customAnnotations;
  /// Convert this options instance to JSON.
  Map<String, dynamic> toJson() => _$GeneratorOptionsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class DefaultValueMap {
  DefaultValueMap({required this.typeName, required this.defaultValue});

  /// Build a default value map from a JSON map.
  factory DefaultValueMap.fromJson(Map<String, dynamic> json) =>
      _$DefaultValueMapFromJson(json);

  @JsonKey(defaultValue: '')
  final String typeName;

  @JsonKey(defaultValue: '')
  final String defaultValue;

  /// Convert this default value map instance to JSON.
  Map<String, dynamic> toJson() => _$DefaultValueMapToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ResponseOverrideValueMap {
  ResponseOverrideValueMap(
      {required this.url, required this.method, required this.overriddenValue});

  /// Build a default value map from a JSON map.
  factory ResponseOverrideValueMap.fromJson(Map<String, dynamic> json) =>
      _$ResponseOverrideValueMapFromJson(json);

  @JsonKey(defaultValue: '')
  final String url;

  @JsonKey(defaultValue: '')
  final String method;

  @JsonKey(defaultValue: '')
  final String overriddenValue;

  /// Convert this default value map instance to JSON.
  Map<String, dynamic> toJson() => _$ResponseOverrideValueMapToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class DefaultHeaderValueMap {
  DefaultHeaderValueMap({required this.headerName, required this.defaultValue});

  @JsonKey(defaultValue: '')
  final String headerName;

  @JsonKey(defaultValue: '')
  final String defaultValue;

  Map<String, dynamic> toJson() => _$DefaultHeaderValueMapToJson(this);

  factory DefaultHeaderValueMap.fromJson(Map<String, dynamic> json) =>
      _$DefaultHeaderValueMapFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class InputUrl {
  InputUrl({
    required this.url,
    this.fileName,
  });

  @JsonKey()
  final String url;

  @JsonKey()
  final String? fileName;

  Map<String, dynamic> toJson() => _$InputUrlToJson(this);

  factory InputUrl.fromJson(Map<String, dynamic> json) =>
      _$InputUrlFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class OverridenModelsItem {
  @JsonKey()
  final String fileName;
  @JsonKey()
  final List<String> overridenModels;
  @JsonKey()
  final String importUrl;

  OverridenModelsItem({
    required this.fileName,
    required this.overridenModels,
    required this.importUrl,
  });

  Map<String, dynamic> toJson() => _$OverridenModelsItemToJson(this);

  factory OverridenModelsItem.fromJson(Map<String, dynamic> json) =>
      _$OverridenModelsItemFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class CustomScalar {
  @JsonKey()
  final String type;
  @JsonKey()
  final String deserialize;
  @JsonKey(defaultValue: '')
  final String serialize;

  factory CustomScalar.fromJson(Map<String, dynamic> json) =>
      _$CustomScalarFromJson(json);

  CustomScalar({
    required this.type,
    required this.deserialize,
    this.serialize = '',
  });

  Map<String, dynamic> toJson() => _$CustomScalarToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class CustomAnnotationMap {
  CustomAnnotationMap({required this.typeName, required this.swaggerKey});

  /// Build a default value map from a JSON map.
  factory CustomAnnotationMap.fromJson(Map<String, dynamic> json) =>
      _$CustomAnnotationMapFromJson(json);

  @JsonKey(defaultValue: '')
  final String typeName;

  @JsonKey(defaultValue: '')
  final String swaggerKey;

  /// Convert this default value map instance to JSON.
  Map<String, dynamic> toJson() => _$CustomAnnotationMapToJson(this);
}
