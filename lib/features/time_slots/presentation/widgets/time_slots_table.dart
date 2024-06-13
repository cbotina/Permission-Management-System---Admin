import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/common/components/pagination_widget.dart';
import 'package:pms_admin/common/components/table/table.dart';
import 'package:pms_admin/common/components/table/table_cell.dart';
import 'package:pms_admin/common/components/table/table_label.dart';
import 'package:pms_admin/features/time_slots/data/providers/time_slots_provider.dart';
import 'package:pms_admin/features/time_slots/domain/models/time_slot.dart';
import 'package:pms_admin/features/time_slots/presentation/widgets/components/time_slot_type.dart';
import 'package:pms_admin/features/time_slots/presentation/widgets/time_slot_action_buttons.dart';

class TimeSlotsTable extends ConsumerStatefulWidget {
  const TimeSlotsTable({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PeriodsPageState();
}

class _PeriodsPageState extends ConsumerState<TimeSlotsTable> {
  @override
  Widget build(BuildContext context) {
    final timeSlots = ref.watch(timeSlotsProvider);

    return timeSlots.when(
      data: (data) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 45 * 11,
              child: TableWidget(
                headerColor: Theme.of(context).colorScheme.primary,
                columns: periodsColumns,
                rows: getPeriodsRows(data, context),
              ),
            ),
            PaginationWidget(
              totalPages: 3,
              currentPage: 1,
              onBack: () {},
              onForward: () {},
            ),
          ],
        );
      },
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const CircularProgressIndicator(),
    );
  }
}

List<DataColumn> periodsColumns = [
  const DataColumn(label: TableLabel('Etiqueta')),
  const DataColumn(label: TableLabel('Hora Inicio')),
  const DataColumn(label: TableLabel('Hora Fin')),
  const DataColumn(label: TableLabel('Tipo')),
  const DataColumn(label: TableLabel('Acciones')),
];

List<DataRow> getPeriodsRows(List<TimeSlot> timeSlots, BuildContext context) {
  return timeSlots
      .map((timeSlot) => DataRow(
            cells: [
              tableCell(Text(timeSlot.tag), MainAxisAlignment.center),
              tableCell(
                Text(timeSlot.startTime.format(context)),
                MainAxisAlignment.center,
              ),
              tableCell(
                Text(timeSlot.endTime.format(context)),
                MainAxisAlignment.center,
              ),
              tableCell(
                TimeSlotType(isAcademic: timeSlot.isAcademic),
                MainAxisAlignment.center,
              ),
              tableCell(
                TimeSlotActionButtons(timeSlot: timeSlot),
                MainAxisAlignment.center,
              ),
            ],
          ))
      .toList();
}
