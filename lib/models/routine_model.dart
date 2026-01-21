import 'package:evening_flow/models/step_model.dart';

enum RoutineStatus { active, inactive, completed }

class RoutineModel {
  final String id;
  final String title;
  final Duration startTime; //since midnight
  final List<StepModel> steps;
  final RoutineStatus status;
  final Duration? reminderOffset;

  const RoutineModel({
    required this.id,
    required this.title,
    required this.startTime,
    required this.steps,
    required this.status,
    this.reminderOffset,
  });

RoutineModel copyWith({
  String? title,
  Duration? startTime,
  List<StepModel>? steps,
  RoutineStatus? status,
  Duration? reminderOffset,
}) {
  return RoutineModel(
    id: id,
    title: title ?? this.title,
    startTime: startTime ?? this.startTime,
    steps: steps ?? this.steps,
    status: status ?? this.status,
    reminderOffset: reminderOffset ?? this.reminderOffset,
  );
}

  Duration get totalDuration =>
      steps.fold(Duration.zero, (sum, s) => sum + s.duration);
}
