import 'package:evening_flow/data/mock/example_routines.dart';
import 'package:evening_flow/models/routine_model.dart';
import 'package:evening_flow/models/step_model.dart';
import 'package:evening_flow/ui/icons/routine_icons.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  final List<RoutineModel> _routines = exampleEveningRoutines;

  late RoutineModel _selectedRoutine;

  HomeViewModel() {
    _selectedRoutine = _routines.first;
  }
  RoutineModel get selectedRoutine => _selectedRoutine;

  void selectRoutine(RoutineModel routine) {
    _selectedRoutine = routine;
    notifyListeners();
  }

  List<RoutineModel> get routines => _routines;
  List<StepModel> get steps => _selectedRoutine.steps;

  RoutineIconKey get iconKey => _selectedRoutine.iconKey;

  String get startTimeLabel {
    return _formatTime(_selectedRoutine.startTime);
  }

  String _formatTime(Duration sinceMidnight) {
    final hours = sinceMidnight.inHours;
    final minutes = sinceMidnight.inMinutes % 60;

    final hourString = hours.toString().padLeft(2, "0");
    final minuteString = minutes.toString().padLeft(2, "0");

    return "Beginn heute um $hourString:$minuteString Uhr";
  }
}
