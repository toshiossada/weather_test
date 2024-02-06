import '../../../../core/helpers/helpers_errors.dart';
import '../../../domain/usecases/get_location_weather.dart';
import '../../stores/location_store.dart';
import 'home_store.dart';

class HomeController {
  const HomeController({
    required this.getLocationWeather,
    required this.store,
    required this.locationStore,
  });
  final GetLocationWeather getLocationWeather;
  final LoctionStore locationStore;
  final HomeStore store;

  Future<void> init() async {
    try {
      store.loading = true;

      await Future.wait([
        getLocation('São Paulo', 'Brazil'),
        getLocation('Silverstone', 'UK'),
        getLocation('Melbourne', 'Australia'),
        getLocation('Monte Carlo', 'Monaco'),
      ]);
    } finally {
      store.loading = false;
    }
  }

  Future<void> getLocation(String city, String state) async {
    try {
      final result = await getLocationWeather(city, state);

      locationStore.addLocation(result);
    } on RequiredKeysError catch (e) {
      print(e.message);
    }
  }
}
