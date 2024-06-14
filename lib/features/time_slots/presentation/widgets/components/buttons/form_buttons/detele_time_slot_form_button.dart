import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/common/components/buttons/primary_button.dart';
import 'package:pms_admin/common/extensions/async_value_ui.dart';
import 'package:pms_admin/features/time_slots/data/providers/time_slots_provider.dart';
import 'package:pms_admin/features/time_slots/presentation/controllers/delete_time_slot_controller.dart';

class DeleteTimeSlotFormButton extends ConsumerWidget {
  final int timeSlotId;

  const DeleteTimeSlotFormButton({
    super.key,
    required this.timeSlotId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<void> state = ref.watch(deleteTimeSlotControllerProvider);

    ref.listen<AsyncValue<void>>(deleteTimeSlotControllerProvider,
        (prev, state) {
      state.showSnackbarOnError(context);
      state.popOnSuccess(
        prev,
        "Franja eliminada exitosamente",
        context,
      );
    });

    return PrimaryButton(
      isLoading: state.isLoading,
      enabled: !state.isLoading,
      onTap: () async {
        await ref
            .read(deleteTimeSlotControllerProvider.notifier)
            .delteTimeSlot(timeSlotId);

        ref.invalidate(paginatedTimeSlotsProvider);
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
