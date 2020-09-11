abstract class SwaggerAdditionsGenerator {
  String generateIndexes(Map<String, List<String>> buildExtensions);
  String generateConverterMappings(Map<String, List<String>> buildExtensions);
  String generateImportsContent(String swaggerFileName, bool hasModels);
  String generateCustomJsonConverter(String fileName);
}
