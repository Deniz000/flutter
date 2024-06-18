import 'package:flutter/material.dart';

class TOutlinedButton {
  TOutlinedButton._();

    static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.black,
      side: const BorderSide(color: Colors.blue),
      padding:const  EdgeInsets.symmetric(vertical: 18, horizontal: 20),
      textStyle: const TextStyle(color: Colors.white,
      fontWeight: FontWeight.w600,
      fontSize: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),)
    );
       static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      side: const BorderSide(color: Colors.blueAccent),
      padding:const  EdgeInsets.symmetric(vertical: 18, horizontal: 20),
      textStyle: const TextStyle(color: Colors.white,
      fontWeight: FontWeight.w600,
      fontSize: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),)
    );
}
