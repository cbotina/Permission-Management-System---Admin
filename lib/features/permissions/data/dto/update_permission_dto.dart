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
}
