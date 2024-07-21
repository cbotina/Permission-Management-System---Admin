import 'package:flutter/material.dart';
import 'package:pms_admin/features/permissions/domain/models/permission_with_student_view.dart';
import 'package:pms_admin/features/permissions/presentation/widgets/components/buttons/view_permission_icon_button.dart';

class PermissionActionButtons extends StatelessWidget {
  final PermissionWithStudentView data;
  final bool enabled;

  const PermissionActionButtons({
    super.key,
    required this.data,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ViewPermissionIconButton(
          enabled: enabled,
          permissionId: data.permissionId,
        )
      ],
    );
  }
}
