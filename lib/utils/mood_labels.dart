import 'package:evening_flow/models/mood.dart';

String moodLabel(Mood mood) {
  switch (mood) {
    case Mood.veryGood:
      return "Sehr gut";
    case Mood.good:
      return "Gut";
    case Mood.neutral:
      return "Neutral";
    case Mood.bad:
      return "Schlecht";
    case Mood.veryBad:
      return "Sehr schlecht";
  }
}
