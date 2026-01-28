import 'package:evening_flow/app/evening_flow_app.dart';
import 'package:evening_flow/viewmodels/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('de_DE');
  runApp(
    ChangeNotifierProvider(
      create: (_) => HomeViewModel(),
      child: const EveningFlowApp(),
    ),
  );
}
