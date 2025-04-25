extension DoubleExtension on double {
  // Removes the trailing ".0" from a double.
  String get normalize {
    if (this == 0) return "";
    final str = double.parse(toStringAsFixed(2)).toString();
    if (str.endsWith(".0")) return str.replaceRange(str.length - 2, null, "");
    return str;
  }
}
