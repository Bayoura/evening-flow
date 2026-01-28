import 'package:evening_flow/data/mock/mood_entry_list.dart';
import 'package:evening_flow/models/mood/mood_entry.dart';
import 'package:evening_flow/models/mood/mood_view_mode.dart';
import 'package:flutter/material.dart';

class MoodViewModel extends ChangeNotifier {
  MoodViewMode _viewMode = MoodViewMode.calendar;
  DateTime _visibleMonth =
      DateTime.now(); //determines the month which is displayed
  DateTime? _selectedDay;

  MoodViewMode get currentViewMode => _viewMode;
  String get utilityButtonLabel =>
      _viewMode == MoodViewMode.calendar ? "Listenansicht" : "Kalenderansicht";

  DateTime get currentVisibleMonth => _visibleMonth;
  DateTime get currentMonth =>
      DateTime(_visibleMonth.year, _visibleMonth.month);
  DateTime? get selectedDay => _selectedDay;
  DateTime get monthStart => DateTime(currentMonth.year, currentMonth.month, 1);
  DateTime get monthEnd =>
      DateTime(currentMonth.year, currentMonth.month + 1, 0);

  // Get all entries for the current month (only for MoodListView)
  List<MoodEntry> get entriesForCurrentMonth {
    return allEntries
        .where(
          (entry) =>
              !entry.date.isBefore(monthStart) && !entry.date.isAfter(monthEnd),
        )
        .toList()
      ..sort((a, b) => b.date.compareTo(a.date));
  }

  // Check if there is an entry for that day (MoodCalendarView)
  MoodEntry? entryForDay(DateTime day) {
    for (final entry in allEntries) {
      if (entry.date.year == day.year &&
          entry.date.month == day.month &&
          entry.date.day == day.day) {
        return entry;
      }
    }
    return null;
  }

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

  void setVisibleMonth(DateTime month) {
    _visibleMonth = month;
    notifyListeners();
  }

  void selectDay(DateTime day) {
    _selectedDay = day;
    notifyListeners();
  }

  void goToPreviousMonth() {
    _visibleMonth = DateTime(_visibleMonth.year, _visibleMonth.month - 1, 1);
    notifyListeners();
  }

  void goToNextMonth() {
    _visibleMonth = DateTime(_visibleMonth.year, _visibleMonth.month + 1, 1);
    notifyListeners();
  }
}
