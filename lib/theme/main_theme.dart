import 'package:flutter/material.dart';
import 'app_bar_theme.dart';
import 'checkbox_theme.dart';
import 'colors.dart';
import 'radio_button_theme.dart';
import 'input_decoration_theme.dart';
import 'text_theme.dart';

ThemeData mainTheme = ThemeData(
  fontFamily: 'Inter',
  textTheme: textTheme,
  appBarTheme: appBarTheme,
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  colorSchemeSeed: AllAppColors.primary,
  inputDecorationTheme: inputDecorationTheme,
  hintColor: AllAppColors.hint,
  radioTheme: radioTheme,
  checkboxTheme: checkBoxThemeData,
);
