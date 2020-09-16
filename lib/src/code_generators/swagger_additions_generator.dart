abstract class SwaggerAdditionsGenerator {
  String generateIndexes(Map<String, List<String>> buildExtensions);
  String generateConverterMappings(
      Map<String, List<String>> buildExtensions, bool hasModels);
  String generateImportsContent(
      String swaggerFileName, bool hasModels, bool buildOnlyModels);
  String generateCustomJsonConverter(String fileName, bool hasModels);
}
