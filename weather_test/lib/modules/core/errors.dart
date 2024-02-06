/// An abstract class that defines the interface for failure types within the
/// application.
///
/// This class implements [Exception] and provides a contract for custom
/// exception types
/// that can be thrown throughout the application. Each failure type should
///   provide a
/// descriptive message that can be used for error handling and logging.
abstract class Failure implements Exception {
  /// A descriptive message about the failure.
  String? get message;
}

/// A custom failure type representing errors that occur during object mapping
/// operations.
///
/// This error is typically thrown when converting between different object
/// representations
/// fails, such as converting a JSON map to a Dart object.
class MapperError extends Failure {
  /// Usage:
  /// ```dart
  /// MapperError(
  ///   message: 'Error occurred while mapping object',
  /// )
  /// ```
  MapperError({
    this.message,
  });
  @override
  final String? message;
}

/// A custom failure type representing errors that occur during deserialization
/// operations.
class DesserializeError extends Failure {
  /// Usage:
  /// ```dart
  /// DesserializeError(
  ///   message: 'Error occurred while mapping object',
  /// )
  /// ```
  DesserializeError({
    this.message,
  });
  @override
  final String? message;
}
