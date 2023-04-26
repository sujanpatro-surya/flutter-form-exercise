import 'package:flutter/material.dart';

/// The names of the colors defined in [AppColors] are not as per the referenced source (Figma design)
/// The corresponding color shade for each defined color has been documented.
class AppColors {
  const AppColors._();

  /// Label/Light/300
  static const Color label = Color(0xFF36383A);

  /// Label/Light/200
  static const Color hint = Color(0xFF8A8A8E);

  /// Primary/Light/300
  static const Color primary = Color(0xFF6A39F1);

  /// Outline/Light/300
  static const Color outline = Color(0xFFD1D1D6);

  /// Outline/Light/200
  static const Color divider = Color(0xFFE5E5EA);

  /// Error/Light/300
  static const Color error = Color(0xFFFF3B30);

  /// Background/Light/100
  static const Color disabled = Color(0xFFEEEEF3);
}
