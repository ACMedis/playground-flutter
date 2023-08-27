import 'package:flutter_modular/flutter_modular.dart';
import 'package:playground_app/src/features/cities/city_page.dart';
import 'package:playground_app/src/repositories/city/city_repository.dart';
import 'package:playground_app/src/repositories/city/city_repository_impl.dart';
import 'package:playground_app/src/services/city/city_service.dart';
import 'package:playground_app/src/services/city/city_service_impl.dart';

class CityModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory<CityRepository>((i) => CityRepositoryImpl(i())),
        Bind.factory<CityService>((i) => CityServiceImpl(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const CityPage()),
      ];
}
