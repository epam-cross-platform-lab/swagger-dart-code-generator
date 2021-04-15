import 'dart:core';
import 'package:json_annotation/json_annotation.dart';

part 'swagger_tag.g.dart';

@JsonSerializable()
class SwaggerTag {
  SwaggerTag({this.name = '', this.description = ''});

  factory SwaggerTag.fromJson(Map<String, dynamic> json) =>
      _$SwaggerTagFromJson(json);

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'description')
  String description;

  Map<String, dynamic> toJson() => _$SwaggerTagToJson(this);
}
