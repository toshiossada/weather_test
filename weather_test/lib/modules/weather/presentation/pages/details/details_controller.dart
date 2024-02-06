import '../../../domain/entities/location_entity.dart';
import '../../stores/location_store.dart';

/// A controller that manages the business logic for the details page.
///
/// This controller provides methods for accessing location data
///  from a LocationStore.
/// It is used to retrieve and manipulate location-specific information,
/// such as weather details.
class DetailsController {
  /// Usage:
  /// ```dart
  ///   DetailsController({
  ///       locationStore: LoctionStore(),
  ///   })
  /// ```
  const DetailsController(this.locationStore);

  /// The store that holds location data.
  final LoctionStore locationStore;

  /// Retrieves the list of all locations from the store.
  ///
  /// This getter allows access to the list of [LocationEntity]
  /// objects currently
  /// held in the [locationStore].
  List<LocationEntity> get locations => locationStore.location;

  /// Retrieves a specific [LocationEntity] by its city identifier.
  ///
  /// This method searches the list of locations for a [LocationEntity] with the
  /// matching city identifier and returns it.
  ///
  /// - `city`: The unique identifier of the city for which to retrieve the
  /// location entity.
  ///
  /// Throws [StateError] if no location with the specified city identifier
  /// is found.
  ///
  /// Returns a [LocationEntity] corresponding to the given city identifier.

  LocationEntity location(int city) =>
      locations.firstWhere((element) => element.id == city);
}
