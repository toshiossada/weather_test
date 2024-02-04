class LocationModel {
  final int id;
  final String name;
  final double latitude;
  final double longitude;

  LocationModel({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  factory LocationModel.fromMap(Map<String, dynamic> map) {
    return LocationModel(
      id: (map['id'] ?? 0),
      name: (map['name'] ?? ''),
      latitude: (map['coord']?['lat'] ?? 0.0),
      longitude: (map['coord']?['lon'] ?? 0.0),
    );
  }
}
