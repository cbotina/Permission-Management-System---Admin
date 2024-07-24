import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/common/components/buttons/primary_button.dart';
import 'package:pms_admin/common/extensions/async_value_ui.dart';
import 'package:pms_admin/features/permissions/data/providers/period_permissions_repository.dart';
import 'package:pms_admin/features/permissions/presentation/controllers/delete_permission_controller.dart';

class DeletePermissionFormButton extends ConsumerWidget {
  final int permissionId;

  const DeletePermissionFormButton({
    super.key,
    required this.permissionId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<void> state =
        ref.watch(deletePermissionControllerProvider);

    ref.listen<AsyncValue<void>>(deletePermissionControllerProvider,
        (prev, state) {
      state.showSnackbarOnError(context);
      state.popOnSuccess(
        prev,
        "Franja eliminada exitosamente",
        context,
      );
    });

    return PrimaryButton(
      isLoading: state.isLoading,
      enabled: !state.isLoading,
      onTap: () async {
        await ref
            .read(deletePermissionControllerProvider.notifier)
            .deletePermission(permissionId);

        ref.invalidate(periodPermissionsProvider);
      },
      minWidth: 80,
      backgroundColor: Colors.pink,
      hoverColor: Colors.pinkAccent,
      child: const Text(
        "Eliminar",
        style: TextStyle(
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
