import 'package:flutter/material.dart';
import 'package:pms_admin/common/components/icon_buttons/edit_icon_button.dart';
import 'package:pms_admin/features/periods/domain/models/period.dart';
import 'package:pms_admin/features/periods/presentation/widgets/components/forms/edit_period_form.dart';

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
                content: EditPeriodForm(period: period),
              );
            },
          );
        });
  }
}
