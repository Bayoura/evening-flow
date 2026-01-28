import 'package:evening_flow/constants/colors.dart';
import 'package:evening_flow/models/mood.dart';
import 'package:evening_flow/views/mood/widgets/calendar.dart';
import 'package:evening_flow/views/mood/widgets/mood_legend.dart';
import 'package:flutter/material.dart';

class MoodCalendarView extends StatelessWidget {
  const MoodCalendarView({super.key});

  final String bestRoutine = "Entspannter Abend";
  final int amountGoodMood = 5;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Calendar(),
        const SizedBox(height: 24.0),
        const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: MoodLegend(mood: Mood.veryGood)),
            Expanded(child: MoodLegend(mood: Mood.good)),
            Expanded(child: MoodLegend(mood: Mood.neutral)),
          ],
        ),
        const SizedBox(height: 16.0),
        const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: MoodLegend(mood: Mood.bad)),
            Expanded(child: MoodLegend(mood: Mood.veryBad)),
          ],
        ),
        const SizedBox(height: 16.0),
        const Divider(color: AppColors.textSecondary),
        const SizedBox(height: 16.0),
        Text(
          "Beste Routine diesen Monat: \"$bestRoutine\" → $amountGoodMood× gute Stimmung",
        ),
      ],
    );
  }
}
