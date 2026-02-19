import 'package:change_case/change_case.dart';

String getClassNameFromFileName(String file) {
  final name = removeFileExtension(file).replaceAll('-', '_');
  return name.toPascalCase();
}

String removeFileExtension(String file) {
  return file.split('.').first;
}

String getFileNameBase(String filePath) {
  return filePath.split(RegExp(r'[\\\/]')).last.replaceAll('-', '_');
}
