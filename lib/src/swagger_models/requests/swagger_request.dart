import 'package:json_annotation/json_annotation.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/responses/swagger_schema.dart';

import '../responses/swagger_response.dart';
import 'swagger_request_parameter.dart';

part 'swagger_request.g2.dart';

@JsonSerializable()
class SwaggerRequest {
  SwaggerRequest({
    this.summary = '',
    this.description = '',
    this.operationId = '',
    this.consumes = const [],
    this.responses = const {},
    this.parameters = const [],
    this.produces = const [],
    this.requestBody,
  });

  @JsonKey(name: 'summary', defaultValue: '')
  String summary;

  @JsonKey(name: 'description', defaultValue: '')
  String description;

  @JsonKey(name: 'operationId', defaultValue: '')
  String operationId;

  @JsonKey(name: 'consumes', defaultValue: [])
  List<String> consumes;

  @JsonKey(name: 'produces', defaultValue: [])
  List<String> produces;

  @JsonKey(name: 'responses', defaultValue: {})
  Map<String, SwaggerResponse> responses;

  @JsonKey(name: 'parameters', defaultValue: [])
  List<SwaggerRequestParameter> parameters;

  @JsonKey(name: 'requestBody')
  RequestBody? requestBody;

  Map<String, dynamic> toJson() => _$SwaggerRequestToJson(this);

  factory SwaggerRequest.fromJson(Map<String, dynamic> json) =>
      _$SwaggerRequestFromJson(json);
}

@JsonSerializable()
class RequestBody {
  @JsonKey(name: 'content', fromJson: _contentFromJson)
  RequestContent? content;

  @JsonKey(name: 'ref', defaultValue: '')
  String ref;

  RequestBody({
    this.content,
    this.ref = '',
  });

  Map<String, dynamic> toJson() => _$RequestBodyToJson(this);

  factory RequestBody.fromJson(Map<String, dynamic> json) =>
      _$RequestBodyFromJson(json);
}

RequestContent? _contentFromJson(Map<String, dynamic>? map) {
  if (map == null) {
    return null;
  }

  final content = map.values.first as Map<String, dynamic>;

  return RequestContent.fromJson(content);
}

@JsonSerializable()
class RequestContent {
  RequestContent({
    this.schema,
  });

  @JsonKey(name: 'schema')
  final SwaggerSchema? schema;

  Map<String, dynamic> toJson() => _$RequestContentToJson(this);

  factory RequestContent.fromJson(Map<String, dynamic> json) =>
      _$RequestContentFromJson(json);
}
