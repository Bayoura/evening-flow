import 'package:evening_flow/models/step_model.dart';
import 'package:evening_flow/ui/icons/routine_icons.dart';

enum RoutineStatus { active, inactive, completed }

class RoutineModel {
  final String id;
  final String title;
  final Duration startTime; //since midnight
  final List<StepModel> steps;
  final RoutineStatus status;
  final RoutineIconKey iconKey;
  final Duration? reminderOffset;

  const RoutineModel({
    required this.id,
    required this.title,
    required this.startTime,
    required this.steps,
    required this.status,
    required this.iconKey,
    this.reminderOffset,
  });

  RoutineModel copyWith({
    String? title,
    Duration? startTime,
    List<StepModel>? steps,
    RoutineStatus? status,
    RoutineIconKey? iconKey,
    Duration? reminderOffset,
  }) {
    return RoutineModel(
      id: id,
      title: title ?? this.title,
      startTime: startTime ?? this.startTime,
      steps: steps ?? this.steps,
      status: status ?? this.status,
      iconKey: iconKey ?? this.iconKey,
      reminderOffset: reminderOffset ?? this.reminderOffset,
    );
  }

  Duration get totalDuration =>
      steps.fold(Duration.zero, (sum, s) => sum + s.duration);
}
