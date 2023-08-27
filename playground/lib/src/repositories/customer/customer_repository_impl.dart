import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:playground_app/src/core/exceptions/repository_exception.dart';
import 'package:playground_app/src/core/fp/either.dart';
import 'package:playground_app/src/core/fp/nil.dart';
import 'package:playground_app/src/core/restClient/rest_client.dart';
import 'package:playground_app/src/models/customer_model.dart';

import './customer_repository.dart';

class CustomerRepositoryImpl implements CustomerRepository {
  final RestClient restClient;

  CustomerRepositoryImpl(this.restClient);

  @override
  Future<Either<RepositoryException, Nil>> save(
      CustomerModel customerModel) async {
    try {
      await restClient.auth.post('/api/clientes', data: customerModel.toMap());
      return Success(nil);
    } on DioException catch (e, s) {
      log('Erro ao salvar cliente!', error: e, stackTrace: s);
      return Failure(RepositoryException(message: 'Erro ao salvar cliente.'));
    }
  }
}
