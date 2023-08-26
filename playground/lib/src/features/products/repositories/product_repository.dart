import 'package:playground_app/src/core/exceptions/repository_exception.dart';
import 'package:playground_app/src/core/fp/either.dart';
import 'package:playground_app/src/models/product_model.dart';

abstract interface class ProductRepository {
  Future<Either<RepositoryException, List<ProductModel>>> fetchProducts();
}
