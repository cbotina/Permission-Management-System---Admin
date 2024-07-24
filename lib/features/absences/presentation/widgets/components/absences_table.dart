import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pms_admin/common/components/pagination_widget.dart';
import 'package:pms_admin/common/components/table/table.dart';
import 'package:pms_admin/common/components/table/table_cell.dart';
import 'package:pms_admin/common/components/table/table_label.dart';
import 'package:pms_admin/common/errors/error_widget.dart';
import 'package:pms_admin/features/absences/data/providers/period_absences_provider.dart';
import 'package:pms_admin/features/absences/domain/models/absence_with_student_view.dart';
import 'package:pms_admin/features/absences/presentation/widgets/components/absence_action_buttons.dart';
import 'package:pms_admin/features/periods/data/providers/periods_provider.dart';
import 'package:pms_admin/features/periods/domain/models/period.dart';
import 'package:pms_admin/features/periods/presentation/widgets/period_action_buttons.dart';
import 'package:pms_admin/features/permissions/presentation/widgets/components/permission_status_widget.dart';

class AbsencesTable extends ConsumerStatefulWidget {
  const AbsencesTable({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AbsencesPageState();
}

class _AbsencesPageState extends ConsumerState<AbsencesTable> {
  int page = 1;

  @override
  Widget build(BuildContext context) {
    final absences = ref.watch(absencesProvider(page));

    return absences.when(
      data: (data) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 45 * 11,
              color: Theme.of(context).colorScheme.surfaceBright,
              child: TableWidget(
                headerColor: Theme.of(context).colorScheme.primary,
                columns: absenceColumns,
                rows: getAbsenceRows(data.items, context),
              ),
            ),
            PaginationWidget(
              totalPages: data.meta.totalPages,
              currentPage: data.meta.currentPage,
              onForward: () {
                setState(() {
                  page = page + 1;
                });
              },
              onBack: () {
                setState(() {
                  page = page - 1;
                });
              },
            ),
          ],
        );
      },
      error: (error, stackTrace) => ErrorWidgetUI(onRefresh: () {
        ref.invalidate(absencesProvider);
      }),
      loading: () => const Center(child: CircularProgressIndicator()),
      skipLoadingOnRefresh: false,
    );
  }
}

List<DataColumn> absenceColumns = [
  const DataColumn(label: TableLabel('Fecha')),
  const DataColumn(label: TableLabel('Estudiante')),
  const DataColumn(label: TableLabel('Horas')),
  const DataColumn(label: TableLabel('Permiso')),
  const DataColumn(label: TableLabel('Acciones')),
];

List<DataRow> getAbsenceRows(
    List<AbsenceWithStudentView> absences, BuildContext context) {
  return absences
      .map((e) => DataRow(
            cells: [
              tableCell(
                  Text(DateFormat.yMMMMd().format(e.absenceDate).toUpperCase()),
                  MainAxisAlignment.center),
              tableCell(
                Text(e.student),
                MainAxisAlignment.center,
              ),
              tableCell(
                Text(
                  '${e.startTime.format(context).padLeft(8, '0')} - ${e.endTime.format(context).padLeft(8, '0')}',
                ),
                MainAxisAlignment.center,
              ),
              tableCell(
                e.permissionStatus != null
                    ? PermissionStatusWidget(status: e.permissionStatus!)
                    : const Text("N/A"),
                MainAxisAlignment.center,
              ),
              tableCell(
                AbsenceActionButtons(
                  absence: e,
                ),
                MainAxisAlignment.center,
              ),
            ],
          ))
      .toList();
}
