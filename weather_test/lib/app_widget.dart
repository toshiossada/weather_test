import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

/// The main widget of the application.
///
/// It creates the [MaterialApp] instance and sets up the router configuration.
class AppWidget extends StatelessWidget {
  /// Example usage:
  ///
  /// ```dart
  ///   AppWidget(
  ///     title: 'My Smart App',
  ///   ),
  /// ```
  ///
  /// This will create and run the [AppWidget]
  /// [MaterialApp] containing the application with the specified title,
  /// theme, and routerConfig
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'My Smart App',
      theme: ThemeData(primarySwatch: Colors.blue),
      routerConfig: Modular.routerConfig,
    );
  }
}
