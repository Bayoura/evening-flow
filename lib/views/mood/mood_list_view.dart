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
    final entries = moodViewModel.entriesForCurrentMonth;

    return Column(
      children: [
        MonthHeader(
          focusedMonth: moodViewModel.currentVisibleMonth,
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
