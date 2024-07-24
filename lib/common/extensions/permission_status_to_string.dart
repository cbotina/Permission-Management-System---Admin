import 'package:pms_admin/features/permissions/domain/models/permission.dart';

extension ToString on PermissionStatus {
  String toShortString() {
    switch (this) {
      case PermissionStatus.pending:
        return 'P';
      case PermissionStatus.leavePermission:
        return 'L';
      case PermissionStatus.approved:
        return 'A';
      case PermissionStatus.rejected:
        return 'R';
    }
  }

  String toLongString() {
    switch (this) {
      case PermissionStatus.pending:
        return 'Pendiente';
      case PermissionStatus.leavePermission:
        return 'Salida';
      case PermissionStatus.approved:
        return 'Aprobado';
      case PermissionStatus.rejected:
        return 'Rechazado';
    }
  }
}
