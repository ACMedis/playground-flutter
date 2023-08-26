import 'package:flutter/material.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:playground_app/src/core/ui/constants.dart';

class PlaygroundLoader extends StatelessWidget {
  const PlaygroundLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.threeArchedCircle(
        color: ColorsConstants.red,
        size: 60,
      ),
    );
  }
}
