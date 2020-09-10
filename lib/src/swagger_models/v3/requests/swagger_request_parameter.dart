import 'package:json_annotation/json_annotation.dart';
import 'package:swagger_generator/src/swagger_models/v3/requests/parameter_item.dart';
import 'package:swagger_generator/src/swagger_models/v3/requests/swagger_parameter_schema.dart';
import 'package:swagger_generator/src/swagger_models/v3/requests/swagger_request_items.dart';

part 'swagger_request_parameter.g2.dart';

@JsonSerializable()
class SwaggerRequestParameter {
  SwaggerRequestParameter(
      {this.inParameter,
      this.name,
      this.description,
      this.isRequired,
      this.type,
      this.item,
      this.collectionFormat,
      this.items,
      this.schema,
      this.ref});

  factory SwaggerRequestParameter.fromJson(Map<String, dynamic> json) =>
      _$SwaggerRequestParameterFromJson(json);

  @JsonKey(name: 'in')
  String inParameter;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'required', defaultValue: false)
  bool isRequired;

  @JsonKey(name: '\$ref')
  String ref;

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'item')
  ParameterItem item;

  @JsonKey(name: 'collectionFormat')
  String collectionFormat;

  @JsonKey(name: 'schema')
  SwaggerParameterSchema schema;

  @JsonKey(name: 'items')
  SwaggerRequestItems items;

  Map<String, dynamic> toJson() => _$SwaggerRequestParameterToJson(this);
}
