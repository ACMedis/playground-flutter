import 'dart:developer';

import 'package:playground_app/src/core/exceptions/service_exception.dart';
import 'package:playground_app/src/core/fp/either.dart';
import 'package:playground_app/src/core/fp/nil.dart';
import 'package:playground_app/src/database/db.dart';
import 'package:playground_app/src/models/city_model.dart';
import 'package:playground_app/src/repositories/city/city_repository.dart';

import './city_service.dart';

class CityServiceImpl implements CityService {
  final CityRepository repository;
  final DB db;

  CityServiceImpl(this.repository, this.db);

  @override
  Future<Either<ServiceException, List<CityModel>>> fetchCities() async {
    // final result = await repository.fetchCities();
    // switch (result) {
    //   case Success(:final value):
    //     return Success(value);
    //   case Failure(:final exception):
    //     return Failure(
    //       ServiceException(message: exception.message),
    //     );
    // }

    try {
      final database = await db.database;
      final result = await database.query('city');
      final cities = result.map((e) => CityModel.fromMapEntity(e)).toList();
      return Success(cities);
    } on Exception {
      return Failure(ServiceException(message: 'Erro ao buscar cidades'));
    }
  }

  @override
  Future<Either<ServiceException, Nil>> create() async {
    final database = await db.database;
    final result = await repository.fetchCities();
    switch (result) {
      case Success(:final value):
        final ids = value.map((e) => e.id).toList().join(',');

        database.delete('city', where: ' id in ($ids)');

        for (var i = 0; i < value.length; i++) {
          await database.insert('city', value[i].toMap());
        }
        return Success(nil);
      case Failure(:final exception):
        return Failure(
          ServiceException(
            message: 'Erro ao sincronizar cidades - ${exception.message}',
          ),
        );
    }

    // final database = await db.database;
    // try {
    //   final city = CityModel(
    //     id: 2,
    //     codeErp: 5942,
    //     name: 'TOLEDO',
    //     uf: 'PR',
    //     active: true,
    //   );
    //   await database.insert('city', city.toMap());
    //   return Success(nil);
    // } catch (e) {
    //   log('Error ao Salvar cidade');
    //   return Failure(ServiceException(message: 'Erro ao salvar cidade'));
    // }
  }
}
