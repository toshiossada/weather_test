import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'adapters/cache_adapter/cache_adapter.dart';
import 'adapters/cache_adapter/cache_hive/cache_hive.dart';
import 'adapters/http_adapter/dio/interceptor/common_interceptor.dart';
import 'adapters/http_adapter/dio/dio_adapter.dart';
import 'adapters/http_adapter/http_client_adapter.dart';
import 'consts.dart';
import 'usecases/check_internet.dart';

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
      ..addInstance<Dio>(Dio(BaseOptions(
        baseUrl: i<Consts>().baseUrl,
      )))
      ..add<ICacheAdapter>(CacheHive.new)
      ..addInstance<CheckInternetUsecase>(
          CheckInternetUsecase(lookup: () async {
        final result = await InternetAddress.lookup('google.com');
        return result;
      }))
      ..addInstance<List<InterceptorsWrapper>>([
        CommonInterceptor(
            cacheAdapter: i(),
            checkInternetUsecase: i(),
            durationCache: const Duration(minutes: 1)),
      ])
      ..addInstance<IHttpClientAdapter>(
        DioAdapter(
          dio: i<Dio>(),
          interceptors: i<List<InterceptorsWrapper>>(),
        ),
      );
  }
}
