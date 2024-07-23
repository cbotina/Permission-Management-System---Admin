import 'package:flutter/material.dart';

@immutable
class ScheduleRangeDatesDto {
  final int studentId;
  final DateTime startDate;
  final DateTime endDate;
  const ScheduleRangeDatesDto({
    required this.studentId,
    required this.startDate,
    required this.endDate,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ScheduleRangeDatesDto &&
        other.startDate == startDate &&
        other.endDate == endDate &&
        other.studentId == studentId;
  }

  @override
  int get hashCode =>
      startDate.hashCode ^ endDate.hashCode ^ studentId.hashCode;
}
