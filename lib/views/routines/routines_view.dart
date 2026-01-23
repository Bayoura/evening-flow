import 'package:evening_flow/viewmodels/home_viewmodel.dart';
import 'package:evening_flow/views/routines/create_routine_view.dart';
import 'package:evening_flow/views/routines/edit_routine_view.dart';
import 'package:evening_flow/views/routines/widgets/routine_card.dart';
import 'package:evening_flow/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RoutinesView extends StatefulWidget {
  const RoutinesView({super.key});

  @override
  State<RoutinesView> createState() => _RoutinesViewState();
}

class _RoutinesViewState extends State<RoutinesView> {
  @override
  Widget build(BuildContext context) {
    final homeViewModel = context.watch<HomeViewModel>();
    final routines = homeViewModel.sortedRoutines;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsetsGeometry.all(16),
        child: ListView.builder(
          itemCount: routines.length,
          itemBuilder: (context, index) {
            final routine = routines[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: RoutineCard(
                routine: routine,
                isSelected: routine.id == homeViewModel.selectedRoutine.id,
                onDelete: () {
                  debugPrint("DELETE");
                },
                onEdit: () {
                   Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EditRoutineView(
                          routine: routine,
                        ),
                      ),
                    );
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: SecondaryButton(
        text: "Neue Routine",
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const CreateRoutineView()),
          );
        },
        leadingIcon: Icons.add,
      ),
    );
  }
}
