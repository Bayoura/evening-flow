import 'package:evening_flow/models/step_model.dart';
import 'package:evening_flow/widgets/steps/step_status_icon.dart';
import 'package:flutter/material.dart';

class StepItem extends StatelessWidget {
  final StepModel stepModel;
  const StepItem({super.key, required this.stepModel});

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes;
    return '(${minutes}m)';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          StepStatusIcon(status: stepModel.status),
          const SizedBox(width: 8),
          Text(stepModel.title),
          const SizedBox(width: 8),
          Text(
            stepModel.status == StepStatus.skipped
                ? "(übersprungen)"
                : stepModel.duration == Duration.zero
                ? ""
                : _formatDuration(stepModel.duration),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
