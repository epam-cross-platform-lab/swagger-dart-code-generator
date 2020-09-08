import 'package:swagger_generator/src/swagger_models/v2/requests/swagger_request_parameter.dart';

import 'requests/swagger_request.dart';

class SwaggerPath {
  SwaggerPath({this.path, this.requests, this.parameters});

  String path;
  List<SwaggerRequest> requests;
  List<SwaggerRequestParameter> parameters;
}
