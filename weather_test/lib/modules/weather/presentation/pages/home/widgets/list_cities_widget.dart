import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../domain/entities/location_entity.dart';

/// A widget that displays a list of cities and their corresponding
/// weather information.
class ListCitiesWidget extends StatelessWidget {
  /// Usage:
  /// ```dart
  ///   ListCitiesWidget({
  ///       location: LocationEntity(),
  ///   })
  /// ```
  const ListCitiesWidget({
    required this.location,
    super.key,
  });

  /// The location entity containing weather information about the city.
  final LocationEntity location;

  @override
  Widget build(BuildContext context) {
    final main = location.weathers.values.first[0].main;
    return ExpansionTile(
      leading: Icon(main.icon),
      trailing: IconButton(
        icon: const Icon(Icons.navigate_next),
        onPressed: () {
          Modular.to.pushNamed('details/${location.id}');
        },
      ),
      title: Text(
        '${location.name}, ${location.country}',
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: location.weathers.values.first.length,
          itemBuilder: (context, index) {
            final weather = location.weathers.values.first[index];

            return ListTile(
              leading: Icon(weather.main.icon),
              title: Text(weather.time),
              subtitle: Text(weather.description),
              trailing: Text('${weather.temp}°'),
            );
          },
        ),
      ],
    );
  }
}
