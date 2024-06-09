import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LightTheme {
  final _lightColors = LightThemeColor();

  late final ThemeData theme;

  LightTheme() {
    theme = ThemeData(
        appBarTheme: AppBarTheme(
            backgroundColor: LightThemeColor.foodAppYellow,
            elevation: 1,
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            iconTheme: bottomItemTheme(_lightColors.foodAppDarkBlue),
            titleTextStyle: TextStyle(
              color: _lightColors.foodAppDarkBlue,
              fontSize: 25,
            )),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
            elevation: 1,
            selectedItemColor: _lightColors.foodAppDarkBlue,
            showUnselectedLabels: true,
            unselectedItemColor: _lightColors.foodAppUnselectedItem,
            selectedIconTheme: bottomItemTheme(
              _lightColors.foodAppDarkBlue,
            ),
            unselectedIconTheme:
                bottomItemTheme(_lightColors.foodAppUnselectedItem)),
                
                );
  }

  IconThemeData bottomItemTheme(Color color) {
    return IconThemeData(
      color: color, 
      size: 32, shadows: const [
      Shadow(color: Colors.black54, offset: Offset(1, 1), blurRadius: 5)
    ]);
  }
}

class LightThemeColor {
  Color foodAppSecondary = const Color.fromARGB(255, 41, 110, 75);
  Color foodAppBlue = const Color.fromARGB(255, 153,204,255);
  static Color foodAppYellow = const Color.fromARGB(255, 255,217,102);
  Color foodAppDarkBlue = const Color.fromARGB(255, 43,44,65);
  Color foodAppUnselectedItem = const Color.fromARGB(255, 171, 173, 172);
}
