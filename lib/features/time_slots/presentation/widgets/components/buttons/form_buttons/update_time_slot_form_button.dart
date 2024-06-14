import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/common/components/buttons/primary_button.dart';
import 'package:pms_admin/common/extensions/async_value_ui.dart';
import 'package:pms_admin/features/time_slots/data/dto/update_time_slot_dto.dart';
import 'package:pms_admin/features/time_slots/data/providers/time_slots_provider.dart';
import 'package:pms_admin/features/time_slots/presentation/controllers/update_time_slot_controller.dart';

class UpdateTimeSlotFormButton extends ConsumerWidget {
  final GlobalKey<FormState> formKey;
  final int timeSlotId;
  final TextEditingController labelController;
  final TimeOfDay startTime;
  final TimeOfDay endTime;

  final bool isAcademic;

  const UpdateTimeSlotFormButton({
    super.key,
    required this.formKey,
    required this.timeSlotId,
    required this.labelController,
    required this.startTime,
    required this.endTime,
    required this.isAcademic,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<void> state = ref.watch(updateTimeSlotControllerProvider);

    ref.listen<AsyncValue<void>>(updateTimeSlotControllerProvider,
        (prev, state) {
      state.showSnackbarOnError(context);
      state.popOnSuccess(
        prev,
        "Franja actualizada exitosamente",
        context,
      );
    });

    return PrimaryButton(
      isLoading: state.isLoading,
      enabled: !state.isLoading,
      onTap: () async {
        if (formKey.currentState!.validate()) {
          final dto = UpdateTimeSlotDto(
            label: labelController.text,
            startTime: startTime,
            endTime: endTime,
            isAcademic: isAcademic,
          );

          await ref
              .read(updateTimeSlotControllerProvider.notifier)
              .updateTimeSlot(timeSlotId, dto);

          ref.invalidate(paginatedTimeSlotsProvider);
        }
      },
      minWidth: 80,
      child: const Text(
        "Aceptar",
        style: TextStyle(
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
