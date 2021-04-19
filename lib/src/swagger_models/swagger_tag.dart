import 'dart:core';
import 'package:json_annotation/json_annotation.dart';

part 'swagger_tag.g2.dart';

@JsonSerializable()
class SwaggerTag {
  SwaggerTag({this.name = '', this.description = ''});

  factory SwaggerTag.fromJson(Map<String, dynamic> json) =>
      _$SwaggerTagFromJson(json);

  @JsonKey(name: 'name', defaultValue: '')
  String name;

  @JsonKey(name: 'description', defaultValue: '')
  String description;

  Map<String, dynamic> toJson() => _$SwaggerTagToJson(this);
}
