import 'package:evening_flow/constants/colors.dart';
import 'package:evening_flow/models/mood/mood.dart';
import 'package:flutter/material.dart';

Color moodColor(Mood mood) {
  switch (mood) {
    case Mood.veryBad:
      return AppColors.moodVeryBad;
    case Mood.bad:
      return AppColors.moodBad;
    case Mood.neutral:
      return AppColors.moodNeutral;
    case Mood.good:
      return AppColors.moodGood;
    case Mood.veryGood:
      return AppColors.moodVeryGood;
  }
}
