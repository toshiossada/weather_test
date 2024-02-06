import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../../usecases/check_internet.dart';
import '../../../cache_adapter/cache_adapter.dart';
import '../../../cache_adapter/models/cache_model.dart';
import '../dio_errors.dart';

/// A Dio interceptor that provides common functionality such as caching and
/// internet connectivity checks for HTTP requests.
///
/// This interceptor can be added to the Dio instance to perform actions before
/// the request is sent, or after the response is received.
class CommonInterceptor extends InterceptorsWrapper {
  /// Usage:
  /// ```dart
  /// final dio = Dio();
  /// dio.interceptors.add(CommonInterceptor(
  ///   cacheAdapter: yourCacheAdapterInstance,
  ///   checkInternetUsecase: yourCheckInternetUsecaseInstance,
  /// ));
  /// ```
  CommonInterceptor({
    required this.cacheAdapter,
    required this.checkInternetUsecase,
    this.durationCache = const Duration(minutes: 5),
  });

  /// The duration for which the cache data should be considered valid.
  final Duration durationCache;

  /// The adapter responsible for caching data.
  final ICacheAdapter cacheAdapter;

  /// The use case responsible for checking internet connectivity.
  final CheckInternetUsecase checkInternetUsecase;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    //Imprimindo informações do request para debug
    if (kDebugMode) {
      log(json.encode('BaseURL: ${options.baseUrl}'), name: 'Request[BaseURL]');
      log(json.encode('Endpoint: ${options.path}'), name: 'Request[Endpoint]');
      if (options.headers['access-token'] != null) {
        log(
          json.encode('access-token: ${options.headers['access-token']}'),
          name: 'Request[access-token]',
        );
      }
      if (options.data != null) {
        log(
          json.encode('Payload: ${json.encode(options.data)}'),
          name: 'Request[Payload]',
        );
      }
    }

    final online = await checkInternetUsecase();
    if ((options.extra['cached'] ?? false) || !online) {
      final id = '${options.method}${options.path}';
      final dataCached = await cacheAdapter.get(id);

      if (dataCached?.date != null &&
          (!online ||
              DateTime.now().difference(dataCached!.date) <= durationCache)) {
        handler.resolve(
          Response(
            data: json.encode(dataCached?.data),
            extra: options.extra,
            statusCode: 200,
            requestOptions: options,
          ),
          true,
        );

        return;
      }
    }

    handler.next(options);
  }

  @override
  Future<void> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    if (kDebugMode) {
      log(json.encode('Response: ${response.data}'), name: 'Response');
    }

    if (response.requestOptions.method == 'GET') {
      final id =
          '${response.requestOptions.method}${response.requestOptions.path}';
      final dataCached = await cacheAdapter.get(id);

      if (dataCached?.date == null ||
          DateTime.now().difference(dataCached?.date ?? DateTime.now()) >
              durationCache) {
        final data = CacheModel(
          data: response.data is String
              ? json.decode(response.data)
              : response.data,
          date: DateTime.now(),
          id: id,
        );
        await cacheAdapter.put(data);
      }
    }

    handler.next(response);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    DioClientError failure;
    if (err.response?.statusCode == 401) {
      failure = DioClientError(
        message: 'Falha ao realizar login.',
        requestOptions: err.requestOptions,
        statusCode: err.response?.statusCode,
        stackTrace: err.stackTrace,
        type: err.type,
        data: err.requestOptions.data,
        error: err,
        response: err.response,
      );
    } else {
      failure = DioClientError(
        requestOptions: err.requestOptions,
        statusCode: err.response?.statusCode,
        stackTrace: err.stackTrace,
        type: err.type,
        data: err.requestOptions.data,
        error: err,
        response: err.response,
        message: 'Ocorreu um erro na requisição com o servidor',
      );
    }

    handler.next(failure);
  }
}
