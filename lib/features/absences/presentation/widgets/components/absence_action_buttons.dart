import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/features/absences/domain/models/absence_with_student_view.dart';
import 'package:pms_admin/features/absences/presentation/widgets/components/buttons/delete_absence_icon_button.dart';
import 'package:pms_admin/features/absences/presentation/widgets/components/buttons/view_absence_icon_button.dart';
import 'package:pms_admin/features/auth/data/providers/role_provider.dart';
import 'package:pms_admin/features/auth/domain/enums/user_role.dart';
import 'package:pms_admin/features/periods/domain/models/period.dart';
import 'package:pms_admin/features/periods/presentation/widgets/components/buttons/delete_period_icon_button.dart';
import 'package:pms_admin/features/periods/presentation/widgets/components/buttons/edit_period_icon_button.dart';

class AbsenceActionButtons extends ConsumerWidget {
  final AbsenceWithStudentView absence;
  const AbsenceActionButtons({
    super.key,
    required this.absence,
  });

  @override
  Widget build(BuildContext context, ref) {
    return Row(
      children: [
        ViewAbsenceIconButton(
          absence: absence,
        ),
        const SizedBox(width: 10),
        Visibility(
          visible: ref.watch(roleProvider) == UserRole.admin,
          child: DeleteAbsenceIconButton(absenceId: absence.absenceId),
        )
      ],
    );
  }
}
