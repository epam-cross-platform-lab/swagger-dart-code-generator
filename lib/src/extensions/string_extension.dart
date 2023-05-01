import 'package:swagger_dart_code_generator/src/code_generators/constants.dart';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_models_generator.dart';
import 'package:swagger_dart_code_generator/src/code_generators/utils.dart';

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
  String makeNullable() {
    if (this == kDynamic) {
      return this;
    }

    if (endsWith('?')) {
      return this;
    }

    return '$this?';
  }

  String getRef() => split('/').last.toClassName;

  String getUnformattedRef() => split('/').last;

  String withPostfix(String postfix) => '$this$postfix';

  String asList() => 'List<$this>';

  String removeListOrStream() =>
      replaceAll('List<', '').replaceAll('Stream<', '').replaceAll('>', '');

  String asEnum() => 'enums.$this';

  String asFutureResponse() => 'Future<chopper.Response<$this>>';

  String asParameterName() {
    return SwaggerModelsGenerator.getValidatedParameterName(this);
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
