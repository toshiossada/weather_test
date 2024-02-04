import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/location_entity.dart';
import 'details_controller.dart';

class DetailPage extends StatefulWidget {
  final int city;
  final DetailsController controller;

  const DetailPage({
    super.key,
    required this.city,
    required this.controller,
  });

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
                          leading:
                              Icon(location.weathers[key]![index].main.icon),
                          subtitle: Text(
                            location.weathers[key]![index].description,
                          ),
                          title: Text(weather.time),
                          trailing: Text(
                            '${weather.temp}°',
                          ),
                        );
                      }),
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }
}
