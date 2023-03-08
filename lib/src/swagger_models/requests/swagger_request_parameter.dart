import 'package:json_annotation/json_annotation.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/requests/parameter_item.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/requests/swagger_request_items.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/responses/swagger_schema.dart';

part 'swagger_request_parameter.g2.dart';

@JsonSerializable()
class SwaggerRequestParameter {
  SwaggerRequestParameter(
      {this.inParameter = '',
      this.name = '',
      this.description = '',
      this.isRequired = false,
      this.type = '',
      this.item,
      this.collectionFormat = '',
      this.items,
      this.schema,
      this.ref = '',
      this.key = ''});

  @JsonKey(name: 'in', defaultValue: '')
  String inParameter;

  @JsonKey(name: 'name', defaultValue: '')
  String name;

  @JsonKey(name: 'description', defaultValue: '')
  String description;

  @JsonKey(name: 'required', defaultValue: false)
  bool isRequired;

  @JsonKey(name: '\$ref', defaultValue: '')
  String ref;

  @JsonKey(name: 'type', defaultValue: '')
  String type;

  @JsonKey(name: 'item')
  ParameterItem? item;

  @JsonKey(name: 'collectionFormat', defaultValue: '')
  String collectionFormat;

  @JsonKey(name: 'schema')
  SwaggerSchema? schema;

  @JsonKey(name: 'items')
  SwaggerRequestItems? items;

  @JsonKey(defaultValue: '')
  String key;

  Map<String, dynamic> toJson() => _$SwaggerRequestParameterToJson(this);

  factory SwaggerRequestParameter.fromJson(Map<String, dynamic> json) =>
      _$SwaggerRequestParameterFromJson(json);
}
