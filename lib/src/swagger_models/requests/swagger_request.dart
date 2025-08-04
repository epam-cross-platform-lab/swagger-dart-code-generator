import 'package:json_annotation/json_annotation.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/responses/swagger_schema.dart';

import '../responses/swagger_response.dart';
import 'swagger_request_parameter.dart';

part 'swagger_request.g.dart';

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
    this.security = const [],
    this.requestBody,
    this.deprecated = false,
    this.tags = const [],
  });

  @JsonKey(name: 'summary')
  String summary;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'deprecated')
  bool deprecated;

  @JsonKey(name: 'operationId')
  String operationId;

  @JsonKey(name: 'consumes')
  List<String> consumes;

  @JsonKey(name: 'produces')
  List<String> produces;

  @JsonKey(name: 'responses')
  Map<String, SwaggerResponse> responses;

  @JsonKey(name: 'security', fromJson: _securityFromJson)
  List<String> security;

  @JsonKey(name: 'parameters')
  List<SwaggerRequestParameter> parameters;

  @JsonKey(name: 'requestBody')
  RequestBody? requestBody;

  @JsonKey(name: 'tags', defaultValue: [])
  List<String> tags;

  Map<String, dynamic> toJson() => _$SwaggerRequestToJson(this);

  factory SwaggerRequest.fromJson(Map<String, dynamic> json) =>
      _$SwaggerRequestFromJson(json);
}

@JsonSerializable()
class RequestBody {
  @JsonKey(name: 'content', fromJson: _contentFromJson)
  RequestContent? content;

  @JsonKey(name: '\$ref')
  String ref;

  bool get hasRef => ref.isNotEmpty;

  RequestBody({
    this.content,
    this.ref = '',
  });

  Map<String, dynamic> toJson() => _$RequestBodyToJson(this);

  factory RequestBody.fromJson(Map<String, dynamic> json) =>
      _$RequestBodyFromJson(json);
}

RequestContent? _contentFromJson(Map<String, dynamic>? map) {
  if (map == null || map.isEmpty) {
    return null;
  }

  if (map.containsKey('multipart/form-data') &&
      !map.containsKey('application/json') &&
      !map.containsKey('application/x-www-form-urlencoded')) {
    final multipart =
        map['multipart/form-data']['schema'] as Map<String, dynamic>;
    return RequestContent(
        isMultipart: true, schema: SwaggerSchema.fromJson(multipart));
  }

  if (map.containsKey('application/x-www-form-urlencoded') &&
      !map.containsKey('application/json') &&
      !map.containsKey('multipart/form-data')) {
    final multipart = map['application/x-www-form-urlencoded']['schema']
        as Map<String, dynamic>;
    return RequestContent(
        isUrlencoded: true, schema: SwaggerSchema.fromJson(multipart));
  }

  final content = map.values.first as Map<String, dynamic>;

  return RequestContent.fromJson(content);
}

@JsonSerializable()
class RequestContent {
  RequestContent({
    this.isMultipart,
    this.isUrlencoded,
    this.schema,
  });

  @JsonKey(name: 'schema')
  final SwaggerSchema? schema;

  final bool? isMultipart;
  final bool? isUrlencoded;

  Map<String, dynamic> toJson() => _$RequestContentToJson(this);

  factory RequestContent.fromJson(Map<String, dynamic> json) =>
      _$RequestContentFromJson(json);
}

List<String> _securityFromJson(List? map) {
  if (map == null) {
    return [];
  }

  final result = map
      .map((e) => (e as Map<String, dynamic>?)?.keys)
      .expand((ee) => ee?.toList() ?? <String>[])
      .toList();

  return result;
}
