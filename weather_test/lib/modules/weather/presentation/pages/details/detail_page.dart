import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/location_entity.dart';
import 'details_controller.dart';

/// A page that displays detailed weather information for a specific city.
///
/// This [StatefulWidget] takes a city identifier and a [DetailsController] to
/// manage the retrieval and display of detailed weather information.
class DetailPage extends StatefulWidget {
  /// Usage:
  /// ```dart
  ///   DetailPage({
  ///       city: 1,
  ///       controller: DetailsController(),
  ///   })
  /// ```
  const DetailPage({
    required this.city,
    required this.controller,
    super.key,
  });

  /// The identifier of the city for which to display weather details.
  final int city;

  /// The controller that manages the logic for fetching and displaying
  /// weather details.

  final DetailsController controller;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  DetailsController get controller => widget.controller;
  late LocationEntity location;
  @override
  void initState() {
    super.initState();
    location = controller.location(widget.city);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${location.name}, ${location.country}'),
      ),
      body: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              enableInfiniteScroll: false,
              viewportFraction: 1,
            ),
            items: location.weathers.keys.map(
              (key) {
                final date = location.weathers[key]!.first.main;
                return ListTile(
                  title: Row(
                    children: [
                      Icon(date.icon),
                      const Spacer(),
                      Text(key),
                      const Spacer(),
                    ],
                  ),
                  subtitle: ListView.builder(
                    itemCount: location.weathers[key]!.length,
                    itemBuilder: (_, index) {
                      final weather = location.weathers[key]![index];
                      return ListTile(
                        leading: Icon(location.weathers[key]![index].main.icon),
                        subtitle: Text(
                          location.weathers[key]![index].description,
                        ),
                        title: Text(weather.time),
                        trailing: Text(
                          '${weather.temp}°',
                        ),
                      );
                    },
                  ),
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }
}
