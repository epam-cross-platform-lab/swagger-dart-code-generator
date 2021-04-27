import 'package:json_annotation/json_annotation.dart';

part 'swagger_parameter_schema.g2.dart';

@JsonSerializable()
class SwaggerParameterSchema {
  SwaggerParameterSchema(
      {this.type = '',
      this.enumValues = const [],
      this.originalRef = '',
      this.ref = ''});

  factory SwaggerParameterSchema.fromJson(Map<String, dynamic> json) =>
      _$SwaggerParameterSchemaFromJson(json);

  @JsonKey(name: 'type', defaultValue: '')
  String type;

  @JsonKey(name: 'enum', fromJson: enumsFromJson)
  List<String> enumValues;

  @JsonKey(name: 'originalRef', defaultValue: '')
  String originalRef;

  @JsonKey(name: '\$ref', defaultValue: '')
  String ref;

  Map<String, dynamic> toJson() => _$SwaggerParameterSchemaToJson(this);

  static List<String> enumsFromJson(List? list) =>
      list?.map((e) => e.toString()).toList() ?? [];
}
