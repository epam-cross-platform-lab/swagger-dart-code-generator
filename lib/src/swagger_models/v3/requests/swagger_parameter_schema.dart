import 'package:json_annotation/json_annotation.dart';

part 'swagger_parameter_schema.g2.dart';

@JsonSerializable()
class SwaggerParameterSchema {
  SwaggerParameterSchema(
      {this.type, this.ref, this.enumValues, this.originalRef});

  factory SwaggerParameterSchema.fromJson(Map<String, dynamic> json) =>
      _$SwaggerParameterSchemaFromJson(json);

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: '\$ref')
  String ref;

  @JsonKey(name: 'enum')
  List<String> enumValues;

  @JsonKey(name: 'originalRef')
  String originalRef;

  Map<String, dynamic> toJson() => _$SwaggerParameterSchemaToJson(this);
}
