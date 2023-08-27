// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_add_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CustomerAddStore on _CustomerAddStoreBase, Store {
  late final _$stateAtom =
      Atom(name: '_CustomerAddStoreBase.state', context: context);

  @override
  CustomerAddState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(CustomerAddState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$registerAsyncAction =
      AsyncAction('_CustomerAddStoreBase.register', context: context);

  @override
  Future<void> register(
      {required String name,
      required String cpf,
      required String address,
      required String addressNumber,
      required String neighborhood,
      required String email,
      required String cep}) {
    return _$registerAsyncAction.run(() => super.register(
        name: name,
        cpf: cpf,
        address: address,
        addressNumber: addressNumber,
        neighborhood: neighborhood,
        email: email,
        cep: cep));
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
