import 'package:flutter/material.dart';
import 'package:pms_admin/features/periods/domain/models/period.dart';
import 'package:pms_admin/features/periods/presentation/widgets/components/buttons/delete_period_icon_button.dart';
import 'package:pms_admin/features/periods/presentation/widgets/components/buttons/edit_period_icon_button.dart';

class PeriodActionButtons extends StatelessWidget {
  final Period period;
  const PeriodActionButtons({
    super.key,
    required this.period,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        EditPeriodIconButton(period: period),
        const SizedBox(width: 10),
        DeletePeriodIconButton(period: period)
      ],
    );
  }
}
