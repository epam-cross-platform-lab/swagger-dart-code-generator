import 'package:json_annotation/json_annotation.dart';

part 'swagger_schema.g.dart';

@JsonSerializable()
class SwaggerSchema {
  SwaggerSchema({
    required this.type,
    required this.originalRef,
    required this.enumValues,
    required this.properties,
    required this.items,
    required this.ref,
    required this.defaultValue,
    required this.format,
    required this.schema,
    required this.oneOf,
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

  @JsonKey(name: 'enum', defaultValue: [])
  List<String> enumValues;

  @JsonKey(name: 'items')
  SwaggerSchema? items;

  @JsonKey(name: 'properties', defaultValue: {})
  Map<String, SwaggerSchema> properties;

  @JsonKey(name: 'schema')
  SwaggerSchema? schema;

  @JsonKey(name: 'oneOf', defaultValue: [])
  List<SwaggerSchema> oneOf;

  factory SwaggerSchema.fromJson(Map<String, dynamic> json) =>
      _$SwaggerSchemaFromJson(json);

  Map<String, dynamic> toJson() => _$SwaggerSchemaToJson(this);
}
