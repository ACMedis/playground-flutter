import 'package:flutter_modular/flutter_modular.dart';

import 'package:playground_app/src/features/customers/customer_add/customer_add_page.dart';
import 'package:playground_app/src/features/customers/customer_add/customer_add_store.dart';
import 'package:playground_app/src/repositories/customer/customer_repository.dart';
import 'package:playground_app/src/repositories/customer/customer_repository_impl.dart';
import 'package:playground_app/src/services/customer/customer_service.dart';
import 'package:playground_app/src/services/customer/customer_service_impl.dart';

class CustomerModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory<CustomerRepository>((i) => CustomerRepositoryImpl(i())),
        Bind.factory<CustomerService>((i) => CustomerServiceImpl(i())),
        Bind.singleton<CustomerAddStore>((i) => CustomerAddStore(i())),
      ];

  @override
  List<ModularRoute> get routes =>
      [ChildRoute('/add', child: (_, __) => const CustomerAddPage())];
}
