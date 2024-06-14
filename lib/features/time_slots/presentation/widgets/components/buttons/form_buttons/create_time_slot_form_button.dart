import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/common/components/buttons/primary_button.dart';
import 'package:pms_admin/common/extensions/async_value_ui.dart';
import 'package:pms_admin/common/providers/active_period_provider.dart';
import 'package:pms_admin/features/time_slots/data/dto/create_time_slot_dto.dart';
import 'package:pms_admin/features/time_slots/data/providers/time_slots_provider.dart';
import 'package:pms_admin/features/time_slots/presentation/controllers/create_time_slot_controller.dart';

class CreateTimeSlotFormButton extends ConsumerWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController labelController;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final bool isAcademic;

  const CreateTimeSlotFormButton({
    super.key,
    required this.formKey,
    required this.labelController,
    required this.startTime,
    required this.endTime,
    required this.isAcademic,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<void> state =
        ref.watch(addTimeSlotToPeriodControllerProvider);

    ref.listen<AsyncValue<void>>(addTimeSlotToPeriodControllerProvider,
        (prev, state) {
      state.showSnackbarOnError(context);
      state.popOnSuccess(
        prev,
        "Franja creada exitosamente",
        context,
      );
    });

    return PrimaryButton(
      isLoading: state.isLoading,
      enabled: !state.isLoading,
      onTap: () async {
        if (formKey.currentState!.validate()) {
          final dto = CreateTimeSlotDto(
            label: labelController.text,
            startTime: startTime,
            endTime: endTime,
            isAcademic: isAcademic,
          );

          final periodId = ref.watch(activePeriodProvider).id;

          await ref
              .read(addTimeSlotToPeriodControllerProvider.notifier)
              .addTimeSlotToPeriod(periodId, dto);

          ref.invalidate(paginatedTimeSlotsProvider);
        }
      },
      minWidth: 80,
      child: const Text(
        "Crear",
        style: TextStyle(
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
