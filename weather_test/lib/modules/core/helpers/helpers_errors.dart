import '../errors.dart';

/// A custom failure type representing an error that occurs when required keys
/// are missing
/// during deserialization of an object.
///
/// This error is typically thrown when a map that is expected to contain
/// certain keys
/// is missing those keys, indicating an incomplete or invalid data structure.
class RequiredKeysError extends Failure {
  /// Usage:
  /// ```dart
  /// RequiredKeysError({
  ///   objName = 'Class',
  ///   map = {},
  ///   missingKeys = const ['id'],
  ///   message: 'Error occurred while mapping object',
  /// })
  /// ```
  RequiredKeysError({
    required this.objName,
    required this.map,
    required this.missingKeys,
    String? message,
  }) : _message = message;

  final String? _message;

  /// The map that was being deserialized.
  final Map<String, dynamic> map;

  /// The list of keys that were expected but missing from the map.
  final List<String> missingKeys;

  /// The name of the object that was being deserialized when the error
  /// occurred.
  final String objName;

  @override
  String get message =>
      _message ??
      'Trying to deserialize $objName got error. '
          'These keys are required: $missingKeys!';
}

/// A custom failure type representing an error that occurs when `null` values
/// are found
/// for keys that are not allowed to be `null` during deserialization of an
/// object.
///
/// This error is typically thrown when a map contains `null` values for keys
/// that require
/// non-null values, indicating an incomplete or invalid data structure.
class DisallowedNullValueError extends Failure {
  /// Usage:
  /// ```dart
  /// RequiredKeysError({
  ///   objName = 'Class',
  ///   map = {},
  ///   keysWithNullValues = const ['id'],
  ///   message: 'Error occurred while mapping object',
  /// })
  /// ```
  DisallowedNullValueError({
    required this.keysWithNullValues,
    required this.map,
    required this.objName,
    String? message,
  }) : _message = message;

  final String? _message;

  /// The map that was being deserialized.
  final Map<String, dynamic> map;

  /// The list of keys that had `null` values but are required to have non-null
  ///  values.
  final List<String> keysWithNullValues;

  /// The name of the object that was being deserialized when the error
  /// occurred.
  final String objName;

  @override
  String get message =>
      _message ??
      'Trying to deserialize $objName got error. '
          'These keys had `null` values, '
          'which is not allowed: $keysWithNullValues';
}
