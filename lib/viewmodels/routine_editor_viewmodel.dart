import 'package:evening_flow/data/repositories/routine_repository.dart';
import 'package:evening_flow/models/routine_model.dart';
import 'package:flutter/material.dart';

enum RoutineEditMode { createEmpty, createFromTemplate, editExisting }

class RoutineEditorViewModel extends ChangeNotifier {
  // 1. Dependencies
  final RoutineRepository _routineRepository;
  late RoutineEditMode _mode;

  // 2. State
  // RoutineModel? _originalRoutine; // nur bei editExisting;
  late RoutineModel
  _draftRoutine; // wird in allen Modi bearbeitet, bei createEmpty mit leeren Werten initialisiert

  // 3. Constructor
  RoutineEditorViewModel({
    required RoutineRepository repo,
    required RoutineEditMode mode,
    RoutineModel? routine,
    RoutineModel? template,
  }) : _routineRepository = repo {
    _mode = mode;

    if (mode == RoutineEditMode.editExisting && routine != null) {
      _draftRoutine = routine.copyWith();
    }
  }

  // 4. Getters

  // 5. Init / Load

  // 6. Actions
  Future<void> save() async {
    switch (_mode) {
      case RoutineEditMode.createEmpty:
      case RoutineEditMode.createFromTemplate:
        await _routineRepository.addRoutine(_draftRoutine);
        break;

      case RoutineEditMode.editExisting:
        await _routineRepository.updateRoutine(_draftRoutine);
        break;
    }
  }
}
