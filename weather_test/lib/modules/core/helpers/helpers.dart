import 'helpers_errors.dart';

/// This class contains static methods that can be used throughout the
/// application
/// to perform various utility functions such as checking for required keys in
/// a map.
class DefaultHelpers {
  /// Checks if a map contains all the required keys and if certain keys do not
  /// have null values.
  ///
  /// Usage:
  /// ```dart
  /// try {
  ///   DefaultHelpers.checkKeys(
  ///     {},
  ///     objName: 'YourObject',
  ///     requiredKeys: ['key1', 'key2'],
  ///     disallowNullValues: ['key1'],
  ///   );
  /// } on Failure catch (e) {
  ///   print(e.message);
  /// }
  /// ```
  static void checkKeys(
    Map<String, dynamic> map, {
    required String objName,
    List<String>? requiredKeys,
    List<String>? disallowNullValues,
  }) {
    if (requiredKeys != null) {
      final missingKeys =
          requiredKeys.where((k) => !map.keys.contains(k)).toList();
      if (missingKeys.isNotEmpty) {
        throw RequiredKeysError(
          map: map,
          missingKeys: missingKeys,
          objName: objName,
        );
      }
    }

    if (disallowNullValues != null) {
      final nullValuedKeys = map.entries
          .where(
            (entry) =>
                disallowNullValues.contains(entry.key) && entry.value == null,
          )
          .map((entry) => entry.key)
          .toList();

      if (nullValuedKeys.isNotEmpty) {
        throw DisallowedNullValueError(
          keysWithNullValues: nullValuedKeys,
          map: map,
          objName: objName,
        );
      }
    }
  }
}
