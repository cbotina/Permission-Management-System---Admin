import 'package:flutter/material.dart';
import 'package:pms_admin/common/components/icon_buttons/action_icon_button.dart';
import 'package:pms_admin/common/components/icon_buttons/edit_icon_button.dart';
import 'package:pms_admin/common/components/icon_buttons/view_icon_button.dart';
import 'package:pms_admin/pages/approve_or_reject_permission_page.dart';
import 'package:pms_admin/pages/permission_details_page.dart';

class ApproveOrRejectPermissionIconButton extends StatelessWidget {
  final bool enabled;
  final int permissionId;
  const ApproveOrRejectPermissionIconButton({
    super.key,
    this.enabled = true,
    required this.permissionId,
  });

  @override
  Widget build(BuildContext context) {
    return ActionIconButton(
      enabled: enabled,
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: ApproveOrRejectPermissionPage(
                permissionId: permissionId,
              ),
            );
          },
        );
      },
    );
  }
}
