import 'package:flutter/material.dart';
import 'package:flutter_form_exercise/theme/colors.dart';
import 'text_theme.dart';

ThemeData mainTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  colorSchemeSeed: AllAppColors.primaryLight,
  fontFamily: 'Inter',
  textTheme: textTheme()
);
