import 'package:flutter/material.dart';
import 'app_bar_theme.dart';
import 'checkbox_theme.dart';
import 'colors.dart';
import 'radio_button_theme.dart';
import 'input_decoration_theme.dart';
import 'text_theme.dart';

ThemeData themeLight = ThemeData.light().copyWith(
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
  textTheme: textTheme,
  appBarTheme: appBarTheme,
  inputDecorationTheme: inputDecorationTheme,
  hintColor: AppColors.hint,
  radioTheme: radioTheme,
  checkboxTheme: checkBoxThemeData,
);
