extension CapitalizeExtension on String {
  String get capitalize {
    return this == null || isEmpty
        ? this
        : (this[0].toUpperCase() + substring(1));
  }

  String get lower {
    return isEmpty ? this : (this[0].toLowerCase() + substring(1));
  }

  bool get isUpper {
    return this == toUpperCase() && this != toLowerCase();
  }
}
