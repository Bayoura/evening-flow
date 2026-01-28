import 'package:evening_flow/models/mood_view_mode.dart';
import 'package:evening_flow/viewmodels/mood_view_model.dart';
import 'package:evening_flow/views/mood/mood_calendar_view.dart';
import 'package:evening_flow/views/mood/mood_list_view.dart';
import 'package:evening_flow/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MoodViewContent extends StatelessWidget {
  const MoodViewContent({super.key});

  @override
  Widget build(BuildContext context) {
    final moodViewModel = context.watch<MoodViewModel>();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Align(
            alignment: AlignmentGeometry.topRight,
            child: UtilityButton(
              text: moodViewModel.utilityButtonLabel,
              onPressed: () {
                moodViewModel.toggleView();
              },
            ),
          ),
          const SizedBox(height: 16),

          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: moodViewModel.currentViewMode == MoodViewMode.calendar
                  ? const MoodCalendarView()
                  : const MoodListView(),
            ),
          ),
        ],
      ),
    );
  }
}
