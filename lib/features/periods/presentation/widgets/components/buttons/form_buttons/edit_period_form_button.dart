import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/common/components/buttons/primary_button.dart';
import 'package:pms_admin/common/extensions/async_value_ui.dart';
import 'package:pms_admin/common/extensions/string_to_date.dart';
import 'package:pms_admin/features/periods/data/dto/edit_period_dto.dart';
import 'package:pms_admin/features/periods/data/providers/periods_provider.dart';
import 'package:pms_admin/features/periods/presentation/controllers/edit_period_controller.dart';

class EditPeriodFormButton extends ConsumerWidget {
  final GlobalKey<FormState> formKey;
  final int periodId;
  final TextEditingController periodNameController;
  final TextEditingController startDateController;
  final TextEditingController endDateController;

  const EditPeriodFormButton({
    super.key,
    required this.formKey,
    required this.periodId,
    required this.periodNameController,
    required this.startDateController,
    required this.endDateController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<void> state = ref.watch(editPeriodControllerProvider);

    ref.listen<AsyncValue<void>>(editPeriodControllerProvider, (prev, state) {
      state.showSnackbarOnError(context);
      state.popOnSuccess(
        prev,
        "Periodo editado exitosamente",
        context,
      );
    });

    return PrimaryButton(
      isLoading: state.isLoading,
      enabled: !state.isLoading,
      onTap: () async {
        if (formKey.currentState!.validate()) {
          final dto = EditPeriodDto(
            name: periodNameController.text,
            startDate: startDateController.text.toDateTime()!,
            endDate: endDateController.text.toDateTime()!,
          );

          await ref
              .read(editPeriodControllerProvider.notifier)
              .updatePeriod(periodId, dto);

          ref.invalidate(paginatedPeriodsProvider);
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
