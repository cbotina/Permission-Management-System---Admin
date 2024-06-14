import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/common/components/buttons/primary_button.dart';
import 'package:pms_admin/common/extensions/async_value_ui.dart';
import 'package:pms_admin/features/periods/data/providers/periods_provider.dart';
import 'package:pms_admin/features/periods/presentation/controllers/delete_period_controller.dart';

class DeletePeriodFormButton extends ConsumerWidget {
  final GlobalKey<FormState> formKey;
  final bool confirmed;
  final int periodId;

  const DeletePeriodFormButton({
    super.key,
    required this.formKey,
    required this.confirmed,
    required this.periodId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<void> state = ref.watch(deletePeriodControllerProvider);

    ref.listen<AsyncValue<void>>(deletePeriodControllerProvider, (prev, state) {
      state.showSnackbarOnError(context);
      state.popOnSuccess(
        prev,
        "Periodo eliminado exitosamente",
        context,
      );
    });

    return PrimaryButton(
      isLoading: state.isLoading,
      enabled: !state.isLoading && confirmed,
      onTap: () async {
        if (formKey.currentState!.validate()) {
          await ref
              .read(deletePeriodControllerProvider.notifier)
              .deletePeriod(periodId);

          ref.invalidate(paginatedPeriodsProvider);
        }
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
