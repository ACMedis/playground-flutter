import 'package:asp/asp.dart';

import 'package:playground_app/src/models/product_model.dart';

// ATOMS
final productsState = Atom<List<ProductModel>>([]);
final loadingState = Atom(true);
final errorState = Atom<String>('');

// ACTIONS
final fetchProductsAction = Atom.action();
final clearProductsAction = Atom.action();
