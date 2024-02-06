import 'helpers_errors.dart';

class DefaultHelpers {
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
