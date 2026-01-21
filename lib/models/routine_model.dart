import 'package:evening_flow/models/step_model.dart';
import 'package:flutter/material.dart';

enum RoutineStatus { active, inactive }

class RoutineModel {
  final String title;
  final TimeOfDay startTime;
  final List<StepModel> steps;
  final RoutineStatus status;
  final Duration? duration;
  final bool reminder;
  final Duration? reminderTime;

  const RoutineModel({
    required this.title,
    required this.startTime,
    required this.steps,
    this.status = RoutineStatus.inactive,
    this.duration,
    required this.reminder,
    this.reminderTime,
  });
}
