import 'package:recase/recase.dart';
import 'package:swagger_dart_code_generator/src/exception_words.dart';

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
    if (endsWith('?')) {
      return this;
    }

    return '$this?';
  }

  String getRef() => split('/').last.pascalCase;

  String asList() => 'List<$this>';

  String asEnum() => 'enums.$this';

  String asFutureResponse() => 'Future<chopper.Response<$this>>';

  String asParameterName() {
    if (isEmpty) {
      return this;
    }

    final parameterName = replaceAll(',', '');

    var name = <String>[];
    exceptionWords.forEach((String element) {
      if (parameterName == element) {
        final result = '\$' + parameterName;
        name.add(result);
      }
    });
    if (name.isEmpty) {
      name = parameterName.split('-').map((str) => str.capitalize).toList();
      name[0] = name[0].lower;
    }

    return name.join();
  }

  String asParameterType() {
    if (isEmpty) {
      return 'dynamic';
    }

    final result =
        split('-').map((String str) => str == str.capitalize).toList().join();

    return result;
  }
}
