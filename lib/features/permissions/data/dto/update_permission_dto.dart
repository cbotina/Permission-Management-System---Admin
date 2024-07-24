import 'package:pms_admin/common/extensions/permission_status_to_string.dart';
import 'package:pms_admin/features/permissions/domain/models/permission.dart';

class UpdatePermissionDto {
  final DateTime? approvalDate;
  final String? principalNote;
  final PermissionStatus status;
  final DateTime? justificationDeadline;

  UpdatePermissionDto({
    this.approvalDate,
    this.principalNote,
    required this.status,
    this.justificationDeadline,
  });

  Map<String, dynamic> toMap() {
    return {
      'approvalDate': approvalDate?.toIso8601String(),
      'principalNote': principalNote,
      'status': status.toShortString(),
      'justificationDeadline': justificationDeadline?.toString(),
    };
  }
}
