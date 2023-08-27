// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CityStore on _CityStoreBase, Store {
  late final _$stateAtom = Atom(name: '_CityStoreBase.state', context: context);

  @override
  CityState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(CityState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$fetchCitiesAsyncAction =
      AsyncAction('_CityStoreBase.fetchCities', context: context);

  @override
  Future<void> fetchCities() {
    return _$fetchCitiesAsyncAction.run(() => super.fetchCities());
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
