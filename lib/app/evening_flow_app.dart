import 'package:evening_flow/theme/app_theme.dart';
import 'package:evening_flow/views/home/home_view.dart';
import 'package:flutter/material.dart';

class EveningFlowApp extends StatelessWidget {
  const EveningFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Evening Flow',
      theme: AppTheme.standardTheme,
      home: const HomeView(),
    );
  }
}