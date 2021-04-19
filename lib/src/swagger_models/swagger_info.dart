import 'package:json_annotation/json_annotation.dart';

part 'swagger_info.g2.dart';

@JsonSerializable()
class SwaggerInfo {
  SwaggerInfo(
      {this.description = '', this.version = '', this.title = '', this.termsOfService = ''});

  factory SwaggerInfo.fromJson(Map<String, dynamic> json) =>
      _$SwaggerInfoFromJson(json);

  @JsonKey(name: 'description', defaultValue: '')
  String description;

  @JsonKey(name: 'version', defaultValue: '')
  String version;

  @JsonKey(name: 'title', defaultValue: '')
  String title;

  @JsonKey(name: 'termsOfService', defaultValue: '')
  String termsOfService;

  Map<String, dynamic> toJson() => _$SwaggerInfoToJson(this);
}
