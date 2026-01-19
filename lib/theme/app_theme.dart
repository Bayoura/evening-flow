import 'package:evening_flow/constants/colors.dart';
import 'package:evening_flow/constants/text_styles.dart';
import 'package:evening_flow/theme/app_color_scheme.dart';
import 'package:evening_flow/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData standardTheme = ThemeData(
    fontFamily: "JakartaPlusSans",
    brightness: Brightness.dark,
    useMaterial3: true,
    colorScheme: AppColorScheme.dark,
    textTheme: AppTextTheme.textTheme,

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.surfaceNavigation,
      foregroundColor: AppColors.textPrimary,
      centerTitle: false,
      titleTextStyle: AppTextStyles.h1,
      toolbarHeight: 64,
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.surfaceNavigation,
      selectedItemColor: AppColors.textAccent,
      unselectedItemColor: AppColors.textSecondary,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
    ),
  );
}
