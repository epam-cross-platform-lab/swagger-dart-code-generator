import 'package:json_annotation/json_annotation.dart';

part 'swagger_info.g2.dart';

@JsonSerializable()
class SwaggerInfo {
  SwaggerInfo(
      {this.description = '', this.version = '', this.title = '', this.termsOfService = ''});

  factory SwaggerInfo.fromJson(Map<String, dynamic> json) =>
      _$SwaggerInfoFromJson(json);

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'version')
  String version;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'termsOfService')
  String termsOfService;

  Map<String, dynamic> toJson() => _$SwaggerInfoToJson(this);
}
