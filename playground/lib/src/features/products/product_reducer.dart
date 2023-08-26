import 'package:asp/asp.dart';
import 'package:asyncstate/asyncstate.dart';

import 'package:playground_app/src/core/fp/either.dart';
import 'package:playground_app/src/features/products/product_atom.dart';
import 'package:playground_app/src/features/products/services/product_service.dart';

class ProductReducer extends Reducer {
  final ProductService service;

  ProductReducer(this.service) {
    on(() => [fetchProductsAction], _fetchProductsAction);
    on(() => [clearProductsAction], _clearProductsAction);
  }

  Future<void> _fetchProductsAction() async {
    final asyncLoaderHandler = AsyncLoaderHandler()..start();
    productsState.value.clear();
    errorState.setValue('');
    final result = await service.fetchProducts();

    switch (result) {
      case Success(:final value):
        productsState.setValue(value);
        break;
      case Failure(:final exception):
        errorState.value = exception.message;
        break;
    }
    asyncLoaderHandler.close();
  }

  void _clearProductsAction() {
    productsState.value.clear();
    errorState.setValue('');
  }
}
