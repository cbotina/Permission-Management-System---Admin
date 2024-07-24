import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/common/components/page_title.dart';
import 'package:pms_admin/common/components/scrollable_page.dart';
import 'package:pms_admin/common/components/search_bar.dart';
import 'package:pms_admin/features/absences/data/providers/period_absences_provider.dart';
import 'package:pms_admin/features/absences/presentation/widgets/components/absences_table.dart';

class AbsencesPage extends StatelessWidget {
  const AbsencesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollablePage(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const PageTitle(
              title: 'Lista de Faltas',
              iconData: Icons.calendar_month_rounded,
            ),
            const SizedBox(width: 30),
            Consumer(
              builder: (context, ref, child) {
                return IconButton(
                  onPressed: () {
                    ref.invalidate(absencesProvider);
                  },
                  icon: const Icon(Icons.refresh),
                );
              },
            ),
            const SizedBox(width: 30),
            const Expanded(child: CustomSearchBar()),
            // const SizedBox(width: 30),
            // const CreatePeriodButton(),
          ],
        ),
        const SizedBox(height: 25),
        const AbsencesTable(),
      ],
    );
  }
}
