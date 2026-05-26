import 'package:evening_flow/app/evening_flow_app.dart';
import 'package:evening_flow/firebase_options.dart';
import 'package:evening_flow/viewmodels/home_viewmodel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initializeDateFormatting('de_DE');
  runApp(
    ChangeNotifierProvider(
      create: (_) => HomeViewModel(),
      child: const EveningFlowApp(),
    ),
  );
}
