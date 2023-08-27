import 'package:mobx/mobx.dart';

import 'package:playground_app/src/core/fp/either.dart';
import 'package:playground_app/src/features/customers/customer_add/customer_add_state.dart';
import 'package:playground_app/src/models/customer_model.dart';
import 'package:playground_app/src/services/customer/customer_service.dart';

part 'customer_add_store.g.dart';

class CustomerAddStore = _CustomerAddStoreBase with _$CustomerAddStore;

abstract class _CustomerAddStoreBase with Store {
  final CustomerService service;

  _CustomerAddStoreBase(this.service);

  @observable
  CustomerAddState state = CustomerAddState.initial();

  @action
  Future<void> register({
    required String name,
    required String cpf,
    required String address,
    required String addressNumber,
    required String neighborhood,
    required String email,
    required String cep,
  }) async {
    final data = CustomerModel(
      name: name,
      typeCustomer: 'FISICA',
      email: email,
      idCity: 32,
      address: address,
      addressNumber: addressNumber,
      neighborhood: neighborhood,
      cep: cep,
      phone: '(45) 98823-1585',
      cpf: cpf,
    );
    state = state.setLoading();
    final result = await service.save(data);
    switch (result) {
      case Success():
        state = state.setSaved();
      case Failure(:final exception):
        state = state.setError(exception.message);
    }
  }
}
