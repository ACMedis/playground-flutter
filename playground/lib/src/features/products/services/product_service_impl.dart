import 'package:playground_app/src/core/exceptions/service_exception.dart';
import 'package:playground_app/src/core/fp/either.dart';
import 'package:playground_app/src/features/products/repositories/product_repository.dart';
import 'package:playground_app/src/models/product_model.dart';

import 'product_service.dart';

class ProductServiceImpl implements ProductService {
  final ProductRepository repository;

  ProductServiceImpl(this.repository);

  @override
  Future<Either<ServiceException, List<ProductModel>>> fetchProducts() async {
    final result = await repository.fetchProducts();
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
