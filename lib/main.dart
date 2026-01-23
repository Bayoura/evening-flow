import 'package:evening_flow/app/evening_flow_app.dart';
import 'package:evening_flow/viewmodels/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => HomeViewModel(),
      child: const EveningFlowApp(),
    ),
  );
}
