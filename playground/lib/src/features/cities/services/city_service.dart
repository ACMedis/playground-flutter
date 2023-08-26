import 'package:playground_app/src/core/exceptions/service_exception.dart';
import 'package:playground_app/src/core/fp/either.dart';
import 'package:playground_app/src/models/city_model.dart';

abstract interface class CityService {
  Future<Either<ServiceException, List<CityModel>>> fetchCities();
}
