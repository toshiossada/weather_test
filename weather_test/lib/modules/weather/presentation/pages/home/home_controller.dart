import 'package:flutter/material.dart';

import '../../../../core/helpers/helpers_errors.dart';
import '../../../domain/usecases/get_location_weather.dart';
import '../../stores/location_store.dart';
import 'home_store.dart';

/// A controller that manages the business logic for the home page.
///
/// This controller is responsible for initializing the home page with 
/// weather data for
/// predefined locations and updating the UI state accordingly.
class HomeController {
  /// Usage:
  /// ```dart
  ///   HomeController({
  ///       getLocationWeather: GetLocationWeather(),
  ///       store: HomeStore(),
  ///       locationStore: LoctionStore(),
  ///   })
  /// ```
  const HomeController({
    required this.getLocationWeather,
    required this.store,
    required this.locationStore,
  });

  /// The use case for getting weather data for a location.
  final GetLocationWeather getLocationWeather;

  /// The store that holds location data.
  final LoctionStore locationStore;

  /// The store that holds the state for the home page.
  final HomeStore store;

  /// Initializes the controller by fetching weather data for
  /// predefined locations.
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

  /// Fetches and stores the weather data for a specific city and state.
  Future<void> getLocation(String city, String state) async {
    try {
      final result = await getLocationWeather(city, state);

      locationStore.addLocation(result);
    } on RequiredKeysError catch (e) {
      debugPrint(e.message);
    }
  }
}
