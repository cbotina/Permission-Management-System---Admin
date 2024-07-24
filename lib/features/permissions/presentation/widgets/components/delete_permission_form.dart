import 'package:flutter/material.dart';
import 'package:pms_admin/common/components/buttons/secondary_button.dart';
import 'package:pms_admin/features/permissions/presentation/widgets/components/form_buttons/delete_permission_form_button.dart';

class DeletePermissionForm extends StatefulWidget {
  final int permissionId;
  const DeletePermissionForm({
    super.key,
    required this.permissionId,
  });

  @override
  State<DeletePermissionForm> createState() => _DeletePermissionFormState();
}

class _DeletePermissionFormState extends State<DeletePermissionForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Eliminar Permiso",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 30),
          const Text("Esta acción no se puede deshacer"),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SecondaryButton(
                onTap: Navigator.of(context).pop,
                minWidth: 80,
                child: Text(
                  "Cancelar",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              DeletePermissionFormButton(
                permissionId: widget.permissionId,
              )
            ],
          ),
        ],
      ),
    );
  }
}
