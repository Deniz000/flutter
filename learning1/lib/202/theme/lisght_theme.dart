import 'package:flutter/material.dart';


//  HER ŞEYİN TEMASINI DEĞİŞTİRMELİ, CUSTOM ETMELİSİN 
class LightTheme {
  final _lightColor = _LightColor();

  late final ThemeData theme;

  LightTheme() {
    theme = ThemeData(
      scaffoldBackgroundColor: Colors.green[50],
        appBarTheme: AppBarTheme(
          color: Colors.green[200],
          elevation: 3,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(40))
        ),),
        colorScheme: ColorScheme.light(
          onPrimary: _lightColor._tropicalFreeze,
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
            headlineLarge: TextStyle(color: _lightColor._jewel, fontSize: 20)));
  }
}

//bunu proje içerisinde çağırmamam laızm, hep buradan erişeceğim
class _LightColor {
  //isimleri color generater namer dan aldım googlela
  final Color _jewel = const Color.fromARGB(255, 26, 111, 70);
  final Color _tropicalFreeze = const Color.fromARGB(255, 245, 1, 1);
}
