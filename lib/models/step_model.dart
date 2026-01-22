enum StepStatus { pending, active, completed, skipped }

class StepModel {
  final String id;
  final String title;
  final String? description;
  final Duration duration; //set to Duration.zero if no duration was given
  final StepStatus status;

  const StepModel({
    required this.id,
    required this.title,
    this.description,
    required this.duration,
    required this.status,
  });

  StepModel copyWith({
    String? title,
    String? description,
    Duration? duration,
    StepStatus? status,
  }) {
    return StepModel(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      duration: duration ?? this.duration,
      status: status ?? this.status,
    );
  }
}
