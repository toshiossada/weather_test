import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'http_adapter/dio/Interceptor/common_Interceptor.dart';
import 'http_adapter/dio/dio_adapter.dart';
import 'http_adapter/http_client_adapter.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.add<BaseOptions>((i) => BaseOptions(
          baseUrl: '', //config.baseUrlLogin,
        ));
    i.add<Dio>(Dio.new);
    i.add<InterceptorsWrapper>(CommonInterceptor.new);
    i.add<IHttpClientAdapter>(DioAdapter.new);
  }
}
