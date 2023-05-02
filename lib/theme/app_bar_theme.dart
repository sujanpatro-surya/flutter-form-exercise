import 'package:flutter/material.dart';
import 'package:flutter_form_exercise/theme/text_theme.dart';

import 'colors.dart';

AppBarTheme appBarTheme = AppBarTheme(
  backgroundColor: Colors.white,
  elevation: 0,
  titleTextStyle: textTheme.headlineSmall!.copyWith(color: AppColors.primary)
);
