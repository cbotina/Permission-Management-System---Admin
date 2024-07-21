import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pms_admin/common/components/table/table.dart';
import 'package:pms_admin/common/components/table/table_cell.dart';
import 'package:pms_admin/common/components/table/table_label.dart';
import 'package:pms_admin/common/errors/error_widget.dart';
import 'package:pms_admin/features/permissions/data/providers/permission_absences_provider.dart';
import 'package:pms_admin/features/permissions/domain/models/permission_absence_view.dart';

class PermissionAbsencesTable extends ConsumerStatefulWidget {
  final int permissionId;
  const PermissionAbsencesTable({
    super.key,
    required this.permissionId,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PermissionAbsencesTableState();
}

class _PermissionAbsencesTableState
    extends ConsumerState<PermissionAbsencesTable> {
  int page = 1;

  @override
  Widget build(BuildContext context) {
    final timeSlots = ref.watch(
      permissionAbsencesProvider(widget.permissionId),
    );

    return timeSlots.when(
      data: (data) {
        return SizedBox(
          height: 150,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: TableWidget(
              colapsed: true,
              headerColor: Theme.of(context).colorScheme.primary,
              columns: timeSlotsColumns,
              rows: timeSlotsRows(data, context),
            ),
          ),
        );
      },
      error: (error, stackTrace) => ErrorWidgetUI(onRefresh: () {
        ref.invalidate(permissionAbsencesProvider);
      }),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}

List<DataColumn> timeSlotsColumns = [
  const DataColumn(label: TableLabel('Fecha')),
  const DataColumn(label: TableLabel('Horas')),
  const DataColumn(label: TableLabel('Materia')),
  const DataColumn(label: TableLabel('Comentario Docente')),
];

List<DataRow> timeSlotsRows(
    List<PermissionAbsenceView> absences, BuildContext context) {
  return absences
      .map((absence) => DataRow(
            cells: [
              tableCell(Text(DateFormat.yMMMMd().format(absence.absenceDate)),
                  MainAxisAlignment.center),
              tableCell(
                Text(
                    '${absence.startTime.format(context)} ${absence.endtime.format(context)}'),
                MainAxisAlignment.center,
              ),
              tableCell(
                Text(absence.subjectName),
                MainAxisAlignment.center,
              ),
              tableCell(
                Text(absence.teacherNote ?? ""),
                MainAxisAlignment.center,
              ),
            ],
          ))
      .toList();
}
