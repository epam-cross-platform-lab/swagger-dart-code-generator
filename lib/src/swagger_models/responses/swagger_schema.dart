import 'package:json_annotation/json_annotation.dart';
import 'package:swagger_dart_code_generator/src/code_generators/constants.dart';

part 'swagger_schema.g2.dart';

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
    this.isNullable = false,
    this.hasAdditionalProperties = false,
    this.discriminator,
  });

  @JsonKey(name: 'type', defaultValue: '')
  String type;

  @JsonKey(name: 'format', defaultValue: '')
  String format;

  @JsonKey(name: 'default', defaultValue: null)
  Object? defaultValue;

  @JsonKey(name: 'originalRef', defaultValue: '')
  String originalRef;

  bool get hasOriginalRef => originalRef.isNotEmpty;

  @JsonKey(name: '\$ref', defaultValue: '')
  String ref;

  bool get hasRef => ref.isNotEmpty;

  @JsonKey(name: 'description', defaultValue: '')
  String description;

  @JsonKey(name: 'enum', defaultValue: [])
  List<Object?> enumValuesObj;

  List<String> get enumValues =>
      enumValuesObj.map((e) => e.toString()).toList();

  bool get isEnum => enumValuesObj.isNotEmpty;

  bool get isListEnum => type == 'array' && items != null && items!.isEnum;

  @JsonKey(name: 'required', fromJson: _requiredFromJson)
  List<String> required;

  @JsonKey(name: 'items')
  SwaggerSchema? items;

  @JsonKey(name: 'properties', defaultValue: {})
  Map<String, SwaggerSchema> properties;

  @JsonKey(name: 'discriminator', defaultValue: null)
  Discriminator? discriminator;

  @JsonKey(name: 'nullable', defaultValue: false)
  bool isNullable;

  @JsonKey(name: 'schema')
  SwaggerSchema? schema;

  @JsonKey(name: 'oneOf', defaultValue: [])
  List<SwaggerSchema> oneOf;

  @JsonKey(name: 'anyOf', defaultValue: [])
  List<SwaggerSchema> anyOf;

  @JsonKey(name: 'allOf', defaultValue: [])
  List<SwaggerSchema> allOf;

  @JsonKey(
      name: 'additionalProperties',
      defaultValue: false,
      fromJson: _additionalsFromJson)
  bool hasAdditionalProperties;

  List<String>? enumNames;

  factory SwaggerSchema.fromJson(Map<String, dynamic> json) =>
      _$SwaggerSchemaFromJson(json)
        ..enumNames = ((json[kEnumNames] ?? json[kEnumVarnames]) as List?)
            ?.map((e) => e as String)
            .toList()
        ..isNullable =
            (json[kIsNullable] ?? json[kIsNullable] ?? false) as bool;

  Map<String, dynamic> toJson() => {
        ..._$SwaggerSchemaToJson(this),
        if (enumNames != null) kEnumNames: enumNames,
      };
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

bool _additionalsFromJson(dynamic value) => value != false;

List<String> _requiredFromJson(dynamic value) {
  if (value is List) {
    return value.map((e) => e as String).toList();
  }

  return [];
}
