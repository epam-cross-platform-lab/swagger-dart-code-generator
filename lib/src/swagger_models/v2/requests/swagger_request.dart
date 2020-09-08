import '../responses/swagger_response.dart';
import 'swagger_request_parameter.dart';

class SwaggerRequest {
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
    final List<SwaggerRequestParameter> result = map
        .map((dynamic e) =>
            SwaggerRequestParameter.fromJson(e as Map<String, dynamic>))
        .toList();

    return result;
  }

  static List<SwaggerResponse> mapResponses(Map<String, dynamic> map) {
    final List<SwaggerResponse> results = <SwaggerResponse>[];
    if (map == null) {
      return null;
    }
    for (int i = 0; i < map.keys.length; i++) {
      final String key = map.keys.elementAt(i);
      final SwaggerResponse response =
          SwaggerResponse.fromJson(map[key] as Map<String, dynamic>);
      response.code = key;

      results.add(response);
    }

    return results;
  }
}
