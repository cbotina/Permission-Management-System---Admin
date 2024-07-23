import 'package:flutter/material.dart';
import 'package:pms_admin/common/components/icon_buttons/view_icon_button.dart';
import 'package:pms_admin/pages/permission_details_page.dart';

class ViewPermissionIconButton extends StatelessWidget {
  final bool enabled;
  final int permissionId;
  const ViewPermissionIconButton({
    super.key,
    this.enabled = true,
    required this.permissionId,
  });

  @override
  Widget build(BuildContext context) {
    return ViewIconButton(
      enabled: enabled,
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: PermissionDetailsPage(
                permissionId: permissionId,
              ),
            );
          },
        );
      },
    );
  }
}
