import 'package:playground_app/src/core/exceptions/service_exception.dart';
import 'package:playground_app/src/core/fp/either.dart';
import 'package:playground_app/src/models/city_model.dart';
import 'package:playground_app/src/repositories/city/city_repository.dart';

import './city_service.dart';

class CityServiceImpl implements CityService {
  final CityRepository repository;

  CityServiceImpl(this.repository);

  @override
  Future<Either<ServiceException, List<CityModel>>> fetchCities() async {
    final result = await repository.fetchCities();
    switch (result) {
      case Success(:final value):
        return Success(value);
      case Failure(:final exception):
        return Failure(
          ServiceException(message: exception.message),
        );
    }
  }
}
