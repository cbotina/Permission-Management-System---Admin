import 'package:flutter/material.dart';
import 'package:pms_admin/common/components/icon_buttons/edit_icon_button.dart';
import 'package:pms_admin/common/components/icon_buttons/view_icon_button.dart';
import 'package:pms_admin/pages/edit_permission_page.dart';
import 'package:pms_admin/pages/permission_details_page.dart';

class EditPermissionIconButton extends StatelessWidget {
  final bool enabled;
  final int permissionId;
  const EditPermissionIconButton({
    super.key,
    this.enabled = true,
    required this.permissionId,
  });

  @override
  Widget build(BuildContext context) {
    return EditIconButton(
      enabled: enabled,
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: EditPermissionPage(
                permissionId: permissionId,
              ),
            );
          },
        );
      },
    );
  }
}
