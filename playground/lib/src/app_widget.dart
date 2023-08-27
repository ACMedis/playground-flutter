import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'package:playground_app/src/core/ui/playground_theme.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/home/');

    return MaterialApp.router(
      title: 'Playground',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: PlaygroundTheme.themeData,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
