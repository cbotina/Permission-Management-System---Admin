import 'package:flutter/material.dart';
import 'package:pms_admin/common/components/icon_buttons/delete_icon_button.dart';
import 'package:pms_admin/features/absences/presentation/widgets/delete_absence_form.dart';

class DeleteAbsenceIconButton extends StatelessWidget {
  final int absenceId;
  final bool enabled;

  const DeleteAbsenceIconButton({
    super.key,
    required this.absenceId,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return DeleteIconButton(
        enabled: enabled,
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: DeleteAbsenceForm(absenceId: absenceId),
              );
            },
          );
        });
  }
}
