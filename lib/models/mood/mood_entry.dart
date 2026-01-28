import 'package:evening_flow/models/mood/mood.dart';

class MoodEntry {
  final DateTime date;
  final Mood mood;
  final String routineId;
  final String routineTitle;
  final String? note;

  const MoodEntry({
    required this.date,
    required this.mood,
    required this.routineId,
    required this.routineTitle,
    this.note,
  });
}
