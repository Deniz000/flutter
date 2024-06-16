import 'package:flutter/material.dart';

class AnimatedLearnHero extends StatelessWidget {
  const AnimatedLearnHero({super.key, required this.heroTag, required this.imagePath});
  final String heroTag;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Hero(
          tag: heroTag,
          child: Image.asset(imagePath),
        ),
      ),
    );
  }
}
