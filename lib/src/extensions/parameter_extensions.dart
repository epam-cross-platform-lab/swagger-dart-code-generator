import 'package:code_builder/code_builder.dart';

extension ParameterExtension on Parameter {
  Parameter copyWith({
    Reference? type,
    List<Expression>? annotations,
    String? name,
  }) =>
      Parameter(
        (p) => p
          ..name = name ?? this.name
          ..named = named
          ..required = required
          ..type = type ?? this.type
          ..named = named
          ..defaultTo = defaultTo
          ..annotations.addAll(annotations ?? this.annotations),
      );
}

extension ParameterListExtension on List<Parameter> {
  List<Parameter> distinctParameters() {
    final allParameterNames = <String>[];
    final results = <Parameter>[];

    for (var element in this) {
      if (allParameterNames.contains(element.name)) {
        var newName = element.name;
        while (allParameterNames.contains(newName)) {
          newName += '\$';
        }
        allParameterNames.add(newName);
        results.add(element.copyWith(name: newName));
      } else {
        allParameterNames.add(element.name);
        results.add(element);
      }
    }

    return results;
  }
}
