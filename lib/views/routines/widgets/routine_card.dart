import 'package:evening_flow/models/routine_model.dart';
import 'package:evening_flow/ui/icons/routine_icons.dart';
import 'package:evening_flow/utils/formatters.dart';
import 'package:flutter/material.dart';

class RoutineCard extends StatelessWidget {
  final RoutineModel routine;
  final bool isSelected;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const RoutineCard({
    super.key,
    required this.routine,
    required this.isSelected,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return IntrinsicHeight(
      child: Row(
        children: [
          if (isSelected)
            Container(
              width: 8,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
              ),
            ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: theme.colorScheme.outline, width: 2),
                  right: BorderSide(color: theme.colorScheme.outline, width: 2),
                  bottom: BorderSide(
                    color: theme.colorScheme.outline,
                    width: 2,
                  ),
                  left: isSelected
                      ? BorderSide.none
                      : BorderSide(color: theme.colorScheme.outline, width: 2),
                ),
                borderRadius: isSelected
                    ? const BorderRadius.only(
                        topRight: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      )
                    : const BorderRadius.all(Radius.circular(8)),
              ),
              child: Padding(
                padding: isSelected
                    ? const EdgeInsetsGeometry.fromLTRB(8, 8, 16, 8)
                    : const EdgeInsetsGeometry.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _HeaderRow(
                      routine: routine,
                      onEdit: onEdit,
                      onDelete: onDelete,
                    ),
                    _MetaRow(routine: routine),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderRow extends StatelessWidget {
  final RoutineModel routine;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _HeaderRow({
    required this.routine,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Icon(getRoutineIcon(routine.iconKey), size: 24),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            routine.title,
            style: theme.textTheme.headlineSmall,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        IconButton(icon: const Icon(Icons.edit_outlined), onPressed: onEdit),
        IconButton(icon: const Icon(Icons.delete_outline), onPressed: onDelete),
      ],
    );
  }
}

class _MetaRow extends StatelessWidget {
  final RoutineModel routine;

  const _MetaRow({required this.routine});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _MetaText("${routine.steps.length} Schritte"),
        _Bullet(),
        _MetaText(formatDuration(routine.totalDuration)),
        _Bullet(),
        _MetaText("Start ${formatStartTime(routine.startTime)}"),
      ],
    );
  }
}

class _MetaText extends StatelessWidget {
  final String text;
  const _MetaText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
    );
  }
}

class _Bullet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Text("•"),
    );
  }
}
