enum StepStatus { pending, active, completed, skipped }

class StepModel {
  final String title;
  final String? description;
  final Duration duration; //set to Duration.zero if no duration was given
  final StepStatus status;

  const StepModel({
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
      title: title ?? this.title,
      description: description ?? this.description,
      duration: duration ?? this.duration,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'duration': duration.inMinutes,
      'status': status.name,
    };
  }
}
