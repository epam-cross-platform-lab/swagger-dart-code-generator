import 'package:swagger_dart_code_generator/src/swagger_models/requests/swagger_request.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/requests/swagger_request_parameter.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/swagger_components.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/swagger_info.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/swagger_path.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/swagger_tag.dart';

class SwaggerRoot {
  SwaggerRoot(
      {this.basePath = '',
      this.components,
      this.info,
      this.host = '',
      this.paths = const [],
      this.tags = const [],
      this.schemes = const [],
      this.parameters = const []});

  SwaggerRoot.fromJson(Map<String, dynamic> json)
      : info = json.containsKey('info')
            ? SwaggerInfo.fromJson(json['info'] as Map<String, dynamic>)
            : null,
        schemes = [],
        host = json['host'] as String? ?? '',
        basePath = json['basePath'] as String? ?? '',
        tags = json.containsKey('tags')
            ? mapTags(json['tags'] as List<dynamic>)
            : <SwaggerTag>[],
        paths = json.containsKey('paths')
            ? mapPaths(json['paths'] as Map<String, dynamic>)
            : <SwaggerPath>[],
        parameters = json.containsKey('parameters')
            ? mapParameters(json['parameters'] as Map<String, dynamic>)
            : <SwaggerRequestParameter>[],
        components = json.containsKey('components')
            ? SwaggerComponents.fromJson(
                json['components'] as Map<String, dynamic>)
            : null;

  SwaggerInfo? info;
  String host;
  String basePath;
  List<SwaggerTag> tags;
  List<String> schemes;
  List<SwaggerPath> paths;
  List<SwaggerRequestParameter> parameters;
  SwaggerComponents? components;

  static List<SwaggerTag> mapTags(List<dynamic> map) {
    return map
        .map((dynamic e) => SwaggerTag.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  static List<SwaggerRequestParameter> mapParameters(Map<String, dynamic> map) {
    final results = <SwaggerRequestParameter>[];
    for (var i = 0; i < map.keys.length; i++) {
      final key = map.keys.elementAt(i);

      final result =
          SwaggerRequestParameter.fromJson(map[key] as Map<String, dynamic>);

      result.key = key;

      results.add(result);
    }
    return results;
  }

  static List<SwaggerPath> mapPaths(Map<String, dynamic> map) {
    final results = <SwaggerPath>[];

    for (var i = 0; i < map.keys.length; i++) {
      final key = map.keys.elementAt(i);
      final value = map[key] as Map<String, dynamic>;

      final path = SwaggerPath(path: key);
      path.requests = <SwaggerRequest>[];
      path.parameters = <SwaggerRequestParameter>[];
      if (value.containsKey('parameters')) {
        final list = value['parameters'] as List<dynamic>;
        for (var k = 0; k < list.length; k++) {
          final parameter =
              SwaggerRequestParameter.fromJson(list[k] as Map<String, dynamic>);
          path.parameters.add(parameter);
        }
      }
      for (var j = 0; j < value.keys.length; j++) {
        final requestKey = value.keys.elementAt(j);
        if (requestKey.contains('parameters')) {
          continue;
        }
        final request =
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
