import 'package:flutter/material.dart';

import '../../domain/entities/location_entity.dart';

/// A store that manages the state of location data within the application.
class LoctionStore with ChangeNotifier {
  final List<LocationEntity> _location = [];

  var _filter = '';

  /// A getter to retrieve the current filter string.
  String get filter => _filter;

  /// A setter to update the filter string.
  set filter(String value) {
    _filter = value;
    notifyListeners();
  }

  /// A getter to retrieve the unfiltered list of locations.
  List<LocationEntity> get location => _location;

  /// A getter to retrieve a filtered list of locations based on the
  /// current filter string.
  List<LocationEntity> get locationFilteres => _location
      .where(
        (element) =>
            _filter.isEmpty ||
            element.name.toLowerCase().contains(_filter.toLowerCase()),
      )
      .toList();

  /// Adds a new [LocationEntity] to the list of locations
  /// and notifies listeners.
  void addLocation(LocationEntity value) {
    _location.add(value);
    notifyListeners();
  }
}
