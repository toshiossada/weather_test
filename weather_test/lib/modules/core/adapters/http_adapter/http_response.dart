/// A class representing the response from an HTTP request.
///
/// This class encapsulates the HTTP response status code and any associated
/// data
/// that may have been returned by the server.
class HttpResponse {
  /// Usage:
  /// ```dart
  /// HttpResponse(
  ///   statusCode: 200,
  ///   data: responseBody,
  /// );
  /// ```
  const HttpResponse({
    required this.statusCode,
    this.data,
  });

  /// The data returned by the server, if any.
  ///
  /// This can be any type of data, such as a string, a map, a list,
  /// or even binary data.
  final dynamic data;

  /// The HTTP status code returned by the server.
  ///
  /// This is an integer value that indicates the result of the HTTP request.
  /// Common status codes include 200 (OK), 404 (Not Found),
  /// and 500 (Internal Server Error).
  final int statusCode;
}
