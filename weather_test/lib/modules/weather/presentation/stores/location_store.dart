import 'package:flutter/material.dart';

import '../../domain/entities/location_entity.dart';

class LoctionStore with ChangeNotifier {
  final List<LocationEntity> _location = [];
  var _filter = '';
  String get filter => _filter;
  set filter(String value) {
    _filter = value;
    notifyListeners();
  }

  List<LocationEntity> get location => _location;
  List<LocationEntity> get locationFilteres => _location
      .where((element) =>
          _filter.isEmpty ||
          element.name.toLowerCase().contains(_filter.toLowerCase()))
      .toList();

  void addLocation(LocationEntity value) {
    _location.add(value);
    notifyListeners();
  }
}
