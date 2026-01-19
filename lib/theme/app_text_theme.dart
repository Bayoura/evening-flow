import 'package:evening_flow/constants/text_styles.dart';
import 'package:flutter/material.dart';

class AppTextTheme {
  static const TextTheme textTheme = TextTheme(
    displayMedium: AppTextStyles.countdown,
    headlineLarge: AppTextStyles.h1,
    headlineMedium: AppTextStyles.h2,
    headlineSmall: AppTextStyles.h3,
    titleLarge: AppTextStyles.section,
    titleMedium: AppTextStyles.section,
    titleSmall: AppTextStyles.section,
    bodyLarge: AppTextStyles.body,
    bodyMedium: AppTextStyles.body,
    bodySmall: AppTextStyles.bodySmall,
    labelLarge: AppTextStyles.buttonPrimary,
    labelMedium: AppTextStyles.buttonSecondary,
    labelSmall: AppTextStyles.detail,
  );
}
