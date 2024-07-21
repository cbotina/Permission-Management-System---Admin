import 'package:flutter/material.dart';

class TableWidget extends StatelessWidget {
  const TableWidget({
    super.key,
    required this.columns,
    required this.rows,
    this.headerColor,
    this.colapsed = false,
  });
  final List<DataColumn> columns;
  final List<DataRow> rows;
  final Color? headerColor;
  final bool colapsed;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DataTable(
        dataRowMaxHeight: colapsed ? 30 : 45,
        dataRowMinHeight: 15,
        headingRowHeight: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: headerColor ?? Colors.grey.shade200,
        ),
        border: TableBorder(
          horizontalInside: BorderSide(color: Colors.grey.shade300, width: .3),
          bottom: BorderSide(color: Colors.grey.shade300, width: 1.2),
        ),
        dividerThickness: .1,
        dataRowColor: WidgetStatePropertyAll(
          Theme.of(context).colorScheme.surfaceBright,
        ),
        columns: columns,
        rows: rows,
      ),
    );
  }
}
