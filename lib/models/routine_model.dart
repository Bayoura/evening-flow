import 'package:evening_flow/models/step_model.dart';
import 'package:evening_flow/ui/icons/routine_icons.dart';

class RoutineModel {
  final String id;
  final String title;
  final Duration startTime; //since midnight
  final List<StepModel> steps;
  final RoutineIconKey iconKey;
  final Duration? reminderOffset;

  const RoutineModel({
    required this.id,
    required this.title,
    required this.startTime,
    required this.steps,
    required this.iconKey,
    this.reminderOffset,
  });

  RoutineModel copyWith({
    String? title,
    Duration? startTime,
    List<StepModel>? steps,
    RoutineIconKey? iconKey,
    Duration? reminderOffset,
  }) {
    return RoutineModel(
      id: id,
      title: title ?? this.title,
      startTime: startTime ?? this.startTime,
      steps: steps ?? this.steps,
      iconKey: iconKey ?? this.iconKey,
      reminderOffset: reminderOffset ?? this.reminderOffset,
    );
  }

  Duration get totalDuration =>
      steps.fold(Duration.zero, (sum, s) => sum + s.duration);
}
