import 'package:evening_flow/data/repositories/routine_repository.dart';
import 'package:evening_flow/models/routine_model.dart';
import 'package:evening_flow/models/step_model.dart';
import 'package:evening_flow/ui/icons/routine_icons.dart';
import 'package:flutter/material.dart';

enum RoutineEditMode { create, edit }

class RoutineEditorViewModel extends ChangeNotifier {
  // 1. Dependencies
  final RoutineRepository _routineRepository;

  // 2. State
  final RoutineEditMode _mode;
  RoutineModel
  _draftRoutine; // wird in allen Modi bearbeitet, bei einem Template wird ein RoutineModel mit leeren Werten initialisiert
  bool _isLoading = false;

  // 3. Constructor
  RoutineEditorViewModel({
    required RoutineRepository repo,
    required RoutineEditMode mode,
    required RoutineModel draftRoutine,
  }) : _routineRepository = repo,
       _mode = mode,
       _draftRoutine = draftRoutine
           .copyWith(); // defensive copy, damit die Originaldaten nicht direkt verändert werden

  // 4. Getters
  bool get isLoading => _isLoading;
  RoutineModel get draftRoutine => _draftRoutine;
  String get title => _draftRoutine.title;
  Duration get startTime => _draftRoutine.startTime;
  List<StepModel> get steps => _draftRoutine.steps;
  RoutineIconKey get selectedIcon => _draftRoutine.iconKey;
  Duration? get reminderOffset => _draftRoutine.reminderOffset;

  // 5. Init / Load

  // 6. Actions
  void updateIcon(RoutineIconKey icon) {
    _draftRoutine = _draftRoutine.copyWith(iconKey: icon);
    notifyListeners();
  }

  void updateStartTime(Duration newStartTime) {
    _draftRoutine = _draftRoutine.copyWith(startTime: newStartTime);
    notifyListeners();
  }

    void updateReminderOffset(Duration? newReminderOffset) {
    _draftRoutine = _draftRoutine.copyWith(reminderOffset: newReminderOffset);
    notifyListeners();
  }

  Future<void> save() async {
    _isLoading = true;
    notifyListeners();

    switch (_mode) {
      case RoutineEditMode.create:
        await _routineRepository.addRoutine(_draftRoutine);
        break;

      case RoutineEditMode.edit:
        await _routineRepository.updateRoutine(_draftRoutine);
        break;
    }
    _isLoading = false;
    notifyListeners();
  }
}
