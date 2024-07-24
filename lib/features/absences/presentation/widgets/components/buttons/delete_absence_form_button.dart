import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/common/components/buttons/primary_button.dart';
import 'package:pms_admin/common/extensions/async_value_ui.dart';
import 'package:pms_admin/features/absences/data/presentation/controllers/delete_absence_controller.dart';
import 'package:pms_admin/features/absences/data/providers/period_absences_provider.dart';
import 'package:pms_admin/features/time_slots/data/providers/time_slots_provider.dart';
import 'package:pms_admin/features/time_slots/presentation/controllers/delete_time_slot_controller.dart';

class DeleteAbsenceFormButton extends ConsumerWidget {
  final int absenceId;

  const DeleteAbsenceFormButton({
    super.key,
    required this.absenceId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<void> state = ref.watch(deleteAbsenceControllerProvider);

    ref.listen<AsyncValue<void>>(deleteAbsenceControllerProvider,
        (prev, state) {
      state.showSnackbarOnError(context);
      state.popOnSuccess(
        prev,
        "Falta eliminada exitosamente",
        context,
      );
    });

    return PrimaryButton(
      isLoading: state.isLoading,
      enabled: !state.isLoading,
      onTap: () async {
        await ref
            .read(deleteAbsenceControllerProvider.notifier)
            .deleteAbsence(absenceId);

        ref.invalidate(absencesProvider);
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
