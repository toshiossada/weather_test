import 'package:flutter/material.dart';

/// A store that manages the state for the home page of a Flutter application.
class HomeStore with ChangeNotifier {
  var _loading = false;

  /// A getter to retrieve the current loading state.
  bool get loading => _loading;

  /// A setter to update the loading state.
  set loading(bool value) {
    _loading = value;

    notifyListeners();
  }
}
