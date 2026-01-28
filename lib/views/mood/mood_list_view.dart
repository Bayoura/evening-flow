import 'package:evening_flow/models/mood/mood.dart';
import 'package:evening_flow/models/mood/mood_entry.dart';
import 'package:evening_flow/viewmodels/mood_view_model.dart';
import 'package:evening_flow/views/mood/widgets/month_header.dart';
import 'package:evening_flow/views/mood/widgets/mood_list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MoodListView extends StatelessWidget {
  const MoodListView({super.key});

  @override
  Widget build(BuildContext context) {
    final moodViewModel = context.watch<MoodViewModel>();
    List<MoodEntry> entries = [
      MoodEntry(
        date: DateTime(2026, 1, 25),
        mood: Mood.veryGood,
        routineId: "routineId",
        routineTitle: "Routinen Titel",
        note: "",
      ),
      MoodEntry(
        date: DateTime(2026, 1, 26),
        mood: Mood.good,
        routineId: "routineId",
        routineTitle: "Routinen Titel",
      ),
      MoodEntry(
        date: DateTime(2026, 1, 26),
        mood: Mood.veryBad,
        routineId: "routineId",
        routineTitle: "Routinen Titel",
        note: "",
      ),
      MoodEntry(
        date: DateTime(2026, 1, 26),
        mood: Mood.bad,
        routineId: "routineId",
        routineTitle: "Routinen Titel",
        note:
            "Heute war voll gut und ich war richtig entspannt hehe blalbalb blllalaal bla lbala? albala bla",
      ),
      MoodEntry(
        date: DateTime(2026, 1, 26),
        mood: Mood.veryGood,
        routineId: "routineId",
        routineTitle: "Routinen Titel",
        note:
            "Heute war voll gut und ich war richtig entspannt hehe blalbalb blllalaal bla lbala? albala bla",
      ),
      MoodEntry(
        date: DateTime(2026, 1, 26),
        mood: Mood.veryBad,
        routineId: "routineId",
        routineTitle: "Routinen Titel",
        note:
            "Heute war voll gut und ich war richtig entspannt hehe blalbalb blllalaal bla lbala? albala bla",
      ),
      MoodEntry(
        date: DateTime(2026, 1, 26),
        mood: Mood.good,
        routineId: "routineId",
        routineTitle: "Routinen Titel",
        note:
            "Heute war voll gut und ich war richtig entspannt hehe blalbalb blllalaal bla lbala? albala bla",
      ),
      MoodEntry(
        date: DateTime(2026, 1, 26),
        mood: Mood.bad,
        routineId: "routineId",
        routineTitle: "Routinen Titel",
        note:
            "Heute war voll gut und ich war richtig entspannt hehe blalbalb blllalaal bla lbala? albala bla",
      ),
      MoodEntry(
        date: DateTime(2026, 1, 27),
        mood: Mood.veryGood,
        routineId: "routineId",
        routineTitle: "Routinen Titel",
        note: "Heute war voll gut",
      ),
    ];

    return Column(
      children: [
        MonthHeader(
          focusedMonth: moodViewModel.currentMonthAnchor,
          onPrevious: moodViewModel.goToPreviousMonth,
          onNext: moodViewModel.goToNextMonth,
        ),
        Expanded(
          child: entries.isEmpty
              ? const Center(child: Text("Keine Einträge"))
              : ListView.separated(
                  itemCount: entries.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 8),
                  itemBuilder: (context, index) {
                    return MoodListItem(entry: entries[index]);
                  },
                ),
        ),
      ],
    );
  }
}
