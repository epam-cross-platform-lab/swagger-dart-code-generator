import 'package:change_case/change_case.dart';
import 'package:swagger_dart_code_generator/src/exception_words.dart';

class EnumModel {
  final String name;
  final List<String> values;
  final bool isInteger;
  final List<String> enumNames;

  static const String defaultEnumFieldName = 'value_';

  const EnumModel({
    required this.name,
    required this.values,
    required this.isInteger,
    required this.enumNames,
  });

  @override
  String toString() => _getEnumContent();

  static String _normalizeJsonKeyString(String jsonKey) {
    return jsonKey.replaceAll("\$", "\\\$").replaceAll('\'', '\\\'');
  }

  String _getEnumContent() {
    final resultStrings = <String>[];

    final allFieldNames = <String>[];

    for (int i = 0; i < values.length; i++) {
      final value = values[i];

      var validatedValue = enumNames.isNotEmpty ? enumNames[i] : value;

      validatedValue = getValidatedEnumFieldName(
        validatedValue,
        value,
        isInteger,
        allFieldNames,
      );

      allFieldNames.add(
        validatedValue.substring(0, validatedValue.indexOf('(')),
      );

      if (isInteger) {
        resultStrings.add(
          "\t@JsonValue(${_normalizeJsonKeyString(value)})\n\t$validatedValue",
        );
      } else {
        resultStrings.add(
          "\t@JsonValue('${_normalizeJsonKeyString(value)}')\n\t$validatedValue",
        );
      }
    }

    return '''
enum $name {
@JsonValue(null)
swaggerGeneratedUnknown(null),

${resultStrings.join(',\n')};

final ${isInteger ? 'int' : 'String'}? value;

const $name(this.value);
}''';
  }

  static String getValidatedEnumFieldName(
    String fieldName,
    String fieldValue,
    bool isInteger,
    List<String> allFieldNames,
  ) {
    if (fieldName.isEmpty) {
      fieldName = 'null';
    }

    var result = fieldName.replaceAll(RegExp(r'[\W_]+'), '_').toCamelCase();

    if (result.startsWith(RegExp('[0-9]'))) {
      result = defaultEnumFieldName + result;
    }

    if (exceptionWordsInEnum.contains(result)) {
      result = '\$$result';
    }

    if (result.isEmpty) {
      result = 'undefined';
    }

    while (allFieldNames.contains(result.toLowerFirstCase())) {
      result = '\$$result';
    }

    return '$result(${isInteger ? fieldValue : '\'${_normalizeJsonKeyString(fieldValue)}\''})';
  }

  String generateFromJsonToJson([bool caseSensitive = true]) {
    final type = isInteger ? 'int' : 'String';

    String enumParse(bool nullCheck) => caseSensitive || isInteger
        ? 'return enums.$name.values.firstWhereOrNull((e) => e.value == ${name.toCamelCase()}) ?? defaultValue'
        : 'return enums.$name.values.firstWhereOrNull((e) => e.value.toString().toLowerCase() == ${name.toCamelCase()}${nullCheck ? '?' : ''}.toString().toLowerCase()) ?? defaultValue';

    final enumListFromJsonReturn = isInteger
        ? 'return ${name.toCamelCase()}.map((e) => ${name.toCamelCase()}FromJson(e)).toList()'
        : 'return ${name.toCamelCase()}.map((e) => ${name.toCamelCase()}FromJson(e.toString())).toList()';

    return '''
$type? ${name.toCamelCase()}NullableToJson(enums.$name? ${name.toCamelCase()}) {
  return ${name.toCamelCase()}?.value;
}

$type? ${name.toCamelCase()}ToJson(enums.$name ${name.toCamelCase()}) {
  return ${name.toCamelCase()}.value;
}

enums.$name ${name.toCamelCase()}FromJson(
  Object? ${name.toCamelCase()},
  [enums.$name? defaultValue,]
  ) {

${enumParse(true)} ?? enums.$name.swaggerGeneratedUnknown;
}

enums.$name? ${name.toCamelCase()}NullableFromJson(
  Object? ${name.toCamelCase()},
  [enums.$name? defaultValue,]
  ) {
    if(${name.toCamelCase()} == null){
      return null;
    }
    ${enumParse(false)};
}

String ${name.toCamelCase()}ExplodedListToJson(
    List<enums.$name>? ${name.toCamelCase()}) {

    return ${name.toCamelCase()}?.map((e) => e.value!).join(',') ?? '';
}


List<$type> ${name.toCamelCase()}ListToJson(
    List<enums.$name>? ${name.toCamelCase()}) {

  if(${name.toCamelCase()} == null)
  {
    return [];
  }

  return ${name.toCamelCase()}
      .map((e) => e.value!)
      .toList();
}

List<enums.$name> ${name.toCamelCase()}ListFromJson(
    List? ${name.toCamelCase()},
    [List<enums.$name>? defaultValue,]) {

  if(${name.toCamelCase()} == null)
  {
    return defaultValue ?? [];
  }

  $enumListFromJsonReturn;
}


List<enums.$name>? ${name.toCamelCase()}NullableListFromJson(
    List? ${name.toCamelCase()},
    [List<enums.$name>? defaultValue,]) {

  if(${name.toCamelCase()} == null)
  {
    return defaultValue;
  }

  $enumListFromJsonReturn;
}
    ''';
  }
}
