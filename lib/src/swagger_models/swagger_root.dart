import 'package:swagger_dart_code_generator/src/code_generators/constants.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/requests/swagger_request.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/requests/swagger_request_parameter.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/responses/swagger_schema.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/swagger_components.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/swagger_info.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/swagger_path.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/swagger_tag.dart';
import 'package:json_annotation/json_annotation.dart';

part 'swagger_root.g2.dart';

@JsonSerializable()
class SwaggerRoot {
  SwaggerRoot({
    required this.basePath,
    required this.components,
    required this.info,
    required this.host,
    required this.paths,
    required this.tags,
    required this.schemes,
    required this.parameters,
    required this.definitions,
  });

  @JsonKey(name: 'info')
  SwaggerInfo? info;

  @JsonKey(name: 'host', defaultValue: '')
  String host;

  @JsonKey(name: 'basePath', defaultValue: '')
  String basePath;

  @JsonKey(name: 'tags', defaultValue: [])
  List<SwaggerTag> tags;

  @JsonKey(name: 'schemes', defaultValue: [])
  List<String> schemes;

  @JsonKey(name: 'paths', fromJson: _mapPaths)
  Map<String, SwaggerPath> paths;

  @JsonKey(name: 'definitions', defaultValue: {})
  Map<String, SwaggerSchema> definitions;

  @JsonKey(name: 'parameters', defaultValue: {})
  Map<String, SwaggerRequestParameter> parameters;

  @JsonKey(name: 'components')
  SwaggerComponents? components;

  Map<String, dynamic> toJson() => _$SwaggerRootToJson(this);

  factory SwaggerRoot.fromJson(Map<String, dynamic> json) =>
      _$SwaggerRootFromJson(json);
}

Map<String, SwaggerPath> _mapPaths(Map<String, dynamic>? paths) {
  if (paths == null) {
    return {};
  }

  return paths.map((path, pathValue) {
    final value = pathValue as Map<String, dynamic>;
    final parameters = value['parameters'] as List<dynamic>?;
    value.removeWhere(
        (key, value) => !supportedRequestTypes.contains(key.toLowerCase()));

    return MapEntry(
      path,
      SwaggerPath(
        parameters: parameters
                ?.map((parameter) => SwaggerRequestParameter.fromJson(
                    parameter as Map<String, dynamic>))
                .toList() ??
            [],
        requests: value.map(
          (key, request) => MapEntry(
            key,
            SwaggerRequest.fromJson(request as Map<String, dynamic>),
          ),
        ),
      ),
    );
  });
}
