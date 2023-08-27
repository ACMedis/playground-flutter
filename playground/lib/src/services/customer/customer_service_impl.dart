import 'package:playground_app/src/core/exceptions/service_exception.dart';
import 'package:playground_app/src/core/fp/either.dart';
import 'package:playground_app/src/core/fp/nil.dart';
import 'package:playground_app/src/models/customer_model.dart';
import 'package:playground_app/src/repositories/customer/customer_repository.dart';

import './customer_service.dart';

class CustomerServiceImpl implements CustomerService {
  final CustomerRepository repository;

  CustomerServiceImpl(this.repository);

  @override
  Future<Either<ServiceException, Nil>> save(
      CustomerModel customerModel) async {
    final result = await repository.save(customerModel);
    switch (result) {
      case Success():
        return Success(nil);
      case Failure(:final exception):
        return Failure(ServiceException(message: exception.message));
    }
  }
}
