import 'package:flutter/material.dart';
import 'package:learning1/202/animated_lear.dart';
import 'package:learning1/202/image_learn.dart';
import 'package:learning1/202/theme/lisght_theme.dart';
import 'package:learning1/demo/password_textfield.dart';

void main() { 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: LightTheme().theme,
      // ThemeData.light().copyWith(
      //   bottomAppBarTheme: const BottomAppBarTheme(
      //     shape: CircularNotchedRectangle(),
      //   ),
      //   tabBarTheme: const TabBarTheme(
      //    indicatorColor: Colors.green,
      //    indicatorSize: TabBarIndicatorSize.tab,
      //         labelColor: Colors.green,
      //         unselectedLabelColor: Colors.grey,
      //   ),
      //   appBarTheme:  AppBarTheme(
      //     backgroundColor: Colors.green[200],
      //     elevation: 0,
      //   ),
      //   cardTheme: CardTheme(
      //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
      //   ),
      //   progressIndicatorTheme: const ProgressIndicatorThemeData(
      //     color:  Colors.green
      //   ),
      //   inputDecorationTheme: InputDecorationTheme(
      //     filled: true,
      //      fillColor: Colors.green[100],
      //      prefixIconColor: Colors.green[800],
      //      border: const OutlineInputBorder(),

      //   )
      //   // listTileTheme: ListTileThemeData(contentPadding: EdgeInsets.zero)
      // ),
      home: const AnimatedLearn(),
    );
  }
}
