// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PermissionImpl _$$PermissionImplFromJson(Map<String, dynamic> json) =>
    _$PermissionImpl(
      id: (json['id'] as num).toInt(),
      status: $enumDecode(_$PermissionStatusEnumMap, json['status']),
      approvalDate: json['approvalDate'] == null
          ? null
          : DateTime.parse(json['approvalDate'] as String),
      justificationDeadline: json['justificationDeadline'] == null
          ? null
          : DateTime.parse(json['justificationDeadline'] as String),
      requestDate: DateTime.parse(json['requestDate'] as String),
      reason: json['reason'] as String,
      evidenceUrl: json['evidenceUrl'] as String?,
      studentNote: json['studentNote'] as String?,
      principalNote: json['principalNote'] as String?,
      student: Student.fromJson(json['student'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PermissionImplToJson(_$PermissionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': _$PermissionStatusEnumMap[instance.status]!,
      'approvalDate': instance.approvalDate?.toIso8601String(),
      'justificationDeadline':
          instance.justificationDeadline?.toIso8601String(),
      'requestDate': instance.requestDate.toIso8601String(),
      'reason': instance.reason,
      'evidenceUrl': instance.evidenceUrl,
      'studentNote': instance.studentNote,
      'principalNote': instance.principalNote,
      'student': instance.student,
    };

const _$PermissionStatusEnumMap = {
  PermissionStatus.pending: 'P',
  PermissionStatus.leavePermission: 'L',
  PermissionStatus.approved: 'A',
  PermissionStatus.rejected: 'R',
};
