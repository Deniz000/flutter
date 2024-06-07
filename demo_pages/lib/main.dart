import 'package:demo_pages/lottie/learn_lottie.dart';
import 'package:demo_pages/recipe-app/recipe_screen.dart';
import 'package:demo_pages/theme/light_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: LightTheme().theme,
      // ThemeData(
      //   appBarTheme: const AppBarTheme(
      //     color: Colors.white,
      //     elevation: 0,
      //   ),
      //   scaffoldBackgroundColor: Colors.white,
      // ),
      home: const LottieLearn(),
    );
  }

}

