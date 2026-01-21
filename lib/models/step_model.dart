enum StepStatus { pending, active, completed, skipped }

class StepModel {
  final String title;
  final String? description;
  final Duration? duration;
  final StepStatus status;

  const StepModel({
    required this.title,
    this.description,
    this.duration,
    this.status = StepStatus.pending,
  });
}
