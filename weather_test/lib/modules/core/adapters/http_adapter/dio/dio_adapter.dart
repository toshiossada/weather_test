import 'dart:convert';

import 'package:dio/dio.dart';

import '../http_client_adapter.dart';
import '../http_response.dart';
import 'dio_errors.dart';

/// A concrete implementation of [IHttpClientAdapter] using the Dio package.
///
/// This adapter class wraps around the Dio instance and allows for custom
/// interceptors to be added to the Dio client for request, response, and error
/// interception.
class DioAdapter implements IHttpClientAdapter {
  /// Usage:
  /// ```dart
  /// DioAdapter(dio: Dio(), interceptors: []);
  /// ```
  DioAdapter({
    required this.dio,
    this.interceptors = const [],
  }) {
    if (interceptors.isNotEmpty) dio.interceptors.addAll(interceptors);
  }

  /// The Dio instance that will be used for making HTTP requests.
  final Dio dio;

  /// A list of interceptors that will be added to the Dio instance for
  /// intercepting requests, responses, and errors.
  ///
  /// This allows for customization of the HTTP client behavior.
  final List<InterceptorsWrapper> interceptors;

  @override
  Future<HttpResponse> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final result = await dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      final response = HttpResponse(
        data: result.data is String ? json.decode(result.data) : result.data,
        statusCode: result.statusCode ?? 200,
      );
      return response;
    } on DioException catch (e) {
      throw DioClientError(
        data: e.response?.data,
        statusCode: e.response?.statusCode ?? 500,
        type: DioExceptionType.badResponse,
        message: e.message ?? '',
        requestOptions: e.requestOptions,
        stackTrace: e.stackTrace,
      );
    }
  }

  @override
  Future<HttpResponse> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final result = await dio.post(
        path,
        queryParameters: queryParameters,
        data: data,
        options: Options(headers: headers),
      );
      final response = HttpResponse(
        data: result.data,
        statusCode: result.statusCode ?? 200,
      );
      return response;
    } on DioException catch (e) {
      throw DioClientError(
        data: e.response?.data,
        statusCode: e.response?.statusCode ?? 500,
        type: DioExceptionType.badResponse,
        message: e.message ?? '',
        requestOptions: e.requestOptions,
        stackTrace: e.stackTrace,
      );
    }
  }

  @override
  Future<HttpResponse> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    String? contentType,
    String? cancelationIdentification,
  }) async {
    try {
      final result = await dio.put(
        path,
        queryParameters: queryParameters,
        data: data,
        options: Options(
          headers: headers,
          contentType: contentType,
        ),
      );

      final response = HttpResponse(
        data: result.data,
        statusCode: result.statusCode ?? 200,
      );
      return response;
    } on DioException catch (e) {
      throw DioClientError(
        data: e.response?.data,
        statusCode: e.response?.statusCode ?? 500,
        type: DioExceptionType.badResponse,
        message: e.message ?? '',
        requestOptions: e.requestOptions,
        stackTrace: e.stackTrace,
      );
    }
  }

  @override
  Future<HttpResponse> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final result = await dio.delete(
        path,
        queryParameters: queryParameters,
        data: data,
        options: Options(headers: headers),
      );
      final response = HttpResponse(
        data: result.data,
        statusCode: result.statusCode ?? 200,
      );
      return response;
    } on DioException catch (e) {
      throw DioClientError(
        data: e.response?.data,
        statusCode: e.response?.statusCode ?? 500,
        type: DioExceptionType.badResponse,
        message: e.message ?? '',
        requestOptions: e.requestOptions,
        stackTrace: e.stackTrace,
      );
    }
  }
}
