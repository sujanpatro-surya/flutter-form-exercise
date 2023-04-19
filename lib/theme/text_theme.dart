import 'package:flutter/material.dart';
import 'colors.dart';

/// The referenced design (Figma) is based on the Unity Style Typography. But
/// the one we are supposed to follow is Material Design Typography. Each [TextStyle]
/// defined below corresponds to the matching text style defined in Unity.
const TextTheme textTheme = TextTheme(
  /// Body/B1
  bodyLarge: TextStyle(
    color: AllAppColors.labelText,
    fontSize: 16,
    letterSpacing: 0.2,
  ),

  /// Body/B2
  bodyMedium: TextStyle(
    color: AllAppColors.labelText,
    fontSize: 14,
    letterSpacing: 0.22
  ),

  /// Button/BT2
  labelLarge: TextStyle(
    color: AllAppColors.labelText,
    fontWeight: FontWeight.bold,
    fontSize: 14,
    letterSpacing: 0.32
  ),

  /// Button/BT3
  labelMedium: TextStyle(
    color: AllAppColors.labelText,
    fontWeight: FontWeight.bold,
    fontSize: 12,
    letterSpacing: 0.35
  ),

  /// Small/S1
  headlineSmall: TextStyle(
    color: AllAppColors.labelText,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.2,
  ),

  /// Caption/C1
  bodySmall: TextStyle(
    color: AllAppColors.labelText,
    fontSize: 12,
    letterSpacing: 0.3,
  )
);
