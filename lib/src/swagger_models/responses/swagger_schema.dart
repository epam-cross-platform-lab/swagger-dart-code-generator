import 'package:json_annotation/json_annotation.dart';

part 'swagger_schema.g2.dart';

@JsonSerializable()
class SwaggerSchema {
  SwaggerSchema({
    required this.type,
    required this.originalRef,
    required this.enumValuesObj,
    required this.properties,
    required this.items,
    required this.ref,
    required this.defaultValue,
    required this.format,
    required this.isNullable,
    required this.schema,
    required this.oneOf,
    required this.anyOf,
    required this.description,
  });

  @JsonKey(name: 'type', defaultValue: '')
  String type;

  @JsonKey(name: 'format', defaultValue: '')
  String format;

  @JsonKey(name: 'default', defaultValue: null)
  Object? defaultValue;

  @JsonKey(name: 'originalRef', defaultValue: '')
  String originalRef;

  @JsonKey(name: '\$ref', defaultValue: '')
  String ref;

  @JsonKey(name: 'description', defaultValue: '')
  String description;

  @JsonKey(name: 'enum', defaultValue: [])
  List<Object?> enumValuesObj;

  List<String> get enumValues =>
      enumValuesObj.map((e) => e.toString()).toList();

  @JsonKey(name: 'items')
  SwaggerSchema? items;

  @JsonKey(name: 'properties', defaultValue: {})
  Map<String, SwaggerSchema> properties;

  @JsonKey(name: 'nullable', defaultValue: false)
  bool isNullable;

  @JsonKey(name: 'schema')
  SwaggerSchema? schema;

  @JsonKey(name: 'oneOf', defaultValue: [])
  List<SwaggerSchema> oneOf;

  @JsonKey(name: 'anyOf', defaultValue: [])
  List<SwaggerSchema> anyOf;

  factory SwaggerSchema.fromJson(Map<String, dynamic> json) =>
      _$SwaggerSchemaFromJson(json);

  Map<String, dynamic> toJson() => _$SwaggerSchemaToJson(this);
}
