class LocationModel {
  final String name;
  final double latitude;
  final double longitude;

  LocationModel({
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  factory LocationModel.fromMap(Map<String, dynamic> map) {
    return LocationModel(
      name: (map['name'] ?? '') as String,
      latitude: (map['coord']?['lat'] ?? 0) as double,
      longitude: (map['coord']?['lon'] ?? 0) as double,
    );
  }
}
