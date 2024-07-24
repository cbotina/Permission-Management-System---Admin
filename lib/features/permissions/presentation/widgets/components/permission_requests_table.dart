import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pms_admin/common/components/pagination_widget.dart';
import 'package:pms_admin/common/components/table/table.dart';
import 'package:pms_admin/common/components/table/table_cell.dart';
import 'package:pms_admin/common/components/table/table_label.dart';
import 'package:pms_admin/common/errors/error_widget.dart';
import 'package:pms_admin/features/permissions/data/providers/period_permissions_repository.dart';
import 'package:pms_admin/features/permissions/domain/models/permission_with_student_view.dart';
import 'package:pms_admin/features/permissions/presentation/widgets/components/buttons/approve_or_reject_permission_icon_button.dart';
import 'package:pms_admin/features/permissions/presentation/widgets/components/permission_action_buttons.dart';
import 'package:pms_admin/features/permissions/presentation/widgets/components/permission_status_widget.dart';

class PermissionRequestsTable extends ConsumerStatefulWidget {
  const PermissionRequestsTable({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PermissionRequestsTableState();
}

class _PermissionRequestsTableState
    extends ConsumerState<PermissionRequestsTable> {
  int page = 1;

  @override
  Widget build(BuildContext context) {
    final permissions = ref.watch(periodPermissionRequestsProvider(page));

    return permissions.when(
      data: (data) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 45 * 11,
              color: Theme.of(context).colorScheme.surfaceBright,
              child: TableWidget(
                headerColor: Theme.of(context).colorScheme.primary,
                columns: periodsColumns,
                rows: getPeriodsRows(data.items),
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
        log(error.toString());
        ref.invalidate(periodPermissionRequestsProvider);
      }),
      loading: () => const Center(child: CircularProgressIndicator()),
      skipLoadingOnRefresh: false,
    );
  }
}

List<DataColumn> periodsColumns = [
  const DataColumn(label: TableLabel('Fecha Solicitud')),
  const DataColumn(label: TableLabel('Estudiante')),
  const DataColumn(label: TableLabel('Motivo')),
  const DataColumn(label: TableLabel('Estado')),
  const DataColumn(label: TableLabel('Acciones')),
];

List<DataRow> getPeriodsRows(List<PermissionWithStudentView> permissions) {
  return permissions
      .map((permission) => DataRow(
            cells: [
              tableCell(
                  Text(DateFormat.yMMMMd().format(permission.requestDate)),
                  MainAxisAlignment.center),
              tableCell(
                Text(permission.student),
                MainAxisAlignment.center,
              ),
              tableCell(
                Text(permission.reason),
                MainAxisAlignment.center,
              ),
              tableCell(
                PermissionStatusWidget(status: permission.status),
                MainAxisAlignment.center,
              ),
              tableCell(
                ApproveOrRejectPermissionIconButton(
                    permissionId: permission.permissionId),
                MainAxisAlignment.center,
              ),
            ],
          ))
      .toList();
}
