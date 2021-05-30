import 'package:json_annotation/json_annotation.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/responses/swagger_schema.dart';

part 'swagger_response.g2.dart';

@JsonSerializable()
class SwaggerResponse {
  SwaggerResponse({
    this.description = '',
    this.type = '',
    this.schema,
    this.enumValue = const [],
    this.content = const [],
    this.ref = '',
  });

  @JsonKey(name: 'ref', defaultValue: '')
  String ref;

  @JsonKey(name: 'description', defaultValue: '')
  String description;

  @JsonKey(name: 'type', defaultValue: '')
  String type;

  @JsonKey(name: 'schema')
  SwaggerSchema? schema;

  @JsonKey(name: 'enumValue', defaultValue: [])
  List<String> enumValue;

  @JsonKey(name: 'content', defaultValue: [])
  List<Content> content;

  Map<String, dynamic> toJson() => _$SwaggerResponseToJson(this);

  factory SwaggerResponse.fromJson(Map<String, dynamic> json) =>
      _$SwaggerResponseFromJson(json);
}

@JsonSerializable()
class Content {
  Content({
    this.items,
    this.ref = '',
    this.responseType = '',
    this.type = '',
  });

  @JsonKey(name: 'responseType', defaultValue: '')
  final String responseType;

  @JsonKey(name: 'type', defaultValue: '')
  final String type;

  @JsonKey(name: 'items')
  final SwaggerSchema? items;

  @JsonKey(name: 'ref', defaultValue: '')
  final String ref;

  Map<String, dynamic> toJson() => _$ContentToJson(this);

  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);
}
