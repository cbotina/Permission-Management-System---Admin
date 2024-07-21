import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/common/components/page_title.dart';
import 'package:pms_admin/common/components/scrollable_page.dart';
import 'package:pms_admin/common/components/search_bar.dart';
import 'package:pms_admin/common/providers/active_period_provider.dart';
import 'package:pms_admin/features/permissions/data/providers/period_permissions_repository.dart';
import 'package:pms_admin/features/permissions/presentation/widgets/components/permissions_table.dart';

class PermissionRegistry extends StatelessWidget {
  const PermissionRegistry({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollablePage(
      children: [
        Row(
          children: [
            Consumer(builder: (context, ref, child) {
              final activePeriod = ref.watch(activePeriodProvider);
              return PageTitle(
                title: 'Registro de Permisos ${activePeriod.name}',
                iconData: Icons.timer_rounded,
              );
            }),
            const SizedBox(width: 30),
            Consumer(
              builder: (context, ref, child) {
                return IconButton(
                  onPressed: () {
                    ref.invalidate(periodPermissionsProvider);
                  },
                  icon: const Icon(Icons.refresh),
                );
              },
            ),
            const SizedBox(width: 30),
            const Expanded(child: CustomSearchBar()),
            const SizedBox(width: 30),
          ],
        ),
        const SizedBox(height: 25),
        const PermissionsTable()
      ],
    );
  }
}
