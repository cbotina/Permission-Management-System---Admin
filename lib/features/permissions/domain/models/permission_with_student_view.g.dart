// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission_with_student_view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PermissionWithStudentViewImpl _$$PermissionWithStudentViewImplFromJson(
        Map<String, dynamic> json) =>
    _$PermissionWithStudentViewImpl(
      permissionId: (json['permissionId'] as num).toInt(),
      studentId: (json['studentId'] as num).toInt(),
      requestDate: DateTime.parse(json['requestDate'] as String),
      student: json['student'] as String,
      reason: json['reason'] as String,
      status: $enumDecode(_$PermissionStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$PermissionWithStudentViewImplToJson(
        _$PermissionWithStudentViewImpl instance) =>
    <String, dynamic>{
      'permissionId': instance.permissionId,
      'studentId': instance.studentId,
      'requestDate': instance.requestDate.toIso8601String(),
      'student': instance.student,
      'reason': instance.reason,
      'status': _$PermissionStatusEnumMap[instance.status]!,
    };

const _$PermissionStatusEnumMap = {
  PermissionStatus.pending: 'P',
  PermissionStatus.leavePermission: 'L',
  PermissionStatus.approved: 'A',
  PermissionStatus.rejected: 'R',
};
