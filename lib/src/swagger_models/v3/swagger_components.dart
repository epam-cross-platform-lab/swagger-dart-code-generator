import 'package:json_annotation/json_annotation.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/v3/requests/swagger_request_parameter.dart';

part 'swagger_components.g2.dart';

@JsonSerializable()
class SwaggerComponents {
  SwaggerComponents({this.parameters});

  factory SwaggerComponents.fromJson(Map<String, dynamic> json) =>
      _$SwaggerComponentsFromJson(json);

  @JsonKey(name: 'parameters')
  List<SwaggerRequestParameter> parameters;

  Map<String, dynamic> toJson() => _$SwaggerComponentsToJson(this);
}
