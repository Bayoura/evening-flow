// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:evening_flow/app/evening_flow_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('HomeScreen builds correctly and shows main widgets', (
    WidgetTester tester,
  ) async {
    // Build the app
    await tester.pumpWidget(const EveningFlowApp());

    // Trigger a frame
    await tester.pumpAndSettle();

    // Prüfe: AppBar ist da
    expect(find.byType(AppBar), findsOneWidget);

    // Prüfe: Titel ist sichtbar
    expect(find.text('Flutter Demo Home Page'), findsOneWidget);

    // Optional: Prüfe, dass ein BottomNavigationBar vorhanden ist
    expect(find.byType(BottomNavigationBar), findsOneWidget);

    // Prüfe: Wichtige Buttons oder Sections (Dummy-Test)
    expect(find.text('Start Routine'), findsNothing); 
  });
}
