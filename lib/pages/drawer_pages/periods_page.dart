import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/common/components/form_fields/search_bar.dart';
import 'package:pms_admin/common/components/page_title.dart';
import 'package:pms_admin/common/components/scrollable_page.dart';
import 'package:pms_admin/features/periods/presentation/widgets/components/buttons/create_period_button.dart';
import 'package:pms_admin/features/periods/presentation/widgets/periods_table.dart';
import 'package:pms_admin/features/search/search_query_provider.dart';

class PeriodsPage extends StatelessWidget {
  const PeriodsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScrollablePage(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PageTitle(
              title: 'Lista de Periodos',
              iconData: Icons.calendar_month_rounded,
            ),
            SizedBox(width: 30),
            Expanded(child: PeriodsSearchBar()),
            SizedBox(width: 30),
            CreatePeriodButton(),
          ],
        ),
        SizedBox(height: 25),
        PeriodsTable(),
      ],
    );
  }
}

class PeriodsSearchBar extends ConsumerStatefulWidget {
  const PeriodsSearchBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeriodsSearchBar2State();
}

class _PeriodsSearchBar2State extends ConsumerState<PeriodsSearchBar> {
  late TextEditingController _searchController;

  @override
  void initState() {
    _searchController = TextEditingController();

    _searchController.addListener(() {
      ref.read(searchQueryController.notifier).setQuery(_searchController.text);
    });

    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedSearchBar(
      label: "Buscar",
      controller: _searchController,
    );
  }
}
