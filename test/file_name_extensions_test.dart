import 'package:test/test.dart';
import 'package:swagger_dart_code_generator/src/extensions/file_name_extensions.dart';

void main() {
  group('Additions generator tests', () {
    test('Should generate mapping for files', () {
      const fileName = 'example_file.swagger.dart';
      var result = removeFileExtension(fileName);
      var expandedResult = 'example_file';
      expect(result, equals(expandedResult));
    });
  });
}
