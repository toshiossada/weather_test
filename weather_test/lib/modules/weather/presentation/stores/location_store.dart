import 'package:flutter/material.dart';

import '../../domain/entities/location_entity.dart';

class LoctionStore with ChangeNotifier {
  final List<LocationEntity> _location = [];
  List<LocationEntity> get location => _location;

  void addLocation(LocationEntity value) {
    _location.add(value);
    notifyListeners();
  }
}
