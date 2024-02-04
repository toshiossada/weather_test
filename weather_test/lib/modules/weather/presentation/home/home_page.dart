import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/location_entity.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final HomeController controller;
  const HomePage({
    super.key,
    required this.controller,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController get controller => widget.controller;

  @override
  void initState() {
    super.initState();
    controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListenableBuilder(
                listenable: controller.locationStore,
                builder: (_, widget) {
                  return ListView.builder(
                    itemCount: controller.locationStore.location.length,
                    itemBuilder: (BuildContext context, int index) =>
                        _buildList(controller.locationStore.location[index]),
                  );
                }),
          ),
          ListenableBuilder(
            listenable: controller.store,
            builder: (_, widget) {
              return Visibility(
                visible: controller.store.loading,
                child: const CircularProgressIndicator(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildList(LocationEntity location) {
    return ExpansionTile(
      leading: const Icon(Icons.sunny),
      title: Text(
        location.name,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: location.weathers.values.first.length,
          itemBuilder: (context, index) {
            final weather = location.weathers.values.first[index];
            final f = DateFormat('yyyy-MM-dd hh:mm');

            return ListTile(
              title: Text(
                f.format(weather.dateTime),
              ),
              // subtitle: Text(weathers.applicableDate.toString()),
            );
          },
        ),
      ],
    );
  }
}
