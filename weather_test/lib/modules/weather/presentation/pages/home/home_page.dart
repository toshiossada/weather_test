import 'package:flutter/material.dart';

import 'home_controller.dart';
import 'widgets/list_cities_widget.dart';
import 'widgets/search_bar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    required this.controller, super.key,
  });
  final HomeController controller;

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
  void dispose() {
    controller.store.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: SearchBarWidget(
                location: controller.locationStore.location,
                onSearch: (value) {
                  controller.locationStore.filter = value;
                },
              ),
            ),
            const Divider(),
            Expanded(
              child: ListenableBuilder(
                  listenable: controller.locationStore,
                  builder: (_, widget) {
                    return ListView.builder(
                      itemCount:
                          controller.locationStore.locationFilteres.length,
                      itemBuilder: (BuildContext context, int index) =>
                          ListCitiesWidget(
                        location:
                            controller.locationStore.locationFilteres[index],
                      ),
                    );
                  },),
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
      ),
    );
  }
}
