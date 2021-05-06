import 'package:swagger_dart_code_generator/src/swagger_models/requests/swagger_request_parameter.dart';

class SwaggerComponents {
  SwaggerComponents({this.parameters = const []});

  List<SwaggerRequestParameter> parameters;

  SwaggerComponents.fromJson(Map<String, dynamic> json)
      : parameters = json['parameters'] == null
            ? []
            : mapParameters(json['parameters'] as Map<String, dynamic>);

  static List<SwaggerRequestParameter> mapParameters(
      Map<String, dynamic> parameters) {
    final parametersList = parameters.keys.map((e) {
      final parameter = SwaggerRequestParameter.fromJson(
          parameters[e] as Map<String, dynamic>);
      parameter.key = e;

      return parameter;
    }).toList();

    return parametersList;
  }
}
