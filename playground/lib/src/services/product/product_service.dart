import 'package:playground_app/src/core/exceptions/service_exception.dart';
import 'package:playground_app/src/core/fp/either.dart';
import 'package:playground_app/src/models/product_model.dart';

abstract interface class ProductService {
  Future<Either<ServiceException, List<ProductModel>>> fetchProducts();
}
