import 'package:evening_flow/models/routine_model.dart';
import 'package:evening_flow/ui/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class RoutineCategorySection extends StatelessWidget {
  final String title;
  final List<RoutineModel> routines;
  final void Function(RoutineModel) onRoutineTap;

  const RoutineCategorySection({
    super.key,
    required this.title,
    required this.routines,
    required this.onRoutineTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title.toUpperCase(), style: AppTextTheme.textTheme.labelSmall!),
        const SizedBox(height: 8),
        ...routines.map(
          (routine) => Column(
            children: [
              ListTile(
                title: Text(routine.title),
                trailing: const Icon(Icons.chevron_right),
                contentPadding: const EdgeInsets.all(0),
                onTap: () => onRoutineTap(routine),
              ),
              SizedBox(
                height: 4,
                child: Divider(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
