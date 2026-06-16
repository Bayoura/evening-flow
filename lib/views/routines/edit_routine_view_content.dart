import 'package:evening_flow/constants/text_styles.dart';
import 'package:evening_flow/ui/icons/routine_icons.dart';
import 'package:evening_flow/viewmodels/routine_editor_viewmodel.dart';
import 'package:evening_flow/widgets/routines/routine_icon_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditRoutineViewContent extends StatefulWidget {
  const EditRoutineViewContent({super.key});

  @override
  State<EditRoutineViewContent> createState() => _EditRoutineViewContentState();
}

class _EditRoutineViewContentState extends State<EditRoutineViewContent> {
  late final RoutineEditorViewModel viewModel;
  final TextEditingController _titleController = TextEditingController();

  Future<void> _openIconPicker() async {
    final selectedIcon = await showModalBottomSheet<RoutineIconKey>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => const RoutineIconPicker(),
    );

    if (selectedIcon != null) {
      viewModel.updateIcon(selectedIcon);
      setState(() {}); // UI aktualisieren
    }
  }

  @override
  void initState() {
    super.initState();
    viewModel = context.read<RoutineEditorViewModel>();

    _titleController.text = viewModel.draftRoutine.title;
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Routine bearbeiten")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Icon und Name", style: AppTextStyles.section),
            const SizedBox(height: 8),
            SizedBox(
              height: 44,
              child: Row(
                children: [
                  InkWell(
                    onTap: _openIconPicker,
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).colorScheme.outline,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        getRoutineIcon(viewModel.selectedIcon),
                        size: 32,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: _titleController,
                      maxLines: 1,
                      decoration: const InputDecoration(
                        // labelText: "Name der Routine",
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                        hintText: "Name der Routine",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        isDense: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text("Startzeit", style: AppTextStyles.section),
            const SizedBox(height: 8),
            Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 56,
                    height: 44,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.outline,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(child: Text("21")),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: const Text(":", style: AppTextStyles.section),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 56,
                    height: 44,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.outline,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(child: Text("45")),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
