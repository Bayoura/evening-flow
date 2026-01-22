
import 'package:flutter/material.dart';

enum RoutineIconKey {
  relax,
  reflect,
  prepare,
  sleep,
  music,
  journal,
  bath,
  creative,
  read,
  water,
  meditate,
  coffee,
}

const _routineIconMap = {
  RoutineIconKey.relax: Icons.self_improvement,
  RoutineIconKey.reflect: Icons.psychology,
  RoutineIconKey.prepare: Icons.today_outlined,
  RoutineIconKey.sleep: Icons.bedtime,
  RoutineIconKey.music: Icons.music_note,
  RoutineIconKey.journal: Icons.edit_note,
  RoutineIconKey.bath: Icons.bathtub,
  RoutineIconKey.creative: Icons.brush_outlined,
  RoutineIconKey.read: Icons.menu_book,
  RoutineIconKey.water: Icons.water,
  RoutineIconKey.meditate: Icons.spa,
  RoutineIconKey.coffee: Icons.coffee_outlined,
};

IconData getRoutineIcon(RoutineIconKey key) {
  return _routineIconMap[key]!;
}
