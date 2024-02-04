import 'package:flutter_modular/flutter_modular.dart';

import '../core/base_mapper.dart';
import '../core/core_module.dart';
import 'domain/entities/location_entity.dart';
import 'domain/entities/weather_entity.dart';
import 'domain/repositories/weather_repository_interface.dart';
import 'domain/usecases/get_location_weather.dart';
import 'infra/datasources/weather_datasource.dart';
import 'infra/repositories/datasources/weather_datasource_interface.dart';
import 'infra/repositories/mappers/location_mapper.dart';
import 'infra/repositories/mappers/weather_mapper.dart';
import 'infra/repositories/models/location_model.dart';
import 'infra/repositories/models/weather_model.dart';
import 'infra/repositories/weather_repository.dart';
import 'presentation/home/home_controller.dart';
import 'presentation/home/home_page.dart';
import 'presentation/home/home_store.dart';
import 'presentation/stores/location_store.dart';

class WeatherModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void binds(i) {
    i.add<BaseMapper<LocationEntity, LocationModel>>(LocationMapper.new);
    i.add<BaseMapper<WeatherEntity, WeatherModel>>(WeatherMapper.new);
    i.add<IWeatherDatasource>(WeatherDatasource.new);
    // i.add<IWeatherRepository>(WeatherRepository.new);
    i.add<IWeatherRepository>(() => WeatherRepository(
          dataSource: i.get(),
          locationMapper: i.get(),
          weatherMapper: i.get(),
        ));
    i.add(GetLocationWeather.new);
    i.add(LoctionStore.new);
    i.add(HomeStore.new);
    i.add<HomeController>(HomeController.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => HomePage(
        controller: Modular.get<HomeController>(),
      ),
    );
  }
}
