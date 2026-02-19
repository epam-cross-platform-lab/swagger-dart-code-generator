import 'package:change_case/change_case.dart';
import 'package:swagger_dart_code_generator/src/code_generators/constants.dart';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_models_generator.dart';

extension TypeExtension on String {
  String makeNullable() {
    if (this == kDynamic) {
      return this;
    }

    if (endsWith('?')) {
      return this;
    }

    return '$this?';
  }

  String getRef() => split('/').last.toPascalCase();

  String getUnformattedRef() => split('/').last;

  String withPostfix(String postfix) => this + postfix;

  String asList() => 'List<$this>';

  String removeListOrStream() =>
      replaceAll('List<', '').replaceAll('Stream<', '').replaceAll('>', '');

  String asEnum() => 'enums.$this';

  String asFutureResponse() => 'Future<chopper.Response<$this>>';

  String asParameterName() {
    final result = SwaggerModelsGenerator.getValidatedParameterName(this);

    if (result.isEmpty) {
      return '\$';
    }

    return result;
  }

  String asParameterType() {
    if (isEmpty) {
      return kDynamic;
    }

    return toParamCase();
  }
}
