import 'package:flutter/material.dart';
import 'package:flutter_form_exercise/theme/colors.dart';
import 'package:flutter_form_exercise/theme/text_theme.dart';

InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
  contentPadding: const EdgeInsets.symmetric(
    horizontal: _inputHorizontalPadding,
    vertical: _inputVerticalPadding
  ),
  hintStyle: textTheme.bodyMedium!.copyWith(color: _hintColor),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(_outlineBorderRadius),
    borderSide: const BorderSide(color: _inputOutlineColor)
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(_outlineBorderRadius),
    borderSide: const BorderSide(color: _errorColor)
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(_outlineBorderRadius),
    borderSide: const BorderSide(color: _errorColor)
  ),
  errorStyle: textTheme.bodySmall!.copyWith(color: _errorColor),
);

const double _outlineBorderRadius = 8;
const double _inputVerticalPadding = 12;
const double _inputHorizontalPadding = 14;
const Color _errorColor = AllAppColors.error;
const Color _inputOutlineColor = AllAppColors.outline;
const Color _hintColor = AllAppColors.labelHint;
