import 'package:json_annotation/json_annotation.dart';
part 'generator_options.g2.dart';

@JsonSerializable(fieldRename: FieldRename.snake, anyMap: true)
class GeneratorOptions {
  /// Instantiate generator options.
  GeneratorOptions(
      {this.withBaseUrl = true,
      this.withConverter = true,
      this.ignoreHeaders = false,
      this.useDefaultNullForLists = false,
      this.buildOnlyModels = false,
      this.defaultValuesMap = const <DefaultValueMap>[],
      this.responseOverrideValueMap = const <ResponseOverrideValueMap>[],
      this.inputFolder,
      this.outputFolder,
      this.enumsCaseSensitive = true});

  /// Build options from a JSON map.
  factory GeneratorOptions.fromJson(Map<String, dynamic> json) =>
      _$GeneratorOptionsFromJson(json);

  @JsonKey(defaultValue: true)
  final bool withBaseUrl;

  @JsonKey(defaultValue: true)
  final bool withConverter;

  @JsonKey(defaultValue: false)
  final bool ignoreHeaders;

  @JsonKey(defaultValue: false)
  final bool enumsCaseSensitive;

  @JsonKey(defaultValue: '')
  final String inputFolder;

  @JsonKey(defaultValue: '')
  final String outputFolder;

  @JsonKey(defaultValue: false)
  final bool useDefaultNullForLists;

  @JsonKey(defaultValue: false)
  final bool buildOnlyModels;

  @JsonKey(defaultValue: <DefaultValueMap>[])
  final List<DefaultValueMap> defaultValuesMap;

  @JsonKey(defaultValue: <ResponseOverrideValueMap>[])
  final List<ResponseOverrideValueMap> responseOverrideValueMap;

  /// Convert this options instance to JSON.
  Map<String, dynamic> toJson() => _$GeneratorOptionsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class DefaultValueMap {
  DefaultValueMap({this.typeName, this.defaultValue});

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
  ResponseOverrideValueMap({this.url, this.method, this.overridenValue});

  /// Build a default value map from a JSON map.
  factory ResponseOverrideValueMap.fromJson(Map<String, dynamic> json) =>
      _$ResponseOverrideValueMapFromJson(json);

  @JsonKey(defaultValue: '')
  final String url;

  @JsonKey(defaultValue: '')
  final String method;

  @JsonKey(defaultValue: '')
  final String overridenValue;

  /// Convert this default value map instance to JSON.
  Map<String, dynamic> toJson() => _$ResponseOverrideValueMapToJson(this);
}
