import 'dart:convert';

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
    required this.openapiVersion,
    required this.basePath,
    required this.components,
    required this.info,
    required this.host,
    required this.paths,
    required this.tags,
    required this.schemes,
    required this.parameters,
    required this.definitions,
    required this.securityDefinitions,
  });

  @JsonKey(name: 'openapi')
  String? openapiVersion;

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

  @JsonKey(name: 'securityDefinitions', fromJson: _mapSecurityDefinitions)
  Map<String, SwaggerRequestParameter> securityDefinitions;

  Map<String, dynamic> toJson() => _$SwaggerRootToJson(this);

  factory SwaggerRoot.parse(String encodedJson) =>
      SwaggerRoot.fromJson(jsonDecode(encodedJson) as Map<String, dynamic>);

  factory SwaggerRoot.fromJson(Map<String, dynamic> json) =>
      _$SwaggerRootFromJson(json);

  static final SwaggerRoot empty = SwaggerRoot.fromJson({});
}

Map<String, SwaggerRequestParameter> _mapSecurityDefinitions(
    Map<String, dynamic>? definitions) {
  if (definitions == null) {
    return {};
  }

  final definitionsArray = definitions.map((key, value) {
    final typedValue = value as Map<String, dynamic>;

    return MapEntry(key, SwaggerRequestParameter.fromJson(typedValue));
  });

  return definitionsArray;
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
