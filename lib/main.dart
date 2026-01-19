import 'package:evening_flow/screens/home/home_screen.dart';
import 'package:evening_flow/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EveningFlowApp());
}

class EveningFlowApp extends StatelessWidget {
  const EveningFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Evening Flow',
      theme: AppTheme.standardTheme,
      home: const HomeScreen(),
    );
  }
}
