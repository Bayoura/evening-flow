import 'package:evening_flow/ui/icons/routine_icons.dart';
import 'package:flutter/material.dart';

class RoutineIconPicker extends StatelessWidget {
  const RoutineIconPicker({super.key});

  @override
  Widget build(BuildContext context) {
    final icons = RoutineIconKey.values;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Icon auswählen",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),

          GridView.builder(
            shrinkWrap: true,
            itemCount: icons.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
            ),
            itemBuilder: (_, index) {
              final icon = icons[index];

              return InkWell(
                onTap: () {
                  Navigator.of(context).pop(icon);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(getRoutineIcon(icon), size: 32),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
