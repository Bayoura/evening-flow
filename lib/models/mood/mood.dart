import 'package:evening_flow/constants/app_assets.dart';

enum Mood { veryBad, bad, neutral, good, veryGood }

extension MoodAsset on Mood {
  String get filledAsset {
    switch (this) {
      case Mood.veryBad:
        return AppAssets.moodVeryBadFilled;
      case Mood.bad:
        return AppAssets.moodBadFilled;
      case Mood.neutral:
        return AppAssets.moodNeutralFilled;
      case Mood.good:
        return AppAssets.moodGoodFilled;
      case Mood.veryGood:
        return AppAssets.moodVeryGoodFilled;
    }
  }

  String get outlinedAsset {
    switch (this) {
      case Mood.veryBad:
        return AppAssets.moodVeryBadOutlined;
      case Mood.bad:
        return AppAssets.moodBadOutlined;
      case Mood.neutral:
        return AppAssets.moodNeutralOutlined;
      case Mood.good:
        return AppAssets.moodGoodOutlined;
      case Mood.veryGood:
        return AppAssets.moodVeryGoodOutlined;
    }
  }
}
