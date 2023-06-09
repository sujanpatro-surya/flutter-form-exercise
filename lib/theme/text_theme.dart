import 'package:flutter/material.dart';
import 'colors.dart';

// The referenced design (Figma) is based on the Unity Style Typography. But
// the one we are supposed to follow is Material Design Typography. Each [TextStyle]
// defined below corresponds to the matching text style defined in Unity.
final TextTheme textTheme = const TextTheme(
  // Body/B1
  bodyLarge: TextStyle(
    fontSize: 16,
    letterSpacing: 0.2,
    height: 1.75
  ),

  // Body/B2
  bodyMedium: TextStyle(
    fontSize: 14,
    letterSpacing: 0.22,
    height: 1.71
  ),

  // Button/BT2
  labelLarge: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 14,
    letterSpacing: 0.32,
    height: 1.43
  ),

  // Button/BT3
  labelMedium: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 12,
    letterSpacing: 0.35,
    height: 1.33
  ),

  // Small/S1
  headlineSmall: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.2,
    height: 1.75
  ),

  // Caption/C1
  bodySmall: TextStyle(
    fontSize: 12,
    letterSpacing: 0.3,
    height: 1.33
  )
).apply(displayColor: AppColors.label, bodyColor: AppColors.label, fontFamily: 'Inter');
