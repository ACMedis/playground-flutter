import 'package:playground_app/src/core/exceptions/repository_exception.dart';
import 'package:playground_app/src/core/fp/either.dart';
import 'package:playground_app/src/core/fp/nil.dart';
import 'package:playground_app/src/models/customer_model.dart';

abstract interface class CustomerRepository {
  Future<Either<RepositoryException, Nil>> save(CustomerModel customerModel);
}
