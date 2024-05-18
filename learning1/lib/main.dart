import 'package:flutter/material.dart';
import 'package:learning1/demo/color_demos.dart';
import 'package:learning1/demo/colors_life_cycle.dart';

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
        ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color:  Colors.green
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
           fillColor: Colors.green[100],
           prefixIconColor: Colors.green[800],
           border: const OutlineInputBorder(),

        )
        // listTileTheme: ListTileThemeData(contentPadding: EdgeInsets.zero)
      ),
      home: const ColorLifeCycleView(),
    );
  }
}
