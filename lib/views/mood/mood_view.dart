import 'package:evening_flow/constants/colors.dart';
import 'package:evening_flow/models/mood.dart';
import 'package:evening_flow/views/mood/widgets/calendar.dart';
import 'package:evening_flow/views/mood/widgets/mood_legend.dart';
import 'package:evening_flow/widgets/buttons.dart';
import 'package:flutter/material.dart';

class MoodView extends StatefulWidget {
  const MoodView({super.key});

  @override
  State<MoodView> createState() => _MoodViewState();
}

class _MoodViewState extends State<MoodView> {
  String bestRoutine = "Entspannter Abend";
  int amountGoodMood = 5;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Align(
            alignment: AlignmentGeometry.topRight,
            child: UtilityButton(text: "Listenansicht", onPressed: () {}),
          ),
          const SizedBox(height: 16.0),
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
      ),
    );
  }
}
