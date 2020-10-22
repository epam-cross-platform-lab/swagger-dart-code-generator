import 'package:swagger_dart_code_generator/src/swagger_models/responses/item_schema.dart';

import '../responses/swagger_response.dart';
import 'swagger_request_parameter.dart';

class SwaggerRequest {
  SwaggerRequest(
      {this.type,
      this.summary,
      this.description,
      this.operationId,
      this.consumes,
      this.responses,
      this.parameters,
      this.requestBody});

  SwaggerRequest.fromJson(Map<String, dynamic> json)
      : summary = json['summary'] as String,
        description = json['description'] as String,
        operationId = json['operationId'] as String,
        consumes = (json['consumes'] as List<dynamic>)
                ?.map((dynamic e) => e.toString())
                ?.toList() ??
            <String>[],
        requestBody =
            RequestBody.fromJson(json['requestBody'] as Map<String, dynamic>),
        produces = (json['produces'] as List<dynamic>)
                ?.map((dynamic e) => e.toString())
                ?.toList() ??
            <String>[],
        responses = mapResponses(json['responses'] as Map<String, dynamic>) ??
            <SwaggerResponse>[],
        parameters = mapParameters(json['parameters'] as List<dynamic>) ??
            <SwaggerRequestParameter>[];

  String type;
  String summary;
  String description;
  String operationId;
  List<String> consumes;
  List<String> produces;
  List<SwaggerResponse> responses;
  List<SwaggerRequestParameter> parameters;
  RequestBody requestBody;

  static List<SwaggerRequestParameter> mapParameters(List<dynamic> map) {
    if (map == null) {
      return null;
    }
    final result = map
        .map((dynamic e) =>
            SwaggerRequestParameter.fromJson(e as Map<String, dynamic>))
        .toList();

    return result;
  }

  static List<SwaggerResponse> mapResponses(Map<String, dynamic> map) {
    final results = <SwaggerResponse>[];
    if (map == null) {
      return null;
    }
    for (var i = 0; i < map.keys.length; i++) {
      final key = map.keys.elementAt(i);
      final response =
          SwaggerResponse.fromJson(map[key] as Map<String, dynamic>);
      response.code = key;

      results.add(response);
    }

    return results;
  }
}

class RequestBody {
  RequestContent content;

  RequestBody({this.content});

  RequestBody.fromJson(Map<String, dynamic> json)
      : content = (json == null ||
                json['content'] == null ||
                json['content']['application/json'] == null)
            ? null
            : RequestContent.fromJson(
                json['content']['application/json'] as Map<String, dynamic>);
}

class RequestContent {
  RequestContent({this.items, this.ref, this.responseType, this.type});

  RequestContent.fromJson(Map<dynamic, dynamic> json)
      : responseType =
            json['schema'] != null ? json['schema']['type'] as String : '',
        items = json['schema'] != null && json['schema']['items'] != null
            ? ItemSchema.fromJson(
                json['schema']['items'] as Map<String, dynamic>)
            : null,
        ref = json['schema'] != null ? json['schema']['\$ref'] as String : null,
        type = json['schema'] != null ? json['schema']['type'] as String : null;

  final String responseType;
  final String type;
  final ItemSchema items;
  final String ref;
}
