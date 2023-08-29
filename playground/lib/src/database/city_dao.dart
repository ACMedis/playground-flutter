import 'package:playground_app/src/models/city_model.dart';

abstract class CityDao {
  Future<void> save(CityModel row);
  // Future<void> saveAll(List<CityModel> dtos);
  Future<List<CityModel>> findAll();
  // Future<CityModel> findById(id);
}
