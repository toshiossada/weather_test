import '../../../domain/entities/location_entity.dart';
import '../../stores/location_store.dart';

class DetailsController {

  DetailsController(this.locationStore);
  final LoctionStore locationStore;

  List<LocationEntity> get locations => locationStore.location;

  LocationEntity location(int city) =>
      locations.firstWhere((element) => element.id == city);
}
