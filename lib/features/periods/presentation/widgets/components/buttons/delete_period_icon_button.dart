import 'package:flutter/material.dart';
import 'package:pms_admin/common/components/icon_buttons/delete_icon_button.dart';
import 'package:pms_admin/features/periods/domain/models/period.dart';
import 'package:pms_admin/features/periods/presentation/widgets/components/forms/delete_period_form.dart';

class DeletePeriodIconButton extends StatelessWidget {
  final Period period;
  final bool enabled;

  const DeletePeriodIconButton({
    super.key,
    required this.period,
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
                content: DeletePeriodForm(period: period),
              );
            },
          );
        });
  }
}
