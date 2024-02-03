import 'package:flutter_modular/flutter_modular.dart';

import 'modules/core/core_module.dart';
import 'modules/weather/weather_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void routes(r) {
    r.module('/', module: WeatherModule());
  }
}
