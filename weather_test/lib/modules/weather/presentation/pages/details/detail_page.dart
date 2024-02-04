import 'package:flutter/material.dart';

import '../../../domain/entities/location_entity.dart';

class DetailPage extends StatefulWidget {
  final LocationEntity location;

  const DetailPage({
    super.key,
    required this.location,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.location.name}, ${widget.location.country}'),
      ),
      body: const Column(),
    );
  }
}
