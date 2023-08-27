import 'package:flutter/material.dart';

class PlaygroundEmpty extends StatelessWidget {
  final String imagePath;
  final String message;

  const PlaygroundEmpty({
    super.key,
    required this.imagePath,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
            width: 200,
            height: 200,
          ),
          const SizedBox(height: 20),
          Text(message)
        ],
      ),
    );
  }
}
