import 'package:json_annotation/json_annotation.dart';
import 'package:swagger_dart_code_generator/src/code_generators/constants.dart';

part 'swagger_schema.g.dart';

@JsonSerializable()
class SwaggerSchema {
  SwaggerSchema({
    this.type = '',
    this.originalRef = '',
    this.enumValuesObj = const [],
    this.properties = const {},
    this.items,
    this.ref = '',
    this.defaultValue,
    this.format = '',
    this.schema,
    this.oneOf = const [],
    this.anyOf = const [],
    this.allOf = const [],
    this.required = const [],
    this.description = '',
    this.enumNames,
    this.isNullable,
    this.hasAdditionalProperties = false,
    this.msEnum,
    this.discriminator,
    this.title = '',
    this.readOnly = false,
    this.writeOnly = false,
    this.deprecated = false,    
  });

  @JsonKey(name: 'readOnly')
  bool readOnly;

  @JsonKey(name: 'writeOnly')
  bool writeOnly;

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'deprecated')
  bool deprecated;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'format')
  String format;

  @JsonKey(name: 'default')
  Object? defaultValue;

  @JsonKey(name: 'originalRef')
  String originalRef;

  bool get hasOriginalRef => originalRef.isNotEmpty;

  @JsonKey(name: '\$ref')
  String ref;

  bool get hasRef => ref.isNotEmpty;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'enum')
  List<Object?> enumValuesObj;

  @JsonKey(name: 'x-ms-enum')
  MsEnum? msEnum;

  @JsonKey(name: 'discriminator', defaultValue: null)
  Discriminator? discriminator;

  List<String> get enumValues {
    final values = (msEnum?.values.isNotEmpty == true
            ? msEnum?.values.map((e) => e.value)
            : enumValuesObj) ??
        [];

    return values.map((e) => e.toString()).toList();
  }

  bool get isEnum => enumValuesObj.isNotEmpty;

  bool get isListEnum => type == 'array' && items != null && items!.isEnum;

  @JsonKey(name: 'required', fromJson: _requiredFromJson)
  List<String> required;

  @JsonKey(name: 'items')
  SwaggerSchema? items;

  @JsonKey(name: 'properties')
  Map<String, SwaggerSchema> properties;

  @JsonKey(name: 'nullable')
  bool? isNullable;

  bool get shouldBeNullable => isNullable == true || readOnly || writeOnly;

  @JsonKey(name: 'schema')
  SwaggerSchema? schema;

  @JsonKey(name: 'oneOf')
  List<SwaggerSchema> oneOf;

  @JsonKey(name: 'anyOf')
  List<SwaggerSchema> anyOf;

  @JsonKey(name: 'allOf')
  List<SwaggerSchema> allOf;

  @JsonKey(name: 'additionalProperties', fromJson: _additionalsFromJson)
  bool hasAdditionalProperties;

  List<String>? enumNames;

  factory SwaggerSchema.fromJson(Map<String, dynamic> json) =>
      _$SwaggerSchemaFromJson(json)
        ..enumNames = ((json[kEnumNames] ?? json[kEnumVarnames]) as List?)
            ?.map((e) => e as String)
            .toList()
        ..isNullable = (json[kIsNullable] ?? json[kNullable] ?? false) as bool;

  Map<String, dynamic> toJson() => {
        ..._$SwaggerSchemaToJson(this),
        if (enumNames != null) kEnumNames: enumNames,
      };
}

bool _additionalsFromJson(dynamic value) => value != false;

List<String> _requiredFromJson(dynamic value) {
  if (value is List) {
    return value.map((e) => e as String).toList();
  }

  return [];
}

@JsonSerializable()
class MsEnum {
  @JsonKey(name: 'values')
  final List<MsEnumValue> values;

  const MsEnum({
    this.values = const [],
  });

  Map<String, dynamic> toJson() => _$MsEnumToJson(this);

  factory MsEnum.fromJson(Map<String, dynamic> json) => _$MsEnumFromJson(json);
}

@JsonSerializable()
class MsEnumValue {
  @JsonKey(name: 'value')
  final Object? value;

  const MsEnumValue({this.value = const []});

  Map<String, dynamic> toJson() => _$MsEnumValueToJson(this);

  factory MsEnumValue.fromJson(Map<String, dynamic> json) =>
      _$MsEnumValueFromJson(json);
}

@JsonSerializable()
class Discriminator {
  Discriminator({this.propertyName = '', this.mapping = const {}});

  @JsonKey(name: 'propertyName', defaultValue: '')
  String propertyName;
  @JsonKey(name: 'mapping', defaultValue: {})
  Map<String, String> mapping;

  factory Discriminator.fromJson(Map<String, dynamic> json) =>
      _$DiscriminatorFromJson(json);

  Map<String, dynamic> toJson() => _$DiscriminatorToJson(this);
}
