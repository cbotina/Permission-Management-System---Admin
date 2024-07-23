import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pms_admin/common/components/buttons/primary_button.dart';
import 'package:pms_admin/features/permissions/data/dto/update_permission_dto.dart';
import 'package:pms_admin/features/permissions/domain/models/permission.dart';

class RejectPermissionFormButton extends StatelessWidget {
  const RejectPermissionFormButton({
    super.key,
    required TextEditingController controller,
  }) : _principalCommentController = controller;

  final TextEditingController _principalCommentController;

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      minWidth: 250,
      backgroundColor: Colors.pink,
      hoverColor: Colors.pinkAccent,
      child: const Text(
        "Rechazar",
        style: TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
      ),
      onTap: () {
        final principalComment = _principalCommentController.text;
        final dto = UpdatePermissionDto(
          status: PermissionStatus.rejected,
          principalNote: principalComment,
          approvalDate: DateTime.now(),
        );

        log(dto.status.toString());
        log(dto.principalNote.toString());
        log(dto.approvalDate.toString());

        Navigator.of(context).pop();
      },
    );
  }
}
