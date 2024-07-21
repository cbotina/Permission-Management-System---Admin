import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pms_admin/common/extensions/string_to_permission_status.dart';
import 'package:pms_admin/common/extensions/string_to_time.dart';
import 'package:pms_admin/features/permissions/domain/models/permission.dart';

part 'absence_with_student_view.freezed.dart';

@freezed
class AbsenceWithStudentView with _$AbsenceWithStudentView {
  const factory AbsenceWithStudentView({
    required int absenceId,
    required String student,
    required String studentCC,
    required DateTime absenceDate,
    required TimeOfDay startTime,
    required TimeOfDay endTime,
    required PermissionStatus permissionStatus,
  }) = _AbsenceWithStudentView;

  factory AbsenceWithStudentView.fromJson(Map<String, dynamic> json) {
    return AbsenceWithStudentView(
      absenceId: json['absenceId'],
      student: json['student'],
      studentCC: json['studentCC'],
      absenceDate: DateTime.parse(json['absenceDate']),
      startTime: json['startTime'].toString().toDayTime(),
      endTime: json['endTime'].toString().toDayTime(),
      permissionStatus:
          json['permissionStatus'].toString().toPermissionStatus(),
    );
  }
}
