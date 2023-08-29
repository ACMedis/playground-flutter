import 'package:mobx/mobx.dart';

import 'package:playground_app/src/core/fp/either.dart';
import 'package:playground_app/src/features/cities/city_state.dart';
import 'package:playground_app/src/services/city/city_service.dart';

part 'city_store.g.dart';

class CityStore = _CityStoreBase with _$CityStore;

abstract class _CityStoreBase with Store {
  final CityService service;

  _CityStoreBase(this.service);

  @observable
  CityState state = CityState.initial();

  @action
  Future<void> fetchCities() async {
    state = state.setLoading();
    final result = await service.fetchCities();

    switch (result) {
      case Success(:final value):
        state = state.setLoaded(value);
      case Failure(:final exception):
        state = state.setError(exception.message);
    }
  }

  Future<void> create() async {
    service.create();
  }
}
