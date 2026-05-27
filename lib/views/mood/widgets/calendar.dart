import 'package:evening_flow/constants/colors.dart';
import 'package:evening_flow/ui/theme/mood_colors.dart';
import 'package:evening_flow/viewmodels/mood_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  final CalendarFormat _calendarFormat = CalendarFormat.month;
  final kToday = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final moodViewModel = context.watch<MoodViewModel>();
    final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
    final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);

    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceSecondary,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: TableCalendar(
        firstDay: kFirstDay,
        lastDay: kLastDay,
        focusedDay: moodViewModel.currentVisibleMonth,
        startingDayOfWeek: StartingDayOfWeek.monday,
        availableCalendarFormats: {_calendarFormat: ""},
        calendarFormat: _calendarFormat,
        daysOfWeekHeight: 40,
        weekendDays: [],

        //BADGES
        eventLoader: (day) {
          return moodViewModel.entryForDay(day) != null ? [1] : [];
        },
        calendarBuilders: CalendarBuilders(
          markerBuilder: (context, day, events) {
            final entry = moodViewModel.entryForDay(day);

            if (entry == null) return const SizedBox.shrink();

            return Positioned(
              top: 6,
              right: 6,
              child: Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: moodColor(entry.mood),
                  shape: BoxShape.circle,
                ),
              ),
            );
          },

          // DAYS OF THE WEEK
          dowBuilder: (context, day) {
            const labels = ['mo', 'di', 'mi', 'do', 'fr', 'sa', 'so'];

            return Center(
              child: Text(
                labels[day.weekday - 1].toUpperCase(),
                style: Theme.of(
                  context,
                ).textTheme.labelSmall!.copyWith(color: AppColors.textPrimary),
              ),
            );
          },
        ),

        // STYLES
        headerStyle: HeaderStyle(
          titleCentered: true,
          titleTextStyle: Theme.of(context).textTheme.bodyLarge!,
        ),
        calendarStyle: CalendarStyle(
          defaultTextStyle: Theme.of(context).textTheme.bodyMedium!,
          todayTextStyle: Theme.of(
            context,
          ).textTheme.bodyMedium!.copyWith(color: AppColors.textOnAccent),
          
          todayDecoration: const BoxDecoration(
            color: AppColors.textSecondary,
            shape: BoxShape.circle,
          ),
        ),

        // selectedDayPredicate: (day) {
        //   // Use `selectedDayPredicate` to determine which day is currently selected.
        //   // If this returns true, then `day` will be marked as selected.

        //   // Using `isSameDay` is recommended to disregard
        //   // the time-part of compared DateTime objects.
        //   return isSameDay(_selectedDay, day);
        // },
        onDaySelected: (selectedDay, focusedDay) {
          moodViewModel.selectDay(selectedDay);
          moodViewModel.setVisibleMonth(selectedDay);
        },
        onPageChanged: (newMonth) {
          moodViewModel.setVisibleMonth(newMonth);
        },
      ),
    );
  }
}
