import 'package:flutter/material.dart';

class HomeStore with ChangeNotifier {
  var _loading = false;
  bool get loading => _loading;
  set loading(bool value) {
    _loading = value;

    notifyListeners();
  }
}
