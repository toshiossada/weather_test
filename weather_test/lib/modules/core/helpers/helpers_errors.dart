import '../errors.dart';

class RequiredKeysError extends Failure {
  final String? _message;
  final Map<String, dynamic> map;
  final List<String> missingKeys;
  final String objName;

  RequiredKeysError({
    String? message,
    required this.objName,
    required this.map,
    required this.missingKeys,
  }) : _message = message;

  @override
  String get message =>
      _message ??
      'Trying to deserialize $objName got error. These keys are required: $missingKeys!';
}

class DisallowedNullValueError extends Failure {
  final String? _message;
  final Map<String, dynamic> map;
  final List<String> keysWithNullValues;
  final String objName;

  DisallowedNullValueError({
    required this.keysWithNullValues,
    required this.map,
    required this.objName,
    String? message,
  }) : _message = message;

  @override
  String get message =>
      _message ??
      'Trying to deserialize $objName got error. '
          'These keys had `null` values, '
          'which is not allowed: $keysWithNullValues';
}
