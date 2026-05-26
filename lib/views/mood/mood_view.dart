import 'package:evening_flow/viewmodels/mood_view_model.dart';
import 'package:evening_flow/views/mood/mood_view_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MoodView extends StatelessWidget {
  const MoodView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MoodViewModel(),
      child: const MoodViewContent(),
    );
  }
}
