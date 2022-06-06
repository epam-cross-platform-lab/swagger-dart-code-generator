import 'package:recase/recase.dart';
import 'package:swagger_dart_code_generator/src/extensions/string_extension.dart';

String getMethodName(String methodName) => methodName
    .split('{')
    .map((e) => e.replaceAll('}', '').replaceAll('{', '').pascalCase)
    .join()
    .lower;
