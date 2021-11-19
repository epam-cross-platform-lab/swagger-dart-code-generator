class SwaggerConverterGenerator {
  Map<String, dynamic> getDefinitions(dynamic map) {
    if (map['definitions'] != null) {
      return map['definitions'] as Map<String, dynamic>? ?? {};
    }

    if (map['components'] != null) {
      return map['components']['schemas'] as Map<String, dynamic>? ?? {};
    }

    return {};
  }

  Map<String, dynamic> getResponses(dynamic map) {
    if (map['components'] != null) {
      return map['components']['responses'] as Map<String, dynamic>? ?? {};
    }

    return {};
  }
}
