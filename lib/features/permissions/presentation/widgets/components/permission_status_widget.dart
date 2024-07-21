import 'package:flutter/material.dart';
import 'package:pms_admin/features/permissions/domain/models/permission.dart';

class PermissionStatusWidget extends StatelessWidget {
  final PermissionStatus status;
  final bool verbose;

  const PermissionStatusWidget({
    super.key,
    required this.status,
    this.verbose = false,
  });

  Color getColor(PermissionStatus status) {
    switch (status) {
      case PermissionStatus.pending:
        return Colors.amber;
      case PermissionStatus.leavePermission:
        return Colors.blue;
      case PermissionStatus.approved:
        return Colors.green;
      case PermissionStatus.rejected:
        return Colors.pink;
    }
  }

  String getText(PermissionStatus status) {
    String text = verbose ? 'Permiso' : "";
    switch (status) {
      case PermissionStatus.pending:
        return '$text Pendiente';
      case PermissionStatus.leavePermission:
        return '$text Salida';
      case PermissionStatus.approved:
        return '$text Aprobado';
      case PermissionStatus.rejected:
        return '$text Rechazado';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: getColor(status), width: 1),
        color: getColor(status).withOpacity(.3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        getText(status),
        textAlign: TextAlign.center,
      ),
    );
  }
}
