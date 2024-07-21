import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/common/components/buttons/primary_button.dart';
import 'package:pms_admin/common/components/form_fields/dropdown_button_form_field.dart';
import 'package:pms_admin/common/errors/error_widget.dart';
import 'package:pms_admin/common/providers/active_period_provider.dart';
import 'package:pms_admin/features/periods/data/providers/periods_provider.dart';
import 'package:pms_admin/features/periods/domain/models/period.dart';
import 'package:pms_admin/features/periods/presentation/widgets/components/validators/change_period_validator.dart';

class ChangeActivePeriodForm extends ConsumerStatefulWidget {
  const ChangeActivePeriodForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChangeActivePeriodForState();
}

class _ChangeActivePeriodForState
    extends ConsumerState<ChangeActivePeriodForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Period? selectedPeriod;

  @override
  Widget build(BuildContext context) {
    final periods = ref.watch(paginatedPeriodsProvider(1));

    return periods.when(
      data: (data) {
        return Form(
          key: _formKey,
          child: Container(
            width: 300,
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Seleccionar Periodo",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 30),
                EnumDropdownButtonFormField(
                  label: 'Periodo',
                  onSelected: (period) {
                    setState(() {
                      selectedPeriod = period;
                    });
                  },
                  values: data.items,
                  validator: changePeriodValidator,
                ),
                const SizedBox(height: 30),
                PrimaryButton(
                  child: const Text(
                    "Aceptar",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      ref
                          .read(activePeriodProvider.notifier)
                          .setPeriod(selectedPeriod!);

                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          ),
        );
      },
      error: (error, stackTrace) => ErrorWidgetUI(onRefresh: () {
        ref.invalidate(paginatedPeriodsProvider);
      }),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
