import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:playground_app/src/core/exceptions/repository_exception.dart';
import 'package:playground_app/src/core/fp/either.dart';
import 'package:playground_app/src/core/restClient/rest_client.dart';
import 'package:playground_app/src/models/product_model.dart';

import './product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final RestClient restClient;

  ProductRepositoryImpl(this.restClient);

  @override
  Future<Either<RepositoryException, List<ProductModel>>>
      fetchProducts() async {
    try {
      final response = await restClient.auth
          .get('/api/produtos/alterados/2022-05-1808:00:00');
      final listProducts = response.data as List;
      final products = listProducts.map(ProductModel.fromMap).toList();
      return Success(products);
    } on DioException catch (e, s) {
      log('Erro na consulta de produtos!', error: e, stackTrace: s);
      return Failure(
          RepositoryException(message: 'Erro na consulta de produtos.'));
    } on ArgumentError catch (e, s) {
      log('Erro ao buscar produtos', error: e, stackTrace: s);
      return Failure(RepositoryException(message: 'Erro ao buscar produtos'));
    }
  }
}
