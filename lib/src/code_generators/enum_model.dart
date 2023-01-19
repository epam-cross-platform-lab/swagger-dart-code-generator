import 'package:recase/recase.dart';
import 'package:swagger_dart_code_generator/src/exception_words.dart';
import 'package:swagger_dart_code_generator/src/extensions/string_extension.dart';

class EnumModel {
  final String name;
  final List<String> values;
  final bool isInteger;

  static const String defaultEnumFieldName = 'value_';

  const EnumModel({
    required this.name,
    required this.values,
    required this.isInteger,
  });

  @override
  String toString() {
    return '''
${_getEnumContent()}
${_getEnumValuesMapContent()}
''';
  }

  String _getEnumValuesMapContent() {
    final neededStrings = <String>[];
    final fields = <String>[];

    for (int i = 0; i < values.length; i++) {
      final value = values[i];
      var validatedValue = value;

      validatedValue = getValidatedEnumFieldName(validatedValue);

      while (fields.contains(validatedValue)) {
        validatedValue += '\$';
      }

      fields.add(validatedValue);
      if (isInteger) {
        neededStrings
            .add('\t$name.$validatedValue: ${value.replaceAll('\$', '\\\$')}');
      } else {
        neededStrings.add(
            '\t$name.$validatedValue: \'${value.replaceAll('\$', '\\\$')}\'');
      }
    }

    return '''
const \$${name}Map = {
${neededStrings.join(',\n')}};''';
  }

  String _getEnumContent() {
    final resultStrings = <String>[];

    for (int i = 0; i < values.length; i++) {
      final value = values[i];
      var validatedValue = value;

      validatedValue = getValidatedEnumFieldName(validatedValue);

      if (isInteger) {
        resultStrings.add(
            "\t@JsonValue(${value.replaceAll("\$", "\\\$")})\n\t$validatedValue");
      } else {
        resultStrings.add(
            "\t@JsonValue('${value.replaceAll("\$", "\\\$")}')\n\t$validatedValue");
      }
    }

    return '''
enum $name {
@JsonValue('swaggerGeneratedUnknown')
swaggerGeneratedUnknown,
${resultStrings.join(',\n')}
}''';
  }

  static String getValidatedEnumFieldName(String name) {
    if (name.isEmpty) {
      name = 'null';
    }

    var result = name
        .replaceAll(RegExp(r'[^\w|\_|)]'), '_')
        .split('_')
        .where((element) => element.isNotEmpty)
        .map((String word) => word.toLowerCase().capitalize)
        .join();

    if (result.startsWith(RegExp('[0-9]+'))) {
      result = defaultEnumFieldName + result;
    }

    if (exceptionWords.contains(result.toLowerCase())) {
      return '\$' + result.lower;
    }

    if (result.isEmpty) {
      return 'undefined';
    }

    return result.lower;
  }

  String generateFromJsonToJson() {
    final type = isInteger ? 'int' : 'String';
    final defaultTypeValue = isInteger ? 0 : '\'\'';

    return '''
$type? ${name.camelCase}ToJson(enums.$name? ${name.camelCase}) {
  return enums.\$${name}Map[${name.camelCase}];
}

enums.$name ${name.camelCase}FromJson(
  Object? ${name.camelCase},
  [enums.$name? defaultValue,]
  ) {

${isInteger ? '''
if(${name.camelCase} is int)
  {
    return enums.\$${name}Map.entries
      .firstWhere((element) => element.value == ${name.camelCase},
      orElse: () => const MapEntry(enums.$name.swaggerGeneratedUnknown, $defaultTypeValue))
      .key;
  }
''' : '''
if(${name.camelCase} is String)
  {
 return enums.\$${name}Map.entries
      .firstWhere((element) => element.value == ${name.camelCase},
      orElse: () => const MapEntry(enums.$name.swaggerGeneratedUnknown, $defaultTypeValue))
      .key;
      }
'''}
 
    final parsedResult = defaultValue == null ? null : enums.\$${name}Map.entries
      .firstWhereOrNull((element) => element.value == defaultValue)
      ?.key;

  return parsedResult ??
      defaultValue ??
      enums.$name.swaggerGeneratedUnknown;
}


List<$type> ${name.camelCase}ListToJson(
    List<enums.$name>? ${name.camelCase}) {

  if(${name.camelCase} == null)
  {
    return [];
  }

  return ${name.camelCase}
      .map((e) => enums.\$${name}Map[e]!)
      .toList();
}

List<enums.$name> ${name.camelCase}ListFromJson(
    List? ${name.camelCase},
    [List<enums.$name>? defaultValue,]) {

  if(${name.camelCase} == null)
  {
    return defaultValue ?? [];
  }

  return ${name.camelCase}
      .map((e) => ${name.camelCase}FromJson(e.toString()))
      .toList();
}


List<enums.$name>? ${name.camelCase}NullableListFromJson(
    List? ${name.camelCase},
    [List<enums.$name>? defaultValue,]) {

  if(${name.camelCase} == null)
  {
    return defaultValue;
  }

  return ${name.camelCase}
      .map((e) => ${name.camelCase}FromJson(e.toString()))
      .toList();
}
    ''';
  }
}
