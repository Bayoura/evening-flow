import 'package:evening_flow/constants/colors.dart';
import 'package:evening_flow/models/mood/mood.dart';
import 'package:evening_flow/models/mood/mood_entry.dart';
import 'package:evening_flow/widgets/mood_svg_picture.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MoodListItem extends StatelessWidget {
  final MoodEntry entry;
  const MoodListItem({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(color: theme.colorScheme.onSurfaceVariant),
        const SizedBox(height: 8),
        Row(
          children: [
            MoodSvgPicture(moodIconAssetString: entry.mood.filledAsset),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat(
                    "EEEE, dd.MM.yyyy",
                    "de_DE",
                  ).format(entry.date).toUpperCase(),
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(entry.routineTitle, style: theme.textTheme.titleSmall),
              ],
            ),
          ],
        ),
        const SizedBox(height: 8),
        if (entry.note != null && entry.note!.isNotEmpty)
          Text("„${entry.note!}“", style: theme.textTheme.bodySmall),
      ],
    );
  }
}
