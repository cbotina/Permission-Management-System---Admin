import 'package:flutter/material.dart';
import 'package:pms_admin/common/components/icon_buttons/edit_icon_button.dart';
import 'package:pms_admin/features/periods/domain/models/period.dart';

class EditPeriodIconButton extends StatelessWidget {
  final Period period;
  final bool enabled;

  const EditPeriodIconButton({
    super.key,
    required this.period,
    this.enabled = true,
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
                title: Text(
                  "Editar Periodo ${period.name}",
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
              );
            },
          );
        });
  }
}
