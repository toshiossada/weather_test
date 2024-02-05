import '../../../../core/helpers/helpers.dart';

class LocationModel {

  const LocationModel({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  factory LocationModel.fromMap(Map<String, dynamic> map) {
    DefaultHelpers.checkKeys(
      map,
      requiredKeys: ['id', 'name', 'coord'],
      disallowNullValues: ['id', 'name', 'coord'],
      objName: 'LocationModel',
    );
    DefaultHelpers.checkKeys(
      map['coord'],
      requiredKeys: ['lat', 'lon'],
      disallowNullValues: ['lat', 'lon'],
      objName: 'LocationModel',
    );

    return LocationModel(
      id: map['id'],
      name: map['name'],
      latitude: map['coord']['lat'],
      longitude: map['coord']['lon'],
    );
  }
  final int id;
  final String name;
  final double latitude;
  final double longitude;
  
}
