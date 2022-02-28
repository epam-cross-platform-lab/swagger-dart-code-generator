import 'package:swagger_dart_code_generator/src/extensions/string_extension.dart';

String getClassNameFromFileName(String file) {
  final name = removeFileExtension(file).replaceAll('-', '_');
  final result = name.split('_').map((String e) => e.capitalize);
  return result.join();
}

String removeFileExtension(String file) {
  return file.split('.').first;
}

String getFileNameBase(String filePath) {
  return filePath.split(RegExp(r'\\|\/')).last.replaceAll('-', '_');
}
