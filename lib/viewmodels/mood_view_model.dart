import 'package:evening_flow/models/mood_view_mode.dart';
import 'package:flutter/material.dart';

class MoodViewModel extends ChangeNotifier {
  MoodViewMode _viewMode = MoodViewMode.calendar;

  MoodViewMode get currentViewMode => _viewMode;

  String get utilityButtonLabel =>
      _viewMode == MoodViewMode.calendar ? "Listenansicht" : "Kalenderansicht";

  void showCalendarView() {
    if (_viewMode == MoodViewMode.calendar) return;
    _viewMode = MoodViewMode.calendar;
    notifyListeners();
  }

  void showListView() {
    if (_viewMode == MoodViewMode.list) return;
    _viewMode = MoodViewMode.list;
    notifyListeners();
  }

  void toggleView() {
    _viewMode == MoodViewMode.calendar ? showListView() : showCalendarView();
  }
}
