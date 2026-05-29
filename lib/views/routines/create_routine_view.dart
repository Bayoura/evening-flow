import 'package:evening_flow/data/mock/example_routines.dart';
import 'package:evening_flow/views/routines/edit_routine_view.dart';
import 'package:evening_flow/views/routines/widgets/routine_category_section.dart';
import 'package:evening_flow/widgets/buttons.dart';
import 'package:flutter/material.dart';

class CreateRoutineView extends StatefulWidget {
  const CreateRoutineView({super.key});

  @override
  State<CreateRoutineView> createState() => _CreateRoutineViewState();
}

class _CreateRoutineViewState extends State<CreateRoutineView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Routine erstellen"),
            Text(
              "Wähle deine Basis für eine neue Routine",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: PrimaryButton(
                text: "Eigene Routine erstellen",
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const EditRoutineView(),
                    ),
                  );
                },
                actionIcon: Icons.chevron_right,
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 40)),
            SliverList(
              delegate: SliverChildListDelegate([
                RoutineCategorySection(
                  title: "Entspannung",
                  routines: exampleEveningRoutines,
                  onRoutineTap: (routine) {
                    print(routine);
                    print(routine.title);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EditRoutineView(routine: routine),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 40),
                RoutineCategorySection(
                  title: "Journaling",
                  routines: exampleEveningRoutines,
                  onRoutineTap: (routine) {
                    print(routine);
                    print(routine.title);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EditRoutineView(routine: routine),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 40),
                RoutineCategorySection(
                  title: "Produktivität",
                  routines: exampleEveningRoutines,
                  onRoutineTap: (routine) {
                    print(routine);
                    print(routine.title);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EditRoutineView(routine: routine),
                      ),
                    );
                  },
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
