import 'package:evening_flow/data/repositories/routine_repository.dart';
import 'package:evening_flow/models/routine_model.dart';
import 'package:evening_flow/viewmodels/routine_editor_viewmodel.dart';
import 'package:evening_flow/views/routines/edit_routine_view_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditRoutineView extends StatelessWidget {
  final RoutineModel? routine;
  final RoutineEditMode mode;
  const EditRoutineView({super.key, this.routine, required this.mode});

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (_) => RoutineEditorViewModel(
        repo: context.read<RoutineRepository>(),
        mode: mode,
        draftRoutine: routine ?? RoutineModel.empty(),
      ),
      child: const EditRoutineViewContent(),
    );
  }
}
