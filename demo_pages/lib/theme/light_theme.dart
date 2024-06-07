import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LightTheme {
  final _lightColors = _LightThemeColor();

  late final ThemeData theme;

  LightTheme() {
    theme = ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 1,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        iconTheme: IconThemeData(color: _lightColors.foodAppUnselectedItem, size: 34),
        titleTextStyle: TextStyle(color: _lightColors.foodAppSecondary, fontSize: 25,)
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 1,
        selectedLabelStyle: TextStyle(color: _lightColors.foodAppSecondary),
        selectedIconTheme: bottomItemTheme(_lightColors.foodAppSecondary,),
        unselectedIconTheme: bottomItemTheme(_lightColors.foodAppUnselectedItem)
      )
      );
  }

  IconThemeData bottomItemTheme(Color color) {
    return IconThemeData(
        color: color,
        size: 32,
        shadows: const [Shadow(color: Colors.grey, offset: Offset(1, 2), blurRadius: 5)]
      );
  }
}

class _LightThemeColor {
  Color foodAppSecondary = const Color.fromARGB(255, 41, 110, 75);
  Color foodAppUnselectedItem = Color.fromARGB(255, 171, 173, 172);
}
