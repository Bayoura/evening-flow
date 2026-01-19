import 'dart:ui';

class RawColors {
  static const Color deepPurple = Color(0xFF322747);
  static const Color darkLavender = Color(0xFF443359);
  static const Color mediumPurple = Color(0xFF6A587F);
  static const Color lightLilac = Color(0xFFF5F4F8);
  static const Color lavenderGrey = Color(0xFFCFCBDD);
  static const Color deepIndigo = Color(0xFF3B314E);
  static const Color softApricot = Color(0xFFFFD796);
  static const Color mutedGreen = Color(0xFF9FB8A7);
  static const Color mutedLavender = Color(0xFFB3AEC7);
  static const Color mediumRed = Color(0xFFFF7171);
}

class AppColors {
  //Surfaces
  static const Color surfaceBackground = RawColors.deepPurple;
  static const Color surfaceNavigation = RawColors.darkLavender;
  static const Color surfaceSecondary = RawColors.mediumPurple;

  //Actions
  static const Color actionPrimary = RawColors.softApricot;
  static const Color actionSecondary = RawColors.mediumPurple;

  //Text
  static const Color textPrimary = RawColors.lightLilac;
  static const Color textSecondary = RawColors.lavenderGrey;
  static const Color textOnAccent = RawColors.deepIndigo;
  static const Color textAccent = RawColors.softApricot;
  static const Color textError = RawColors.mediumRed;

  //Status
  static const Color statusCompleted = RawColors.mutedGreen;
  static const Color statusSkipped = RawColors.mutedLavender;
}
