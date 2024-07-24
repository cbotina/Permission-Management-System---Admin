import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/common/components/buttons/primary_button.dart';
import 'package:pms_admin/common/extensions/async_value_ui.dart';
import 'package:pms_admin/common/extensions/string_to_date.dart';
import 'package:pms_admin/features/permissions/data/dto/create_leaving_permission_dto.dart';
import 'package:pms_admin/features/permissions/data/providers/selected_absence_time_slots_provider.dart';
import 'package:pms_admin/features/permissions/presentation/controllers/create_leaving_permission_controller.dart';

class CreateLeavingPermissionFormButton extends ConsumerWidget {
  const CreateLeavingPermissionFormButton({
    super.key,
    required this.studentId,
    this.enabled = true,
    required this.selectedReason,
    required this.otherReasonController,
    required this.justificationDeadlineController,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;
  final bool enabled;
  final int? studentId;
  final String? selectedReason;
  final TextEditingController otherReasonController;
  final TextEditingController justificationDeadlineController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<void> state =
        ref.watch(createLeavingPermissionControllerProvider);

    ref.listen<AsyncValue<void>>(createLeavingPermissionControllerProvider,
        (prev, state) {
      state.showSnackbarOnError(context);
      state.popOnSuccess(
        prev,
        "Permiso creado exitosamente",
        context,
      );
    });
    return PrimaryButton(
      enabled: enabled,
      isLoading: state.isLoading,
      minWidth: 150,
      child: const Text(
        "Crear",
        style: TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
      ),
      onTap: () {
        if (formKey.currentState!.validate()) {
          final absenceTimeSlots =
              ref.watch(selectedAbsenceTimeSlotsProvider).absenceTimeSlots;

          final reason = selectedReason == 'Otro'
              ? otherReasonController.text
              : selectedReason!;

          final dto = CreateLeavingPermissionDto(
            reason: reason,
            justificationDeadline:
                justificationDeadlineController.text.toDateTime()!,
            absenceTimeSlots: absenceTimeSlots
                .map((e) => AbsenceTimeSlot.fromSelectableAbsenceTimeSlot(e))
                .toList(),
          );

          ref
              .read(createLeavingPermissionControllerProvider.notifier)
              .createLeavingPermission(studentId!, dto);
        }
      },
    );
  }
}
