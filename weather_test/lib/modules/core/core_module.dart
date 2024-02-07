import 'dart:io';

import 'package:asuka/asuka.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'adapters/cache_adapter/cache_adapter.dart';
import 'adapters/cache_adapter/cache_hive/cache_hive.dart';
import 'adapters/custom_alerts/asuka/asuka_dialog.dart';
import 'adapters/custom_alerts/dialog_adapter.dart';
import 'adapters/http_adapter/dio/dio_adapter.dart';
import 'adapters/http_adapter/dio/interceptor/common_interceptor.dart';
import 'adapters/http_adapter/http_client_adapter.dart';
import 'consts.dart';
import 'usecases/check_internet.dart';

/// A module that provides core functionalities and services that are essential
/// to the application.
///
/// This module is intended to be imported by the root module, AppModule, and
/// it should contain bindings for core services such as networking, local
/// storage,
/// and authentication that are used throughout the app.
///
/// Usage:
/// ```dart
/// class AppModule extends Module {
///   @override
///   List<Module> get imports => [
///         CoreModule(),
///       ];
///
/// }
/// ```
class CoreModule extends Module {
  @override
  void exportedBinds(Injector i) {
    const apiKey = String.fromEnvironment('API_KEY');
    const baseUrl = String.fromEnvironment('BASE_URL');

    i
      ..addInstance<Consts>(
        const Consts(
          baseUrl: baseUrl,
          apiKey: apiKey,
        ),
      )
      ..addInstance<Dio>(
        Dio(
          BaseOptions(
            baseUrl: i<Consts>().baseUrl,
            queryParameters: {'appid': i<Consts>().apiKey},
          ),
        ),
      )
      ..add<ICacheAdapter>(CacheHive.new)
      ..addInstance<CheckInternetUsecase>(
        CheckInternetUsecase(
          lookup: () async {
            final result = await InternetAddress.lookup('google.com');
            return result;
          },
        ),
      )
      ..addInstance<List<InterceptorsWrapper>>([
        CommonInterceptor(
          cacheAdapter: i(),
          checkInternetUsecase: i(),
          durationCache: const Duration(minutes: 1),
        ),
      ])
      ..addInstance<IHttpClientAdapter>(
        DioAdapter(
          dio: i<Dio>(),
          interceptors: i<List<InterceptorsWrapper>>(),
        ),
      )
      ..addInstance<FShowDialog>((Widget child) {
        Asuka.showDialog(builder: (context) => child);
      })
      ..addInstance<FAlert>((String text) {
        AsukaSnackbar.alert(text).show();
      })
      ..addInstance<IDialogAdapter>(
        AsukaDialog(
          fAlert: i.get<FAlert>(),
          fShowDialog: i.get<FShowDialog>(),
        ),
      );
  }
}
