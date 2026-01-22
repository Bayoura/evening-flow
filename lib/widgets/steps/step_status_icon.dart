import 'package:evening_flow/constants/colors.dart';
import 'package:evening_flow/models/step_model.dart';
import 'package:flutter/material.dart';

class StepStatusIcon extends StatelessWidget {
  final StepStatus status;
  const StepStatusIcon({super.key, required this.status});

  Widget _getStatusIcon(StepStatus status) {
    switch (status) {
      case StepStatus.pending:
        return const SizedBox(
          width: 24,
          height: 24,
          child: Icon(
            Icons.circle_outlined,
            color: AppColors.textPrimary,
            size: 10,
          ),
        );

      case StepStatus.active:
        return const SizedBox(
          width: 24,
          height: 24,
          child: Icon(
            Icons.circle,
            color: AppColors.textAccent,
            size: 10,
          ),
        );
      case StepStatus.completed:
        return const SizedBox(
          width: 24,
          height: 24,
          child: Icon(Icons.check, color: AppColors.statusCompleted, size: 20),
        );

      case StepStatus.skipped:
        return const SizedBox(
          width: 24,
          height: 24,
          child: Icon(
            Icons.turn_right,
            color: AppColors.statusSkipped,
            size: 20,
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: _getStatusIcon(status),
    );
  }
}
