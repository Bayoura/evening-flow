import 'dart:async';
import 'package:evening_flow/constants/text_styles.dart';
import 'package:flutter/material.dart';

class RoutineCountdown extends StatefulWidget {
  final TimeOfDay startTime;

  const RoutineCountdown({super.key, required this.startTime});

  @override
  State<RoutineCountdown> createState() => _RoutineCountdownState();
}

class _RoutineCountdownState extends State<RoutineCountdown> {
  late Duration _remaining;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _updateRemaining();
    // Timer jede Minute aktualisieren
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _updateRemaining();
    });
  }

  void _updateRemaining() {
    final now = TimeOfDay.now();
    final nowMinutes = now.hour * 60 + now.minute;
    final startMinutes = widget.startTime.hour * 60 + widget.startTime.minute;

    var diffMinutes = startMinutes - nowMinutes;
    var diffSeconds = (diffMinutes * 60) - DateTime.now().second;

    if (diffSeconds < 0) diffSeconds += 24 * 60 * 60; // nach Mitternacht

    setState(() {
      _remaining = Duration(seconds: diffSeconds);
    });
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    // final seconds = duration.inSeconds.remainder(60);

    if (hours > 0 && minutes > 0) {
      return "${hours}h ${minutes}m";
    } else if (hours > 0) {
      return "${hours}h";
    } else if (minutes > 0) {
      return "${minutes}m";
    } else {
      return "Jetzt";
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "Noch ${_formatDuration(_remaining)}",
      style: AppTextStyles.bodySmall,
    );
  }
}
