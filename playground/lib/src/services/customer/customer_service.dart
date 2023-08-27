import 'package:playground_app/src/core/exceptions/service_exception.dart';
import 'package:playground_app/src/core/fp/either.dart';
import 'package:playground_app/src/core/fp/nil.dart';
import 'package:playground_app/src/models/customer_model.dart';

abstract interface class CustomerService {
  Future<Either<ServiceException, Nil>> save(CustomerModel customerModel);
}
