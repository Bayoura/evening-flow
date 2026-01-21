import 'package:evening_flow/models/step_model.dart';
import 'package:evening_flow/widgets/steps/step_item.dart';
import 'package:flutter/material.dart';

class StepsList extends StatelessWidget {
  final List<StepModel> steps;
  const StepsList({super.key, required this.steps});

  @override
  Widget build(BuildContext context) {
    if (steps.isEmpty) return const SizedBox.shrink();

    return SizedBox(
      height: 260,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: steps.length,
        itemBuilder: (context, index) {
          return StepItem(stepModel: steps[index]);
        },
      ),
    );
  }
}
