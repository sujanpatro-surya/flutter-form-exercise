import 'package:flutter/material.dart';
import 'package:flutter_form_exercise/theme/colors.dart';
import 'text_theme.dart';

ThemeData themeLight = ThemeData.light().copyWith(
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
  textTheme: textTheme
);
