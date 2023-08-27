import 'package:playground_app/src/models/product_model.dart';

// enum ProductStateStatus {
//   initial,
//   loading,
//   loaded,
//   error,
// }

sealed class ProductState {
  final List<ProductModel> products;
  final bool isLoading;
  final String? errorMessage;

  ProductState({
    required this.products,
    this.isLoading = false,
    this.errorMessage,
  });

  factory ProductState.initial() => ProductInitialState();

  ProductState setLoading() {
    return ProductLoadingState();
  }

  ProductState setLoaded(List<ProductModel> value) {
    return ProductLoadedState(products: value);
  }

  ProductState setError(String message) {
    return ProductErrorState(errorMessage: message);
  }
}

class ProductInitialState extends ProductState {
  ProductInitialState()
      : super(
          products: [],
          isLoading: false,
          errorMessage: '',
        );
}

class ProductLoadingState extends ProductState {
  ProductLoadingState()
      : super(
          products: [],
          isLoading: true,
          errorMessage: '',
        );
}

class ProductLoadedState extends ProductState {
  ProductLoadedState({required super.products})
      : super(
          isLoading: false,
          errorMessage: '',
        );
}

class ProductErrorState extends ProductState {
  ProductErrorState({required super.errorMessage})
      : super(
          products: [],
          isLoading: false,
        );
}
