import 'package:flutter/material.dart';
import 'colors.dart';

TextTheme textTheme() {
  return const TextTheme(
    // body text 1
    bodyLarge: TextStyle(
      color: AllAppColors.labelLight,
      fontSize: 16,
      letterSpacing: 0.2,
    ),

    // body text 2
    bodyMedium: TextStyle(
      color: AllAppColors.labelLight,
      fontSize: 14,
      letterSpacing: 0.22
    ),

    // button text 2
    labelLarge: TextStyle(
      color: AllAppColors.labelLight,
      fontWeight: FontWeight.bold,
      fontSize: 14,
      letterSpacing: 0.32
    ),

    // button text 3
    labelMedium: TextStyle(
      color: AllAppColors.labelLight,
      fontWeight: FontWeight.bold,
      fontSize: 12,
      letterSpacing: 0.35
    ),

    // small text s1
    headlineSmall: TextStyle(
      color: AllAppColors.labelLight,
      fontWeight: FontWeight.bold,
      fontSize: 16,
      letterSpacing: 0.2,
    ),

    // caption text c1
    bodySmall: TextStyle(
      color: AllAppColors.labelLight,
      fontSize: 12,
      letterSpacing: 0.3,
    )
  );
}
