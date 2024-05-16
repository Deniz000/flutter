import 'package:flutter/material.dart';

class TestlearnView extends StatelessWidget {
  const TestlearnView({super.key});
  final String name = 'Deniz';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(
        ('Hello $name'),
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.right,
        style: Theme.of(context)
            .textTheme
            .headlineLarge
            ?.copyWith(color: ProjectColors.welcomeColor),
      ),

    ));
  }
}

class ProjectStyles {
  static TextStyle welcomeStyle =
      const TextStyle(fontSize: 24, letterSpacing: 4, wordSpacing: 3);
}

class ProjectColors{
    static Color welcomeColor = Colors.black;
}