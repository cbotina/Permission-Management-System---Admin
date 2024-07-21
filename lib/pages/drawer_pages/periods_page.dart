import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/common/components/page_title.dart';
import 'package:pms_admin/common/components/scrollable_page.dart';
import 'package:pms_admin/common/components/search_bar.dart';
import 'package:pms_admin/features/periods/data/providers/periods_provider.dart';
import 'package:pms_admin/features/periods/presentation/widgets/components/buttons/create_period_button.dart';
import 'package:pms_admin/features/periods/presentation/widgets/periods_table.dart';

class PeriodsPage extends StatelessWidget {
  const PeriodsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollablePage(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const PageTitle(
              title: 'Lista de Periodos',
              iconData: Icons.calendar_month_rounded,
            ),
            const SizedBox(width: 30),
            Consumer(
              builder: (context, ref, child) {
                return IconButton(
                  onPressed: () {
                    ref.invalidate(paginatedPeriodsProvider);
                  },
                  icon: const Icon(Icons.refresh),
                );
              },
            ),
            const SizedBox(width: 30),
            const Expanded(child: CustomSearchBar()),
            const SizedBox(width: 30),
            const CreatePeriodButton(),
          ],
        ),
        const SizedBox(height: 25),
        const PeriodsTable(),
      ],
    );
  }
}
