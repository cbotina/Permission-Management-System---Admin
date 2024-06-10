import 'package:flutter/material.dart';
import 'package:pms_admin/common/components/form_fields/search_bar.dart';
import 'package:pms_admin/common/components/page_title.dart';
import 'package:pms_admin/common/components/scrollable_page.dart';
import 'package:pms_admin/features/periods/presentation/widgets/create_period_button.dart';
import 'package:pms_admin/features/periods/presentation/widgets/periods_table.dart';

class PeriodsPage extends StatelessWidget {
  const PeriodsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScrollablePage(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PageTitle(
            title: 'Lista de Periodos',
            iconData: Icons.calendar_month_rounded,
          ),
          SizedBox(width: 30),
          Expanded(child: OutlinedSearchBar(label: "Buscar")),
          SizedBox(width: 30),
          CreatePeriodButton(),
        ],
      ),
      SizedBox(height: 25),
      PeriodsTable(),
    ]);
  }
}
