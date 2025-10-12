import 'package:recase/recase.dart';
import 'package:swagger_dart_code_generator/src/code_generators/constants.dart';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_models_generator.dart';

extension CapitalizeExtension on String {
  String get capitalize {
    return isEmpty ? this : (this[0].toUpperCase() + substring(1));
  }

  String get lower {
    return isEmpty ? this : (this[0].toLowerCase() + substring(1));
  }

  bool get isUpper {
    return this == toUpperCase() && this != toLowerCase();
  }
}

extension TypeExtension on String {
  String makeNullable({bool required = false}) {
    if (this == kDynamic) {
      return this;
    }

    if (endsWith('?')) {
      if (required) {
        return substring(0, length - 1);
      }
      return this;
    }

    if (required) {
      return this;
    }

    return '$this?';
  }

  String getRef() => split('/').last.pascalCase;

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

    final result =
        split('-').map((String str) => str == str.capitalize).toList().join();

    return result;
  }
}
