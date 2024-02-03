import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';


import '../dio_errors.dart';

class CommonInterceptor extends InterceptorsWrapper {

  CommonInterceptor();

  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // final token = credential.getToken();

    // if (token?.isNotEmpty ?? false) {
    //   options.headers['Authorization'] = 'Bearer $token';
    // }

    // if (kDebugMode && AppEnv.httpLog) {
    //   _logRequest(options, token);
    // }
    handler.next(options);
    return options;
  }

  _logRequest(RequestOptions options, String? token) {
    //Imprimindo informações do request para debug
    log(json.encode('BaseURL: ${options.baseUrl}'), name: 'Request[BaseURL]');
    log(json.encode('Endpoint: ${options.path}'), name: 'Request[Endpoint]');
    if (token?.isNotEmpty ?? false) {
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

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    if (kDebugMode) {
      log(json.encode('Response: ${response.data}'), name: 'Response');
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
