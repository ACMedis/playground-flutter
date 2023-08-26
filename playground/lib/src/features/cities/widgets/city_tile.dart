import 'package:flutter/material.dart';

import 'package:playground_app/src/models/city_model.dart';

class CityTile extends StatelessWidget {
  final CityModel city;

  const CityTile({
    super.key,
    required this.city,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Código: ${city.codeErp}'),
          const SizedBox(height: 6),
          Text(city.name),
          const SizedBox(height: 3),
          const Divider(),
        ],
      ),
    );
  }
}
