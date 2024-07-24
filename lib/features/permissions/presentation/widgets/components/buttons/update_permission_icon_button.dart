import 'package:flutter/material.dart';
import 'package:pms_admin/common/components/icon_buttons/edit_icon_button.dart';
import 'package:pms_admin/common/components/icon_buttons/view_icon_button.dart';
import 'package:pms_admin/features/permissions/domain/models/permission.dart';
import 'package:pms_admin/features/permissions/domain/models/permission_with_student_view.dart';
import 'package:pms_admin/pages/approve_or_reject_permission_page.dart';
import 'package:pms_admin/pages/permission_details_page.dart';
import 'package:pms_admin/pages/update_permission_page.dart';

class UpdatePermissionIconButton extends StatelessWidget {
  final bool enabled;
  final PermissionWithStudentView permission;

  const UpdatePermissionIconButton(
      {super.key, required this.enabled, required this.permission});

  @override
  Widget build(BuildContext context) {
    return EditIconButton(
      enabled: enabled,
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: UpdatePermissionPage(
                permission: permission,
              ),
            );
          },
        );
      },
    );
  }
}
