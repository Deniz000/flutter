import 'package:flutter/material.dart';
import 'package:learning1/demo/first_demo_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
        appBarTheme:  AppBarTheme(
          backgroundColor: Colors.green[200],
          elevation: 0,
        ),
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
        )
      ),
      home: const FirstDemoApp(),
    );
  }
}
