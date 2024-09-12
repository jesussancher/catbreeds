/// Extension to convert an integer to a boolean.
extension IntExtension on int? {
  /// Converts an integer to a boolean.
  ///
  /// Returns `true` if the integer is `1`, otherwise `false`.
  bool get toBoolean => this == 1;
}
