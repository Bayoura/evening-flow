import 'package:evening_flow/constants/colors.dart';
import 'package:flutter/material.dart';

class AppColorScheme {
  static const ColorScheme dark = ColorScheme(
    brightness: Brightness.dark,

    primary: AppColors.actionPrimary,
    onPrimary: AppColors.textOnAccent,

    secondary: AppColors.actionSecondary,
    onSecondary: AppColors.textPrimary,

    error: AppColors.textError,
    onError: AppColors.textOnAccent,

    surface: AppColors.surfaceBackground,
    onSurface: AppColors.textPrimary,
    onSurfaceVariant: AppColors.textSecondary,

    outline: AppColors.surfaceSecondary,
  );
}
