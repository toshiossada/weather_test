import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../domain/entities/location_entity.dart';

class ListCitiesWidget extends StatelessWidget {
  final LocationEntity location;
  const ListCitiesWidget({
    super.key,
    required this.location,
  });

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
