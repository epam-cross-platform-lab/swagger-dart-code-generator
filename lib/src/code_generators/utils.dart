import 'package:recase/recase.dart';

class SanitizeClassName extends ReCase {
  SanitizeClassName(String text) : super(text);

  // SanitizeClassName(String text) {
  // this.originalText = text;
  // this._words = _groupIntoWords(text);
  // }

  // late String originalText;

  @override
  final symbolSet = {' ', '.', '/', '\\'};

  String get toClassName => _getClassName();

  String _getClassName() {
    // return this.originalText.contains("-")
    //     ? this.originalText.headerCase.replaceAll("-", "_")
    //     : this.originalText.pascalCase;
    return pascalCase.replaceAll("-", "_");
  }
}

extension StringSanitizeClassName on String {
  String get toClassName => SanitizeClassName(this).toClassName;
}
