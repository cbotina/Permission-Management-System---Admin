import 'package:pms_admin/features/permissions/domain/models/permission.dart';

extension ToPermissionStatus on String {
  PermissionStatus toPermissionStatus() {
    switch (this) {
      case 'P':
        return PermissionStatus.pending;
      case 'L':
        return PermissionStatus.leavePermission;
      case 'A':
        return PermissionStatus.approved;
      case 'R':
        return PermissionStatus.rejected;
      default:
        return PermissionStatus.pending;
    }
  }
}
