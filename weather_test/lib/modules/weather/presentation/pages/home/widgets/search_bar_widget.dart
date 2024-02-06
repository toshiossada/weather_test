import 'package:flutter/material.dart';

import '../../../../../core/extensions/diacritics_extension.dart';
import '../../../../domain/entities/location_entity.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({
    required this.location,
    required this.onSearch,
    super.key,
  });
  final List<LocationEntity> location;
  final Function(String) onSearch;

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SearchAnchor(
        builder: (BuildContext context, SearchController controller) {
          return SearchBar(
            controller: controller,
            padding: const MaterialStatePropertyAll<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 16),
            ),
            onTap: () {
              controller.openView();
            },
            onChanged: (_) {
              controller.openView();
            },
            leading: const Icon(Icons.search),
            hintText: 'Search for City',
            trailing: controller.text.isEmpty
                ? null
                : [
                    Tooltip(
                      message: 'Clear',
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            controller.clear();
                            widget.onSearch.call('');
                          });
                        },
                        icon: const Icon(Icons.clear),
                      ),
                    ),
                  ],
          );
        },
        suggestionsBuilder: (context, controller) {
          final filteres = widget.location
              .where(
                (element) =>
                    element.name.withoutDiacriticalMarks.toLowerCase().contains(
                          controller.text.withoutDiacriticalMarks.toLowerCase(),
                        ),
              )
              .toList();
          return List<ListTile>.generate(
            filteres.length,
            (index) {
              final location = filteres[index];
              return ListTile(
                title: Text(location.name),
                onTap: () {
                  setState(() {
                    controller.closeView(location.name);
                    widget.onSearch.call(location.name);
                  });
                },
              );
            },
          );
        },
      ),
    );
  }
}
