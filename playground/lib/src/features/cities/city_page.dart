import 'package:flutter/material.dart';

import 'package:asp/asp.dart';

import 'package:playground_app/src/core/ui/helpers/messages.dart';
import 'package:playground_app/src/features/cities/city_atom.dart';
import 'package:playground_app/src/features/cities/widgets/city_tile.dart';

class CityPage extends StatefulWidget {
  const CityPage({super.key});

  @override
  State<CityPage> createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  late final RxDisposer _errorListeners;

  @override
  void initState() {
    super.initState();
    _errorListeners = rxObserver(
      () => cityErrorMessage.value,
      filter: () => cityErrorMessage.value.isNotEmpty,
      effect: (value) => Messages.showError(cityErrorMessage.value, context),
    );
  }

  @override
  void dispose() {
    _errorListeners();
    clearCitiesAction();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final (cities, errorMessage) = context.select(
      () => (citiesState.value, cityErrorMessage.value),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista produtos'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Error: $errorMessage'),
            ElevatedButton(
              onPressed: () {
                fetchCitiesAction.call();
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(56),
              ),
              child: const Text('Pesquisar'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: cities.length,
                itemBuilder: (_, index) {
                  final city = cities[index];
                  return CityTile(city: city);
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Colors.grey,
                ),
                child: Center(
                    child: Text(
                  'Total de cidades: ${cities.length}',
                  style: const TextStyle(fontSize: 16),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
