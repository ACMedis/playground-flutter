import 'package:asp/asp.dart';

import 'package:playground_app/src/models/city_model.dart';

// ATOMS
final citiesState = Atom<List<CityModel>>([]);
final cityErrorMessage = Atom<String>('');

//ACTIONS
final fetchCitiesAction = Atom.action();
final clearCitiesAction = Atom.action();
