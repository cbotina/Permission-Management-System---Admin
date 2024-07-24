import 'package:flutter/material.dart';
import 'package:pms_admin/common/components/icon_buttons/delete_icon_button.dart';
import 'package:pms_admin/features/permissions/presentation/widgets/components/delete_permission_form.dart';

class DeletePermissionIconButton extends StatelessWidget {
  final int permissionId;
  const DeletePermissionIconButton({super.key, required this.permissionId});

  @override
  Widget build(BuildContext context) {
    return DeleteIconButton(
      enabled: true,
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: DeletePermissionForm(
                permissionId: permissionId,
              ),
            );
          },
        );
      },
    );
  }
}
