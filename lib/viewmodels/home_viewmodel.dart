import 'package:evening_flow/data/mock/example_routines.dart';
import 'package:evening_flow/models/routine_model.dart';
import 'package:evening_flow/models/step_model.dart';
import 'package:evening_flow/ui/icons/routine_icons.dart';
import 'package:evening_flow/utils/formatters.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  final List<RoutineModel> _routines = exampleEveningRoutines;

  late RoutineModel _selectedRoutine;
  bool _completedToday = false;

  HomeViewModel() {
    _selectedRoutine = _routines.first;
  }

  // getter ---------------------------------

  List<RoutineModel> get routines => _routines;

  RoutineModel get selectedRoutine => _selectedRoutine;

  List<StepModel> get steps => _selectedRoutine.steps;

  RoutineIconKey get iconKey => _selectedRoutine.iconKey;

  bool get completedToday => _completedToday;

  String get startTimeLabel {
    final time = formatStartTime(_selectedRoutine.startTime);
    return "Beginn heute um $time Uhr";
  }

  List<RoutineModel> get sortedRoutines {
    final list = List<RoutineModel>.from(routines);

    list.remove(selectedRoutine);
    list.insert(0, selectedRoutine); // selectedRoutine is always first

    return list;
  }

  // functions ---------------------------------

  void selectRoutine(RoutineModel routine) {
    if (routine.id == _selectedRoutine.id) return;
    _selectedRoutine = routine;
    _completedToday = false;
    notifyListeners();
  }

  void markRoutineCompleted() {
    _completedToday = true;
    notifyListeners();
  }

  void resetForNewDay() {
    _completedToday = false;
    notifyListeners();
  }
}
