import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/common/components/buttons/secondary_button.dart';
import 'package:pms_admin/features/permissions/data/providers/selected_absence_time_slots_provider.dart';

class SelectTimeSlotsButton extends ConsumerWidget {
  final bool enabled;
  final void Function(DateTimeRange newTimeRange) setRange;
  const SelectTimeSlotsButton({
    super.key,
    required this.setRange,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context, ref) {
    return SecondaryButton(
      minWidth: 150,
      onTap: enabled
          ? () async {
              ref.read(selectedAbsenceTimeSlotsProvider.notifier).reset();
              final DateTimeRange? dateTimeRange = await showDateRangePicker(
                context: context,
                firstDate: DateTime.now(),
                lastDate:
                    DateTime(2024, 12, 30), // todo: active period end time
                locale: const Locale('es', "ES"),
                initialEntryMode: DatePickerEntryMode.calendarOnly,
              );
              if (dateTimeRange != null) {
                ref.invalidate(selectedAbsenceTimeSlotsProvider);
                setRange(dateTimeRange);
              }
            }
          : null,
      child: Row(
        children: [
          Icon(
            Icons.calendar_month_outlined,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(width: 10),
          Text(
            "Seleccionar Fechas",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
