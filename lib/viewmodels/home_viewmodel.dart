import 'package:evening_flow/data/repositories/routine_repository.dart';
import 'package:evening_flow/models/routine_model.dart';
import 'package:evening_flow/models/step_model.dart';
import 'package:evening_flow/ui/icons/routine_icons.dart';
import 'package:evening_flow/utils/formatters.dart';
import 'package:flutter/material.dart';

class RoutineViewModel extends ChangeNotifier {
  // 1. Dependencies
  final RoutineRepository _routineRepository;

  // 2. State
  final List<RoutineModel> _routines = [];
  RoutineModel? _selectedRoutine;
  bool _isLoading = false;
  bool _completedToday = false;

  // 3. Constructor
  RoutineViewModel(this._routineRepository) {
    loadRoutines();
  }

  // 4. Getters

  List<RoutineModel> get routines => _routines;

  bool get isLoading => _isLoading;

  bool get hasRoutines => _routines.isNotEmpty;

  RoutineModel? get selectedRoutine => _selectedRoutine;

  List<StepModel> get steps => _selectedRoutine?.steps ?? [];

  RoutineIconKey? get iconKey => _selectedRoutine?.iconKey;

  bool get completedToday => _completedToday;

  String get startTimeLabel {
    if (_selectedRoutine?.startTime == null) {
      return "";
    } else {
      final time = formatStartTime(_selectedRoutine!.startTime);
      return "Beginn heute um $time Uhr";
    }
  }

  List<RoutineModel> get sortedRoutines {
    if (_selectedRoutine == null) return _routines;

    final list = List<RoutineModel>.from(routines);
    list.remove(selectedRoutine);
    list.insert(0, selectedRoutine!); // selectedRoutine is always first

    return list;
  }

  // 5. Init / Load
  Future<void> loadRoutines() async {
    _isLoading = true;
    notifyListeners();

    final fetchedRoutines = await _routineRepository.fetchRoutines();
    _routines.clear();
    _routines.addAll(fetchedRoutines);
    _isLoading = false;
    notifyListeners();

    if (_routines.isNotEmpty) {
      _selectedRoutine = _routines.first;
    } else {
      _selectedRoutine = null;
    }
  }

  // 6. Actions
  void selectRoutine(RoutineModel routine) {
    if (routine.id == _selectedRoutine?.id) return;
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
