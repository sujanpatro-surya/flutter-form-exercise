import 'package:flutter/material.dart';
import 'package:flutter_form_exercise/theme/colors.dart';
import 'text_theme.dart';
import 'app_bar_theme.dart';

ThemeData mainTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  colorSchemeSeed: AllAppColors.primaryLight,
  fontFamily: 'Inter',
  appBarTheme: appBarTheme,
  textTheme: textTheme()
);
