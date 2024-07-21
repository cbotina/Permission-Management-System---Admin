import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pms_admin/common/extensions/string_to_time.dart';
part 'student_schedule_view.freezed.dart';

@freezed
class StudentScheduleView with _$StudentScheduleView {
  const factory StudentScheduleView({
    required int subjectGroupTimeSlotId,
    required TimeOfDay startTime,
    required TimeOfDay endTime,
    required String subjectName,
    required String day,
    required String teacherName,
  }) = _StudentScheduleView;

  factory StudentScheduleView.fromJson(Map<String, dynamic> json) {
    return StudentScheduleView(
      subjectGroupTimeSlotId: json['subjectGroupTimeSlotId'],
      startTime: json['startTime'].toString().toDayTime(),
      endTime: json['endTime'].toString().toDayTime(),
      subjectName: json['subjectName'],
      day: json['day'],
      teacherName: json['teacherName'],
    );
  }
}
