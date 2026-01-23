import 'dart:async';
import 'package:evening_flow/constants/text_styles.dart';
import 'package:flutter/material.dart';

class RoutineCountdown extends StatefulWidget {
  // Startzeit seit Mitternacht (z. B. 18:30 = Duration(hours: 18, minutes: 30))
  final Duration startTime;

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
    final nowSinceMidnight = Duration(hours: now.hour, minutes: now.minute);

    var diff = widget.startTime - nowSinceMidnight;

    if (diff.isNegative) {
      diff += const Duration(days: 1); // nach Mitternacht
    }
    if (!mounted) return;
    setState(() {
      _remaining = diff;
    });
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);

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
