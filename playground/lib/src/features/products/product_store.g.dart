// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductStore on _ProductStoreBase, Store {
  late final _$stateAtom =
      Atom(name: '_ProductStoreBase.state', context: context);

  @override
  ProductState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(ProductState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$fetchProductsAsyncAction =
      AsyncAction('_ProductStoreBase.fetchProducts', context: context);

  @override
  Future<void> fetchProducts() {
    return _$fetchProductsAsyncAction.run(() => super.fetchProducts());
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
