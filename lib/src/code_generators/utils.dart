import 'package:recase/recase.dart';

class SanitizeClassName extends ReCase {
  SanitizeClassName(super.text);

  @override
  final symbolSet = {' ', '.', '/', '\\'};

  String get toClassName => _getClassName();

  String _getClassName() {
    return pascalCase.replaceAll("-", "_");
  }
}

extension StringSanitizeClassName on String {
  String get toClassName => SanitizeClassName(this).toClassName;
}