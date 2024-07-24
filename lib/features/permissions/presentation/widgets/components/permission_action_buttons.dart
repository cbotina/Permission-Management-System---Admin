import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/features/auth/data/providers/role_provider.dart';
import 'package:pms_admin/features/auth/domain/enums/user_role.dart';
import 'package:pms_admin/features/permissions/domain/models/permission_with_student_view.dart';
import 'package:pms_admin/features/permissions/presentation/widgets/components/buttons/delete_permission_icon_button.dart';
import 'package:pms_admin/features/permissions/presentation/widgets/components/buttons/approve_or_reject_permission_icon_button.dart';
import 'package:pms_admin/features/permissions/presentation/widgets/components/buttons/update_permission_icon_button.dart';
import 'package:pms_admin/features/permissions/presentation/widgets/components/buttons/view_permission_icon_button.dart';

class PermissionActionButtons extends ConsumerWidget {
  final PermissionWithStudentView data;
  final bool enabled;

  const PermissionActionButtons({
    super.key,
    required this.data,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context, ref) {
    return Row(
      children: [
        ViewPermissionIconButton(
          permissionId: data.permissionId,
        ),
        Visibility(
          visible: ref.watch(roleProvider) == UserRole.admin,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(width: 10),
              DeletePermissionIconButton(
                permissionId: data.permissionId,
              ),
              const SizedBox(width: 10),
              UpdatePermissionIconButton(
                enabled: true,
                permission: data,
              )
            ],
          ),
        ),
      ],
    );
  }
}
