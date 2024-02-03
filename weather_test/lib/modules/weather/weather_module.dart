import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_test/modules/core/core_module.dart';

class WeatherModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];
  @override
  void binds(i) {}

  @override
  void routes(r) {}
}
