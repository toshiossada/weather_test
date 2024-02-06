import 'package:dio/dio.dart';

import '../http_errors.dart';

/// A custom error class that extends [HttpClientError] and implements
/// [DioException].
///
/// This class provides detailed information about an error that occurs during
/// a Dio HTTP request, such as the error message, status code, and any
/// associated
/// data, error, stack trace, request options, response, and type of Dio
/// exception.
class DioClientError extends HttpClientError implements DioException {
  /// Usage:
  /// ```dart
  /// try {
  ///     //Dio Request
  ///  } on DioException catch (e) {
  ///     throw DioClientError(
  ///       data: e.response?.data,
  ///       statusCode: e.response?.statusCode ?? 500,
  ///       type: DioExceptionType.badResponse,
  ///       message: e.message ?? '',
  ///       requestOptions: e.requestOptions,
  ///       stackTrace: e.stackTrace,
  ///     );
  /// }
  /// ```
  DioClientError({
    required super.message,
    required super.statusCode,
    super.data,
    super.error,
    super.stackTrace,
    super.requestOptions,
    super.response,
    super.type,
  });

  @override
  StackTrace get stackTrace => super.stackTrace!;

  @override
  RequestOptions get requestOptions => super.requestOptions!;

  @override
  Response<dynamic>? get response => super.response!;

  @override
  DioExceptionType get type => super.type!;

  @override
  DioException copyWith({
    RequestOptions? requestOptions,
    Response? response,
    DioExceptionType? type,
    Object? error,
    StackTrace? stackTrace,
    String? message,
  }) {
    return DioClientError(
      data: data ?? data,
      message: message ?? this.message,
      statusCode: statusCode ?? statusCode,
      error: error ?? this.error,
      stackTrace: stackTrace ?? this.stackTrace,
      requestOptions: requestOptions ?? this.requestOptions,
      response: response ?? this.response,
      type: type ?? this.type,
    );
  }
}
