import 'package:json_annotation/json_annotation.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/requests/parameter_item.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/requests/swagger_request_items.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/responses/swagger_schema.dart';

part 'swagger_request_parameter.g.dart';

@JsonSerializable()
class SwaggerRequestParameter {
  SwaggerRequestParameter({
    this.inParameter = '',
    this.name = '',
    this.description = '',
    this.isRequired = false,
    this.type = '',
    this.item,
    this.collectionFormat = '',
    this.items,
    this.schema,
    this.ref = '',
    this.key = '',
    this.enumValuesObj = const [],
    this.format,
  });

  @JsonKey(name: 'in')
  String inParameter;

  @JsonKey(name: 'format')
  String? format;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'required')
  bool isRequired;

  @JsonKey(name: '\$ref')
  String ref;

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'item')
  ParameterItem? item;

  @JsonKey(name: 'enum')
  List<Object?> enumValuesObj;

  List<String> get enumValues {
    return enumValuesObj.map((e) => e.toString()).toList();
  }

  @JsonKey(name: 'collectionFormat')
  String collectionFormat;

  @JsonKey(name: 'schema')
  SwaggerSchema? schema;

  @JsonKey(name: 'items')
  SwaggerRequestItems? items;

  String key;

  Map<String, dynamic> toJson() => _$SwaggerRequestParameterToJson(this);

  factory SwaggerRequestParameter.fromJson(Map<String, dynamic> json) =>
      _$SwaggerRequestParameterFromJson(json);
}
