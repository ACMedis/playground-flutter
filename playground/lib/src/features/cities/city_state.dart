import 'package:playground_app/src/models/city_model.dart';

sealed class CityState {
  final List<CityModel> cities;
  final bool isLoading;
  final String? errorMessage;

  CityState({
    required this.cities,
    this.isLoading = false,
    this.errorMessage,
  });

  factory CityState.initial() => CityInitialState();

  CityState setLoading() {
    return CityLoadingState();
  }

  CityState setLoaded(List<CityModel> value) {
    return CityLoadedState(cities: value);
  }

  CityState setError(String message) {
    return CityErrorState(errorMessage: message);
  }
}

class CityInitialState extends CityState {
  CityInitialState()
      : super(
          cities: [],
          isLoading: false,
          errorMessage: '',
        );
}

class CityLoadingState extends CityState {
  CityLoadingState()
      : super(
          cities: [],
          isLoading: true,
          errorMessage: '',
        );
}

class CityLoadedState extends CityState {
  CityLoadedState({required super.cities})
      : super(
          isLoading: false,
          errorMessage: '',
        );
}

class CityErrorState extends CityState {
  CityErrorState({required super.errorMessage})
      : super(
          cities: [],
          isLoading: false,
        );
}
