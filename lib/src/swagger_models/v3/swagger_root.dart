import 'package:swagger_dart_code_generator/src/swagger_models/v3/requests/swagger_request.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/v3/requests/swagger_request_parameter.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/v3/swagger_components.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/v3/swagger_info.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/v3/swagger_path.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/v3/swagger_tag.dart';

class SwaggerRoot {
  SwaggerRoot(
      {this.basePath,
      this.components,
      this.host,
      this.info,
      this.paths,
      this.schemes,
      this.tags});

  SwaggerRoot.fromJson(Map<String, dynamic> json)
      : info = json.containsKey('info')
            ? SwaggerInfo.fromJson(json['info'] as Map<String, dynamic>)
            : null,
        host = json['host'] as String,
        basePath = json['basePath'] as String,
        tags = json.containsKey('tags')
            ? mapTags(json['tags'] as List<dynamic>)
            : <SwaggerTag>[],
        paths = json.containsKey('paths')
            ? mapPaths(json['paths'] as Map<String, dynamic>)
            : <SwaggerPath>[],
        components = json.containsKey('components')
            ? SwaggerComponents.fromJson(
                json['components'] as Map<String, dynamic>)
            : null;

  SwaggerInfo info;
  String host;
  String basePath;
  List<SwaggerTag> tags;
  List<String> schemes;
  List<SwaggerPath> paths;
  SwaggerComponents components;

  static List<SwaggerTag> mapTags(List<dynamic> map) {
    return map
        .map((dynamic e) => SwaggerTag.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  static List<SwaggerPath> mapPaths(Map<String, dynamic> map) {
    final List<SwaggerPath> results = <SwaggerPath>[];

    for (int i = 0; i < map.keys.length; i++) {
      final String key = map.keys.elementAt(i);
      final Map<String, dynamic> value = map[key] as Map<String, dynamic>;

      final SwaggerPath path = SwaggerPath(path: key);
      path.requests = <SwaggerRequest>[];
      path.parameters = <SwaggerRequestParameter>[];
      if (value.containsKey('parameters')) {
        final List<dynamic> list = value['parameters'] as List<dynamic>;
        for (int k = 0; k < list.length; k++) {
          final SwaggerRequestParameter parameter =
              SwaggerRequestParameter.fromJson(list[k] as Map<String, dynamic>);
          path.parameters.add(parameter);
        }
      }
      for (int j = 0; j < value.keys.length; j++) {
        final String requestKey = value.keys.elementAt(j);
        if (requestKey.contains('parameters')) {
          continue;
        }
        final SwaggerRequest request =
            SwaggerRequest.fromJson(value[requestKey] as Map<String, dynamic>);
        request.parameters.addAll(path.parameters);
        request.type = requestKey;

        path.requests.add(request);
      }
      results.add(path);
    }

    return results;
  }
}
