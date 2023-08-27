import 'package:flutter_modular/flutter_modular.dart';

import 'package:playground_app/src/features/products/product_page.dart';
import 'package:playground_app/src/features/products/product_reducer.dart';
import 'package:playground_app/src/features/products/repositories/product_repository.dart';
import 'package:playground_app/src/features/products/repositories/product_repository_impl.dart';
import 'package:playground_app/src/features/products/services/product_service.dart';
import 'package:playground_app/src/features/products/services/product_service_impl.dart';

class ProductModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory<ProductRepository>((i) => ProductRepositoryImpl(i())),
        Bind.factory<ProductService>((i) => ProductServiceImpl(i())),
        Bind.singleton<ProductReducer>((i) => ProductReducer(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const ProductPage()),
      ];
}
