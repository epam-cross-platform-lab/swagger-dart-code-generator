import 'package:code_builder/code_builder.dart';

extension ParameterExtension on Parameter {
  Parameter copyWith({
    Reference? type,
    List<Expression>? annotations,
  }) =>
      Parameter(
        (p) => p
          ..name = name
          ..named = named
          ..required = required
          ..type = type ?? this.type
          ..named = named
          ..annotations.addAll(annotations ?? this.annotations),
      );
}
