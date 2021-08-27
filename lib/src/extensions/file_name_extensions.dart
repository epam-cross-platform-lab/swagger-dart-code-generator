import 'package:swagger_dart_code_generator/src/extensions/string_extension.dart';

String getClassNameFromFileName(String file) {
  final name = file.split('.').first.replaceAll('-', '_');
  final result = name.split('_').map((String e) => e.capitalize);
  return result.join();
}

String getFileNameWithoutExtension(String file) {
  return file.split('.').first;
}

String getFileNameBase(String filePath) {
  final fileName = filePath.split('/').last.replaceAll('-', '_');

  final lastDot = fileName.lastIndexOf('.');

  return fileName.substring(0, lastDot);
}
