import 'package:evening_flow/models/mood/mood_view_mode.dart';
import 'package:flutter/material.dart';

class MoodViewModel extends ChangeNotifier {
  MoodViewMode _viewMode = MoodViewMode.calendar;
  DateTime _currentMonthAnchor =
      DateTime.now(); //determines the month which is displayed
  DateTime? _selectedDay;

  MoodViewMode get currentViewMode => _viewMode;
  String get utilityButtonLabel =>
      _viewMode == MoodViewMode.calendar ? "Listenansicht" : "Kalenderansicht";

  DateTime get currentMonthAnchor => _currentMonthAnchor;
  DateTime get currentMonth =>
      DateTime(_currentMonthAnchor.year, _currentMonthAnchor.month);
  DateTime? get selectedDay => _selectedDay;

  void _showCalendarView() {
    if (_viewMode == MoodViewMode.calendar) return;
    _viewMode = MoodViewMode.calendar;
    notifyListeners();
  }

  void _showListView() {
    if (_viewMode == MoodViewMode.list) return;
    _viewMode = MoodViewMode.list;
    notifyListeners();
  }

  void toggleView() {
    _viewMode == MoodViewMode.calendar ? _showListView() : _showCalendarView();
  }

  void setMonthAnchor(DateTime anchor) {
    _currentMonthAnchor = anchor;
    notifyListeners();
  }

  void selectDay(DateTime day) {
    _selectedDay = day;
    notifyListeners();
  }

  void goToPreviousMonth() {
    _currentMonthAnchor = DateTime(
      _currentMonthAnchor.year,
      _currentMonthAnchor.month - 1,
      1,
    );
    notifyListeners();
  }

  void goToNextMonth() {
    _currentMonthAnchor = DateTime(
      _currentMonthAnchor.year,
      _currentMonthAnchor.month + 1,
      1,
    );
    notifyListeners();
  }
}
