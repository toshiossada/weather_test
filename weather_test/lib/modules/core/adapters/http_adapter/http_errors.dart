import '../../errors.dart';

/// A class representing an HTTP client error, implementing the [Failure]
/// interface.
///
/// This class captures various details about errors that occur during HTTP
/// requests,
/// including status codes, response data, and error messages. It can be
/// extended to
/// provide additional functionality or to work with specific HTTP clients
/// like Dio.
class HttpClientError implements Failure {
  /// Usage:
  /// ```dart
  /// try {
  ///     //Http Request
  ///  } on DioException catch (e) {
  ///     throw HttpClientError(
  ///       data: e.response?.data,
  ///       statusCode: e.response?.statusCode ?? 500,
  ///       type: Http.badResponse,
  ///       message: e.message ?? '',
  ///       requestOptions: e.requestOptions,
  ///       stackTrace: e.stackTrace,
  ///     );
  /// }
  /// ```
  const HttpClientError({
    required this.message,
    required this.statusCode,
    this.data,
    this.error,
    this.stackTrace,
    this.requestOptions,
    this.response,
    this.type,
  });

  /// The HTTP status code returned by the server.
  final int? statusCode;

  /// Additional data provided with the error, if any.
  final dynamic data;

  /// A descriptive message about the error.
  @override
  final String message;

  /// The original error object, if available.
  final dynamic error;

  /// The stack trace at the point where the error was caught.
  final StackTrace? stackTrace;

  /// The request options for the HTTP request that failed.
  final dynamic requestOptions;

  /// The HTTP response received, if any.
  final dynamic response;

  /// The type of error, which can provide more specific information about
  /// the failure.
  final dynamic type;
}
