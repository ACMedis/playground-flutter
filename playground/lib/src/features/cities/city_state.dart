import 'package:playground_app/src/models/city_model.dart';

class CityState {
  final List<CityModel> cities;
  final bool isLoading;
  final String errorMessage;

  CityState(
      {required this.cities,
      required this.isLoading,
      required this.errorMessage});

  factory CityState.initial() => CityState(
        cities: [],
        errorMessage: '',
        isLoading: false,
      );

  CityState copyWith(
      {List<CityModel>? cities, bool? isLoading, String? errorMessage}) {
    return CityState(
        cities: cities ?? this.cities,
        isLoading: isLoading ?? this.isLoading,
        errorMessage: errorMessage ?? this.errorMessage);
  }
}
