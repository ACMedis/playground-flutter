import 'package:playground_app/src/core/exceptions/repository_exception.dart';
import 'package:playground_app/src/core/fp/either.dart';
import 'package:playground_app/src/models/city_model.dart';

abstract interface class CityRepository {
  Future<Either<RepositoryException, List<CityModel>>> fetchCities();
}
