import 'package:flutter/material.dart';
import 'package:learning1/101/column_row.dart';
import 'package:learning1/101/list_tile.dart';
import 'package:learning1/101/stack_learn.dart';
import 'package:learning1/202/custom_widget.dart';
import 'package:learning1/202/indicator.dart';
import 'package:learning1/demo/first_demo_app.dart';
import 'package:learning1/demo/stack_demo.dart';

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
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color:  Colors.green
        ),
        // listTileTheme: ListTileThemeData(contentPadding: EdgeInsets.zero)
      ),
      home: const StackDemo(),
    );
  }
}
