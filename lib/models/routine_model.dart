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

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'startTime': startTime.inMinutes,
      'steps': steps.map((s) => s.toMap()).toList(),
      'iconKey': iconKey.name,
      'reminderOffset': reminderOffset?.inMinutes,
    };
  }

  factory RoutineModel.fromMap(Map<String, dynamic> map, String id) {
    return RoutineModel(
      id: id,
      title: map['title'],
      startTime: Duration(minutes: map['startTime']),
      steps: List<StepModel>.from(
        map['steps']?.map(
          (s) => StepModel(
            title: s['title'],
            description: s['description'],
            duration: Duration(minutes: s['duration']),
            status: StepStatus.values.firstWhere((e) => e.name == s['status']),
          ),
        ),
      ),
      iconKey: RoutineIconKey.values.firstWhere(
        (e) => e.name == map['iconKey'],
      ),
      reminderOffset: map['reminderOffset'] != null
          ? Duration(minutes: map['reminderOffset'])
          : null,
    );
  }

  Duration get totalDuration =>
      steps.fold(Duration.zero, (sum, s) => sum + s.duration);
}
