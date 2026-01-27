import 'package:evening_flow/constants/colors.dart';
import 'package:evening_flow/models/mood.dart';
import 'package:evening_flow/ui/theme/mood_colors.dart';
import 'package:evening_flow/utils/mood_labels.dart';
import 'package:flutter/material.dart';

class MoodLegend extends StatelessWidget {
  final Mood mood;
  const MoodLegend({super.key, required this.mood});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: moodColor(mood),
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          moodLabel(mood).toUpperCase(),
          style: Theme.of(
            context,
          ).textTheme.labelSmall?.copyWith(color: AppColors.textSecondary),
        ),
      ],
    );
  }
}
