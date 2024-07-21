import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pms_admin/common/extensions/string_to_time.dart';

part 'permission_absence_view.freezed.dart';

@freezed
class PermissionAbsenceView with _$PermissionAbsenceView {
  const factory PermissionAbsenceView({
    required DateTime absenceDate,
    required TimeOfDay startTime,
    required TimeOfDay endtime,
    required String? teacherNote,
    required String subjectName,
  }) = _PermissionAbsenceView;

  factory PermissionAbsenceView.fromJson(Map<String, dynamic> json) {
    return PermissionAbsenceView(
      absenceDate: DateTime.parse(json['absenceDate']),
      startTime: json['startTime'].toString().toDayTime(),
      endtime: json['endTime'].toString().toDayTime(),
      teacherNote: json['teacherNote'],
      subjectName: json['subjectName'],
    );
  }
}
