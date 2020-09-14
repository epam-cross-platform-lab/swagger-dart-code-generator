import 'package:swagger_dart_code_generator/src/swagger_models/v3/requests/swagger_request_parameter.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/v3/responses/swagger_response.dart';

class SwaggerRequest {
  SwaggerRequest(
      {this.type,
      this.summary,
      this.description,
      this.operationId,
      this.consumes,
      this.produces,
      this.responses,
      this.parameters});

  SwaggerRequest.fromJson(Map<String, dynamic> json)
      : summary = json['summary'] as String,
        description = json['description'] as String,
        operationId = json['operationId'] as String,
        consumes = (json['consumes'] as List<dynamic>)
                ?.map((dynamic e) => e.toString())
                ?.toList() ??
            <String>[],
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
