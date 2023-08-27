import 'package:flutter/material.dart';

import 'package:playground_app/src/core/ui/helpers/messages.dart';
import 'package:playground_app/src/features/cities/widgets/city_tile.dart';

class CityPage extends StatefulWidget {
  const CityPage({super.key});

  @override
  State<CityPage> createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista produtos'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(56),
              ),
              child: const Text('Pesquisar'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Visibility(
                visible: false,
                replacement: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (_, index) {
                    return null;

                    // final city = cities[index];
                    // return CityTile(city: city);
                  },
                ),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Colors.grey,
                ),
                child: const Center(
                    child: Text(
                  'Total de cidades: 0',
                  style: TextStyle(fontSize: 16),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
