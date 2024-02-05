import 'dart:convert';

import 'package:dio/dio.dart';

import '../http_client_adapter.dart';
import '../http_response.dart';
import 'dio_errors.dart';

class DioAdapter implements IHttpClientAdapter {

  DioAdapter({
    required this.dio,
    this.interceptors = const [],
  }) {
    if (interceptors.isNotEmpty) dio.interceptors.addAll(interceptors);
  }
  final Dio dio;
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
