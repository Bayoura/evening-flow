String formatDuration(Duration d) {
  final h = d.inHours;
  final m = d.inMinutes % 60;
  if (h > 0) return "${h}h ${m}m";
  return "${m}m";
}

String formatStartTime(Duration sinceMidnight) {
  final h = sinceMidnight.inHours.toString().padLeft(2, "0");
  final m = (sinceMidnight.inMinutes % 60).toString().padLeft(2, "0");
  return "$h:$m";
}

String formatTimeUntilStart(Duration duration) {
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
