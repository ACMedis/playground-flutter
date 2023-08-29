import 'package:flutter_modular/flutter_modular.dart';

import 'package:playground_app/src/core/restClient/rest_client.dart';
import 'package:playground_app/src/database/db.dart';
import 'package:playground_app/src/features/cities/city_module.dart';
import 'package:playground_app/src/features/customers/customer_module.dart';
import 'package:playground_app/src/features/home/home_module.dart';
import 'package:playground_app/src/features/products/product_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [];

  @override
  List<Bind<Object>> get binds => [
        // AsyncBind<SharedPreferences>((i) => SharedPreferences.getInstance()),
        Bind.singleton<DB>((i) => DB()),
        Bind.factory<RestClient>((i) => RestClient()),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/home', module: HomeModule()),
        ModuleRoute('/product', module: ProductModule()),
        ModuleRoute('/city', module: CityModule()),
        ModuleRoute('/customer', module: CustomerModule()),
      ];
}
