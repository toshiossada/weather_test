import 'http_response.dart';

/// An abstract class that defines the interface for HTTP client adapters.
///
/// This interface provides methods for making HTTP requests, such as
/// `get`, `post`,
/// `put`, and `delete`. Concrete implementations of this interface should
/// handle
/// the actual network communication, data serialization, and error handling.
abstract class IHttpClientAdapter {
  /// Sends an HTTP GET request to the specified [path].
  Future<HttpResponse> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });

  /// Sends an HTTP POST request to the specified [path].
  Future<HttpResponse> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });

  /// Sends an HTTP PUT request to the specified [path].
  Future<HttpResponse> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    String contentType,
    String? cancelationIdentification,
  });

  /// Sends an HTTP PUT request to the specified [path].
  Future<HttpResponse> delete(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });
}
