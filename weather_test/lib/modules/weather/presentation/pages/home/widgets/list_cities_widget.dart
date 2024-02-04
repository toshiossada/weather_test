import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

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
          Modular.to.pushNamed('details', arguments: location);
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
            final f = DateFormat('yyyy-MM-dd hh:mm');

            return ListTile(
              leading: Icon(weather.main.icon),
              title: Text(
                f.format(weather.dateTime),
              ),
              subtitle: Text(weather.description),
              trailing: Text('${weather.temp}°'),
            );
          },
        ),
      ],
    );
  }
}
