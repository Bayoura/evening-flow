import 'package:evening_flow/models/mood/mood.dart';
import 'package:evening_flow/models/mood/mood_entry.dart';

final List<MoodEntry> allEntries = [
  MoodEntry(
    date: DateTime(2026, 6, 12),
    mood: Mood.veryGood,
    routineId: "1",
    routineTitle: "Routinen Titel",
    note: "",
  ),
  MoodEntry(
    date: DateTime(2026, 6, 4),
    mood: Mood.good,
    routineId: "1",
    routineTitle: "Routinen Titel",
  ),
  MoodEntry(
    date: DateTime(2026, 6, 3),
    mood: Mood.veryBad,
    routineId: "2",
    routineTitle: "Routinen Titel",
    note: "",
  ),
  MoodEntry(
    date: DateTime(2026, 6, 10),
    mood: Mood.bad,
    routineId: "3",
    routineTitle: "Routinen Titel",
    note:
        "Heute war voll gut und ich war richtig entspannt hehe blalbalb blllalaal bla lbala? albala bla",
  ),
  MoodEntry(
    date: DateTime(2026, 5, 28),
    mood: Mood.veryGood,
    routineId: "2",
    routineTitle: "Routinen Titel",
    note:
        "Heute war voll gut und ich war richtig entspannt hehe blalbalb blllalaal bla lbala? albala bla",
  ),
  MoodEntry(
    date: DateTime(2026, 5, 29),
    mood: Mood.veryBad,
    routineId: "1",
    routineTitle: "Routinen Titel",
    note:
        "Heute war voll gut und ich war richtig entspannt hehe blalbalb blllalaal bla lbala? albala bla",
  ),
  MoodEntry(
    date: DateTime(2026, 5, 17),
    mood: Mood.good,
    routineId: "2",
    routineTitle: "Routinen Titel",
    note:
        "Heute war voll gut und ich war richtig entspannt hehe blalbalb blllalaal bla lbala? albala bla",
  ),
  MoodEntry(
    date: DateTime(2026, 5, 16),
    mood: Mood.bad,
    routineId: "3",
    routineTitle: "Routinen Titel",
    note:
        "Heute war voll gut und ich war richtig entspannt hehe blalbalb blllalaal bla lbala? albala bla",
  ),
  MoodEntry(
    date: DateTime(2026, 6, 13),
    mood: Mood.veryGood,
    routineId: "4",
    routineTitle: "Routinen Titel",
    note: "Heute war voll gut",
  ),
];
