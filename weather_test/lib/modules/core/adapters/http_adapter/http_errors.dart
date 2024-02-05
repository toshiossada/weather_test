import '../../errors.dart';

class HttpClientError implements Failure {
  final int? statusCode;
  final dynamic data;
  @override
  final String message;
  final dynamic error;
  final StackTrace? stackTrace;
  final dynamic requestOptions;
  final dynamic response;
  final dynamic type;

  const HttpClientError({
    this.data,
    required this.message,
    required this.statusCode,
    this.error,
    this.stackTrace,
    this.requestOptions,
    this.response,
    this.type,
  });
}
