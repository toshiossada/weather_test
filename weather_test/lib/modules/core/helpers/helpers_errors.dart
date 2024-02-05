import '../errors.dart';

class RequiredKeysError extends Failure {

  RequiredKeysError({
    required this.objName, required this.map, required this.missingKeys, String? message,
  }) : _message = message;
  final String? _message;
  final Map<String, dynamic> map;
  final List<String> missingKeys;
  final String objName;

  @override
  String get message =>
      _message ??
      'Trying to deserialize $objName got error. These keys are required: $missingKeys!';
}

class DisallowedNullValueError extends Failure {

  DisallowedNullValueError({
    required this.keysWithNullValues,
    required this.map,
    required this.objName,
    String? message,
  }) : _message = message;
  final String? _message;
  final Map<String, dynamic> map;
  final List<String> keysWithNullValues;
  final String objName;

  @override
  String get message =>
      _message ??
      'Trying to deserialize $objName got error. '
          'These keys had `null` values, '
          'which is not allowed: $keysWithNullValues';
}
