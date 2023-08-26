import 'package:flutter/material.dart';

class PlaygroundNavGlobalKey {
  static PlaygroundNavGlobalKey? _instance;
  final navKey = GlobalKey<NavigatorState>();

  PlaygroundNavGlobalKey._();
  static PlaygroundNavGlobalKey get instance =>
      _instance ??= PlaygroundNavGlobalKey._();
}
