import 'package:playground_app/src/models/product_model.dart';

class ProductState {
  final List<ProductModel> products;
  final bool isLoading;
  final String errorMessage;

  ProductState(
      {required this.products,
      required this.isLoading,
      required this.errorMessage});

  factory ProductState.initial() => ProductState(
        products: [],
        isLoading: false,
        errorMessage: '',
      );

  ProductState copyWith(
      {List<ProductModel>? products, bool? isLoading, String? errorMessage}) {
    return ProductState(
        products: products ?? this.products,
        isLoading: isLoading ?? this.isLoading,
        errorMessage: errorMessage ?? this.errorMessage);
  }
}
