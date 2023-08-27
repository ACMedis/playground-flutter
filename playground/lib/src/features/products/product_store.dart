import 'package:mobx/mobx.dart';
import 'package:playground_app/src/core/fp/either.dart';
import 'package:playground_app/src/features/products/product_state.dart';
import 'package:playground_app/src/services/product/product_service.dart';
part 'product_store.g.dart';

class ProductStore = _ProductStoreBase with _$ProductStore;

abstract class _ProductStoreBase with Store {
  final ProductService _service;

  _ProductStoreBase(this._service);

  @observable
  ProductState state = ProductState.initial();

  @action
  Future<void> fetchProducts() async {
    state = state.setLoading();
    final result = await _service.fetchProducts();

    switch (result) {
      case Success(:final value):
        state = state.setLoaded(value);
      case Failure(:final exception):
        state = state.setError(exception.message);
    }
  }
}
