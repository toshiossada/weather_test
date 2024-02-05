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
import 'presentation/pages/details/detail_page.dart';
import 'presentation/pages/details/details_controller.dart';
import 'presentation/pages/home/home_controller.dart';
import 'presentation/pages/home/home_page.dart';
import 'presentation/pages/home/home_store.dart';
import 'presentation/stores/location_store.dart';

class WeatherModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void binds(Injector i) {
    // i.add<IWeatherRepository>(WeatherRepository.new);
    i
      ..add<BaseMapper<LocationEntity, LocationModel>>(LocationMapper.new)
      ..add<BaseMapper<WeatherEntity, WeatherModel>>(WeatherMapper.new)
      ..add<IWeatherDatasource>(WeatherDatasource.new)
      ..add<IWeatherRepository>(() => WeatherRepository(
            dataSource: i.get<IWeatherDatasource>(),
            locationMapper: i.get<BaseMapper<LocationEntity, LocationModel>>(),
            weatherMapper: i.get<BaseMapper<WeatherEntity, WeatherModel>>(),
          ),)
      ..add(GetLocationWeather.new)
      ..addLazySingleton(LoctionStore.new)
      ..addLazySingleton(HomeStore.new)
      ..add<HomeController>(HomeController.new)
      ..add<DetailsController>(DetailsController.new);
  }

  @override
  void routes(RouteManager r) {
    r
      ..child(
        '/',
        child: (context) => HomePage(
          controller: Modular.get<HomeController>(),
        ),
      )
      ..child(
        '/details/:city',
        child: (context) => DetailPage(
          city: int.parse(r.args.params['city']),
          controller: Modular.get<DetailsController>(),
        ),
      );
  }
}
