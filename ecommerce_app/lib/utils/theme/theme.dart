import 'package:ecommerce_app/utils/theme/costom_themes/appbar_theme.dart';
import 'package:ecommerce_app/utils/theme/costom_themes/bottom_sheet_theme.dart';
import 'package:ecommerce_app/utils/theme/costom_themes/checkbox_theme.dart';
import 'package:ecommerce_app/utils/theme/costom_themes/chip_theme.dart';
import 'package:ecommerce_app/utils/theme/costom_themes/elevated_button_theme.dart';
import 'package:ecommerce_app/utils/theme/costom_themes/form_field_theme.dart';
import 'package:ecommerce_app/utils/theme/costom_themes/outlined_button.dart';
import 'package:ecommerce_app/utils/theme/costom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class TAppTheme {
  TAppTheme._(); // private constructor

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
      textTheme: TTextTheme.lightTextTheme,
      chipTheme: TChipTheme.lightChipTheme,
      appBarTheme: TAppBarTheme.lightAppBArTheme,
      checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
      bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
      elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
      outlinedButtonTheme: TOutlinedButton.lightOutlinedButtonTheme,
      inputDecorationTheme: TFormFieldTheme.lightInputDecorationTheme
      );
   static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.dark,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.black,
      textTheme: TTextTheme.darkTextTheme,
      chipTheme: TChipTheme.darkChipTheme,
      appBarTheme: TAppBarTheme.darkAppBArTheme,
      checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
      bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
      elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
      outlinedButtonTheme: TOutlinedButton.darkOutlinedButtonTheme,
      inputDecorationTheme: TFormFieldTheme.darkInputDecorationTheme
      );
}
