import 'package:evening_flow/models/routine_model.dart';
import 'package:evening_flow/ui/icons/routine_icons.dart';
import 'package:evening_flow/widgets/routines/routine_icon_picker.dart';
import 'package:flutter/material.dart';

class EditRoutineView extends StatefulWidget {
   final RoutineModel? routine;
  const EditRoutineView({super.key, this.routine});

  @override
  State<EditRoutineView> createState() => _EditRoutineViewState();
}

class _EditRoutineViewState extends State<EditRoutineView> {
  RoutineIconKey _selectedIcon = RoutineIconKey.relax;

  Future<void> _openIconPicker() async {
    final selectedIcon = await showModalBottomSheet<RoutineIconKey>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => const RoutineIconPicker(),
    );

    if (selectedIcon != null) {
      _selectedIcon = selectedIcon;
      // _viewModel.setIcon(selectedIcon);
      setState(() {}); // UI aktualisieren
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Routine anlegen")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Icon", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),

            InkWell(
             
              onTap: _openIconPicker,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.outline, 
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(getRoutineIcon(_selectedIcon), size: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
