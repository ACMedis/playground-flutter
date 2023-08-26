import 'package:flutter/material.dart';

import 'package:asyncstate/widget/async_state_builder.dart';

import 'package:playground_app/src/core/ui/playground_nav_global_key.dart';
import 'package:playground_app/src/core/ui/playground_theme.dart';
import 'package:playground_app/src/core/ui/widgets/playground_loader.dart';
import 'package:playground_app/src/features/cities/city_page.dart';
import 'package:playground_app/src/features/home/home_page.dart';
import 'package:playground_app/src/features/products/product_page.dart';

class PlaygroundApp extends StatelessWidget {
  const PlaygroundApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AsyncStateBuilder(
      customLoader: const PlaygroundLoader(),
      builder: (asyncNavigatorObserver) {
        return MaterialApp(
          navigatorKey: PlaygroundNavGlobalKey.instance.navKey,
          debugShowCheckedModeBanner: false,
          title: 'Playground',
          theme: PlaygroundTheme.themeData,
          navigatorObservers: [asyncNavigatorObserver],
          routes: {
            '/': (_) => const HomePage(),
            '/city': (_) => const CityPage(),
            '/product': (_) => const ProductPage(),
          },
        );
      },
    );
  }
}
