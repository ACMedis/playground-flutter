import 'package:flutter_modular/flutter_modular.dart';

import 'package:playground_app/src/features/home/home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const HomePage()),
      ];
}
