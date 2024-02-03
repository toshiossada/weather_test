import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_test/modules/core/core_module.dart';
import 'package:weather_test/modules/weather/domain/usecases/get_location_weather.dart';

import 'domain/repositories/weather_repository_interface.dart';
import 'infra/datasources/weather_datasource.dart';
import 'infra/repositories/datasources/weather_datasource_interface.dart';
import 'infra/repositories/weather_repository.dart';

class WeatherModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];
  @override
  void binds(i) {
    i.add<IWeatherDatasource>((i) => WeatherDatasource.new);
    i.add<IWeatherRepository>((i) => WeatherRepository.new);
    i.add((i) => GetLocationWeather.new);
  }

  @override
  void routes(r) {}
}
