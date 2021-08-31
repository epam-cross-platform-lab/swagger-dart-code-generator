import 'package:swagger_dart_code_generator/src/swagger_models/requests/swagger_request_parameter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/responses/swagger_schema.dart';

part 'swagger_components.g2.dart';

@JsonSerializable()
class SwaggerComponents {
  SwaggerComponents({
    required this.parameters,
    required this.schemas,
    required this.responses,
    required this.requestBodies,
  });

  @JsonKey(name: 'parameters', defaultValue: {})
  Map<String, SwaggerRequestParameter> parameters;

  @JsonKey(name: 'schemas', defaultValue: {})
  Map<String, SwaggerSchema> schemas;

  @JsonKey(name: 'responses', fromJson: _mapResponses)
  Map<String, SwaggerSchema> responses;

  @JsonKey(name: 'requestBodies', fromJson: _mapResponses)
  Map<String, SwaggerSchema> requestBodies;

  Map<String, dynamic> toJson() => _$SwaggerComponentsToJson(this);

  factory SwaggerComponents.fromJson(Map<String, dynamic> json) =>
      _$SwaggerComponentsFromJson(json);
}

Map<String, SwaggerSchema> _mapResponses(Map<String, dynamic>? json) {
  var results = <String, SwaggerSchema>{};

  if (json == null) {
    return results;
  }

  json.forEach((key, value) {
    final content =
        (value as Map<String, dynamic>)['content'] as Map<String, dynamic>?;

    Map<String, dynamic>? appJson;

    if (content?.length == 1) {
      appJson = content?.values.first as Map<String, dynamic>?;
    } else {
      appJson = content?['application/json'] as Map<String, dynamic>?;
    }

    if (appJson != null && appJson['schema'] != null) {
      results[key] =
          SwaggerSchema.fromJson(appJson['schema'] as Map<String, dynamic>);
    }
  });

  return results;
}
