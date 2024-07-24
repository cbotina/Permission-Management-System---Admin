import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/common/components/buttons/primary_button.dart';
import 'package:pms_admin/common/extensions/async_value_ui.dart';
import 'package:pms_admin/features/permissions/data/dto/update_permission_dto.dart';
import 'package:pms_admin/features/permissions/domain/models/permission.dart';
import 'package:pms_admin/features/permissions/presentation/controllers/update_permission_controller.dart';

class RejectPermissionFormButton extends ConsumerWidget {
  const RejectPermissionFormButton({
    super.key,
    required TextEditingController controller,
    required this.permissionId,
  }) : _principalCommentController = controller;

  final TextEditingController _principalCommentController;
  final int permissionId;

  @override
  Widget build(BuildContext context, ref) {
    final AsyncValue<void> state =
        ref.watch(updatePermissionControllerProvider);

    ref.listen<AsyncValue<void>>(updatePermissionControllerProvider,
        (prev, state) {
      state.showSnackbarOnError(context);
      state.popOnSuccess(
        prev,
        "Permiso rechazado",
        context,
      );
    });

    return PrimaryButton(
      isLoading: state.isLoading,
      enabled: !state.isLoading,
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

        ref
            .read(updatePermissionControllerProvider.notifier)
            .updatePermission(permissionId, dto);
      },
    );
  }
}
