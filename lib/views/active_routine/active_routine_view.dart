import 'package:evening_flow/models/routine_model.dart';
import 'package:flutter/material.dart';

class ActiveRoutineView extends StatefulWidget {
  final RoutineModel routine;
  const ActiveRoutineView({super.key, required this.routine});

  @override
  State<ActiveRoutineView> createState() => _ActiveRoutineViewState();
}

class _ActiveRoutineViewState extends State<ActiveRoutineView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.routine.title),
      ),
    );
  }
}
