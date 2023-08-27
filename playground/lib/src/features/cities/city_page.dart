import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:playground_app/src/core/ui/helpers/messages.dart';
import 'package:playground_app/src/core/ui/widgets/playground_button.dart';
import 'package:playground_app/src/core/ui/widgets/playground_empty.dart';
import 'package:playground_app/src/features/cities/city_state.dart';
import 'package:playground_app/src/features/cities/city_store.dart';
import 'package:playground_app/src/features/cities/widgets/city_tile.dart';

class CityPage extends StatefulWidget {
  const CityPage({super.key});

  @override
  State<CityPage> createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  late ReactionDisposer _reactDisposer;

  @override
  void initState() {
    super.initState();
    final store = Modular.get<CityStore>();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _reactDisposer = reaction((_) => store.state, (state) {
        if (state is CityErrorState) {
          Messages.showError(state.errorMessage!, context);
        }
      });
    });
  }

  @override
  void dispose() {
    _reactDisposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final store = Modular.get<CityStore>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista produtos'),
      ),
      body: Observer(builder: (_) {
        final state = store.state;
        final citiesLength = state.cities.length;

        return Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PlaygroundButton(
                  label: 'Pesquisar',
                  onPressed: () {
                    store.fetchCities();
                  },
                  isLoading: (state is CityLoadingState),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Visibility(
                    visible: (citiesLength == 0),
                    replacement: ListView.builder(
                      itemCount: citiesLength,
                      itemBuilder: (_, index) {
                        final city = state.cities[index];
                        return CityTile(city: city);
                      },
                    ),
                    child: const PlaygroundEmpty(
                        imagePath: 'assets/images/empty.png',
                        message: 'Nenhuma cidade encontrada!'),
                  ),
                ),
                Offstage(
                  offstage: (citiesLength == 0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                      ),
                      child: Center(
                          child: Text(
                        'Total de cidades: $citiesLength',
                        style: const TextStyle(fontSize: 16),
                      )),
                    ),
                  ),
                )
              ],
            ));
      }),
    );
  }
}
