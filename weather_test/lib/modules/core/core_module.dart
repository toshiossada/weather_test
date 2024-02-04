import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'adapters/cache_adapter/cache_adapter.dart';
import 'adapters/cache_adapter/cache_hive/cache_hive.dart';
import 'adapters/http_adapter/dio/Interceptor/common_interceptor.dart';
import 'adapters/http_adapter/dio/dio_adapter.dart';
import 'adapters/http_adapter/http_client_adapter.dart';
import 'consts.dart';
import 'usecases/check_internet.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(Injector i) {
    const apiKey = String.fromEnvironment('API_KEY');
    const baseUrl = String.fromEnvironment('BASE_URL');

    i.addInstance<Consts>(
      Consts(
        baseUrl: baseUrl,
        apiKey: apiKey,
      ),
    );

    i.addInstance<Dio>(Dio(BaseOptions(
      baseUrl: i<Consts>().baseUrl, //config.baseUrlLogin,
    )));
    i.add<ICacheAdapter>(CacheHive.new);
    i.add<CheckInternetUsecase>(CheckInternetUsecase.new);
    i.addInstance<List<InterceptorsWrapper>>([
      CommonInterceptor(
          cacheAdapter: i(),
          checkInternetUsecase: i(),
          durationCache: const Duration(minutes: 1)),
    ]);
    i.addInstance<IHttpClientAdapter>(
      DioAdapter(
        dio: i<Dio>(),
        interceptors: i<List<InterceptorsWrapper>>(),
      ),
    );
  }
}
