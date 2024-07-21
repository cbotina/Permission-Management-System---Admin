import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pms_admin/features/students/domain/models/student.dart';
part 'permission.freezed.dart';
part 'permission.g.dart';

enum PermissionStatus {
  @JsonValue('P')
  pending,
  @JsonValue('L')
  leavePermission,
  @JsonValue('A')
  approved,
  @JsonValue('R')
  rejected,
}

@freezed
class Permission with _$Permission {
  const factory Permission({
    required int id,
    required PermissionStatus status,
    required DateTime? approvalDate,
    required DateTime? justificationDeadline,
    required DateTime requestDate,
    required String reason,
    required String? evidenceUrl,
    required String? studentNote,
    required String? principalNote,
    required Student student,
  }) = _Permission;

  factory Permission.fromJson(Map<String, dynamic> json) =>
      _$PermissionFromJson(json);
}
