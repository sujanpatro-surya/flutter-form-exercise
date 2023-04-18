import 'package:flutter/material.dart';

TextTheme textTheme() {
  return const TextTheme(
    bodyLarge: TextStyle(       // body text 1
      fontSize: 16,
      letterSpacing: 0.2,
    ),
    bodyMedium: TextStyle(      // body text 2
      fontSize: 14,
      letterSpacing: 0.22
    ),
    labelLarge: TextStyle(      // button text 2
      fontWeight: FontWeight.bold,
      fontSize: 14,
      letterSpacing: 0.32
    ),
    labelMedium: TextStyle(     // button text 3
      fontWeight: FontWeight.bold,
      fontSize: 12,
      letterSpacing: 0.35
    ),
    headlineSmall: TextStyle(   // small text s1
      fontWeight: FontWeight.bold,
      fontSize: 16,
      letterSpacing: 0.2
    )
  );
}
