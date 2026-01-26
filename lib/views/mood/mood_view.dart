import 'package:evening_flow/views/mood/widgets/calendar.dart';
import 'package:evening_flow/widgets/buttons.dart';
import 'package:flutter/material.dart';

class MoodView extends StatefulWidget {
  const MoodView({super.key});

  @override
  State<MoodView> createState() => _MoodViewState();
}

class _MoodViewState extends State<MoodView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Align(
              alignment: AlignmentGeometry.topRight,
              child: UtilityButton(text: "Listenansicht", onPressed: () {}),
            ),
            const SizedBox(height: 16.0),
            const Calendar(),
          ],
        ),
      ),
    );
  }
}
