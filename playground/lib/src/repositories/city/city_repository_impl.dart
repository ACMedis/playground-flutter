// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:playground_app/src/core/exceptions/repository_exception.dart';
import 'package:playground_app/src/core/fp/either.dart';
import 'package:playground_app/src/core/restClient/rest_client.dart';
import 'package:playground_app/src/models/city_model.dart';

import './city_repository.dart';

class CityRepositoryImpl implements CityRepository {
  final RestClient restClient;
  CityRepositoryImpl(this.restClient);

  @override
  Future<Either<RepositoryException, List<CityModel>>> fetchCities() async {
    try {
      final response = await restClient.auth
          .get('/api/cidades/alterados/2022-05-1808:00:00');
      final listProducts = response.data as List;
      final products = listProducts.map(CityModel.fromMap).toList();
      return Success(products);
    } on DioException catch (e, s) {
      log('Erro na consulta de cidades!', error: e, stackTrace: s);
      return Failure(
          RepositoryException(message: 'Erro na consulta de cidades.'));
    } on ArgumentError catch (e, s) {
      log('Erro ao buscar cidades', error: e, stackTrace: s);
      return Failure(RepositoryException(message: 'Erro ao buscar cidades'));
    }
  }
}
