import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pms_admin/common/components/pagination_widget.dart';
import 'package:pms_admin/common/components/table/table.dart';
import 'package:pms_admin/common/components/table/table_cell.dart';
import 'package:pms_admin/common/components/table/table_label.dart';
import 'package:pms_admin/features/periods/data/providers/periods_provider.dart';
import 'package:pms_admin/features/periods/domain/models/period.dart';
import 'package:pms_admin/features/periods/presentation/widgets/period_action_buttons.dart';

class PeriodsTable extends ConsumerStatefulWidget {
  const PeriodsTable({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PeriodsPageState();
}

class _PeriodsPageState extends ConsumerState<PeriodsTable> {
  int page = 1;

  @override
  Widget build(BuildContext context) {
    final periods = ref.watch(paginatedPeriodsProvider(page));

    return periods.when(
      data: (data) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 45 * 11,
              color: Colors.white,
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
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const CircularProgressIndicator(),
    );
  }
}

List<DataColumn> periodsColumns = [
  const DataColumn(label: TableLabel('Nombre')),
  const DataColumn(label: TableLabel('Inicio')),
  const DataColumn(label: TableLabel('Fin')),
  const DataColumn(label: TableLabel('Acciones')),
];

List<DataRow> getPeriodsRows(List<Period> periods) {
  return periods
      .map((period) => DataRow(
            cells: [
              tableCell(Text(period.name), MainAxisAlignment.center),
              tableCell(
                Text(
                  DateFormat.yMMMMd().format(period.startDate).toUpperCase(),
                ),
                MainAxisAlignment.center,
              ),
              tableCell(
                Text(DateFormat.yMMMMd().format(period.endDate).toUpperCase()),
                MainAxisAlignment.center,
              ),
              tableCell(
                PeriodActionButtons(period: period),
                MainAxisAlignment.center,
              ),
            ],
          ))
      .toList();
}
