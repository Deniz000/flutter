import 'package:demo_pages/splash_screens/splash_screen.dart';
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
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Color.fromARGB(200, 231, 231, 231),
          elevation: 0,
        ),
        scaffoldBackgroundColor: Color.fromARGB(255, 231, 224, 251),

      ),
      home: const SplashScreen(),
    );
  }
}
