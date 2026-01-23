import 'package:evening_flow/models/routine_model.dart';
import 'package:evening_flow/ui/icons/routine_icons.dart';
import 'package:evening_flow/viewmodels/home_viewmodel.dart';
import 'package:evening_flow/views/active_routine/active_routine_view.dart';
import 'package:evening_flow/widgets/buttons.dart';
import 'package:evening_flow/constants/colors.dart';
import 'package:evening_flow/constants/text_styles.dart';
import 'package:evening_flow/widgets/routines/routine_countdown.dart';
import 'package:evening_flow/widgets/steps/steps_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final homeViewModel = context.watch<HomeViewModel>();

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Deine aktuelle Routine für heute:",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<RoutineModel>(
                initialValue: homeViewModel.selectedRoutine,
                style: AppTextStyles.buttonPrimary,
                icon: const Padding(
                  padding: EdgeInsets.only(right: 24),
                  child: Icon(
                    Icons.arrow_drop_down,
                    color: AppColors.textPrimary,
                  ),
                ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: AppColors.surfaceSecondary,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: AppColors.surfaceSecondary,
                      width: 2,
                    ),
                  ),
                ),
                items: homeViewModel.routines
                    .map(
                      (routine) => DropdownMenuItem(
                        value: routine,
                        child: Row(
                          children: [
                            Icon(getRoutineIcon(routine.iconKey)),
                            const SizedBox(width: 8),
                            Text(routine.title),
                          ],
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (routine) {
                  if (routine != null) {
                    setState(() {
                      homeViewModel.selectRoutine(routine);
                    });
                  }
                },
              ),
              const SizedBox(height: 24),
              Text(homeViewModel.startTimeLabel),
              const SizedBox(height: 8),
              RoutineCountdown(
                startTime: homeViewModel.selectedRoutine.startTime,
              ),
              const SizedBox(height: 40),
              Center(
                child: PrimaryButton(
                  text: "Jetzt starten",
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ActiveRoutineView(
                          routine: homeViewModel.selectedRoutine,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 100),
              Text(
                "Schritte heute:",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 16),
              StepsList(steps: homeViewModel.steps),
            ],
          ),
        ),
      ),
    );
  }
}
