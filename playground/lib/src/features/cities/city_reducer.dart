import 'package:asp/asp.dart';

import 'package:playground_app/src/core/fp/either.dart';
import 'package:playground_app/src/features/cities/city_atom.dart';
import 'package:playground_app/src/features/cities/services/city_service.dart';

class CityReducer extends Reducer {
  final CityService service;

  CityReducer(this.service) {
    on(() => [fetchCitiesAction], _fetchCitiesAction);
    on(() => [clearCitiesAction], _clearCitiesAction);
  }

  Future<void> _fetchCitiesAction() async {
    cityLoadingState.value = true;
    citiesState.value.clear();
    cityErrorMessage.setValue('');
    final result = await service.fetchCities();

    switch (result) {
      case Success(:final value):
        citiesState.setValue(value);
        break;
      case Failure(:final exception):
        cityErrorMessage.value = exception.message;
        break;
    }
    cityLoadingState.value = false;
  }

  Future<void> _clearCitiesAction() async {
    citiesState.value.clear();
    cityErrorMessage.setValue('');
  }
}
