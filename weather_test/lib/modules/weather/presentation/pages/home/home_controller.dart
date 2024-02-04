import '../../../domain/usecases/get_location_weather.dart';
import '../../stores/location_store.dart';
import 'home_store.dart';

class HomeController {
  final GetLocationWeather getLocationWeather;
  final LoctionStore locationStore;
  final HomeStore store;

  const HomeController({
    required this.getLocationWeather,
    required this.store,
    required this.locationStore,
  });

  Future<void> init() async {
    store.loading = true;
    await getLocation('São Paulo', 'Brazil');
    await getLocation('Silverstone', 'UK');
    await getLocation('Melbourne', 'Australia');
    await getLocation('Monte Carlo', 'Monaco');
    store.loading = false;
  }

  Future<void> getLocation(String city, String state) async {
    final result = await getLocationWeather(city, state);

    locationStore.addLocation(result);
  }
}
