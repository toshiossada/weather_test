import 'package:flutter_modular/flutter_modular.dart';

import 'modules/core/core_module.dart';
import 'modules/weather/weather_module.dart';

/// The root module of the application that defines the dependency
/// injection setup and the route structure.
///
/// Usage:
/// ```dart
/// void main() {
///   runApp(ModularApp(module: AppModule(), child: MyApp()));
/// }
/// ``
class AppModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void routes(RouteManager r) {
    r.module('/', module: WeatherModule());
  }
}
