import 'package:freezed_annotation/freezed_annotation.dart';
import 'student_schedule_view.dart';
part 'day_time_slots.freezed.dart';

@freezed
class DayTimeSlots with _$DayTimeSlots {
  const factory DayTimeSlots({
    required DateTime date,
    required List<StudentScheduleView> subjectGroupTimeSlots,
  }) = _DayTimeSlots;

  factory DayTimeSlots.fromJson(Map<String, dynamic> json) {
    return DayTimeSlots(
      date: DateTime.parse(json['date']),
      subjectGroupTimeSlots: (json['subjectGroupTimeSlots'] as List)
          .map((e) => StudentScheduleView.fromJson(e))
          .toList(),
    );
  }
}
