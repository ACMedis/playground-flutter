import 'package:flutter_modular/flutter_modular.dart';

import 'package:playground_app/src/features/cities/city_page.dart';
import 'package:playground_app/src/features/cities/city_reducer.dart';
import 'package:playground_app/src/features/cities/repositories/city_repository.dart';
import 'package:playground_app/src/features/cities/repositories/city_repository_impl.dart';
import 'package:playground_app/src/features/cities/services/city_service.dart';
import 'package:playground_app/src/features/cities/services/city_service_impl.dart';

class CityModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory<CityRepository>((i) => CityRepositoryImpl(i())),
        Bind.factory<CityService>((i) => CityServiceImpl(i())),
        Bind.singleton<CityReducer>((i) => CityReducer(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const CityPage()),
      ];
}
