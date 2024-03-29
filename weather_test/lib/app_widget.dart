import 'package:asuka/asuka.dart';
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
  ///     title: 'Global Tour Weather Tracker',
  ///   ),
  /// ```
  ///
  /// This will create and run the [AppWidget]
  /// [MaterialApp] containing the application with the specified title,
  /// theme, and routerConfig
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.setObservers([Asuka.asukaHeroController]);
    return MaterialApp.router(
      builder: Asuka.builder,
      title: 'Global Tour Weather Tracker',
      theme: ThemeData(primarySwatch: Colors.blue),
      routerConfig: Modular.routerConfig,
    );
  }
}
