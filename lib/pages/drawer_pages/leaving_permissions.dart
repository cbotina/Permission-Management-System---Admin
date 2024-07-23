import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/common/components/page_title.dart';
import 'package:pms_admin/common/components/scrollable_page.dart';
import 'package:pms_admin/common/components/search_bar.dart';
import 'package:pms_admin/features/permissions/data/providers/period_permissions_repository.dart';
import 'package:pms_admin/features/permissions/presentation/widgets/components/buttons/create_leaving_permission_button.dart';
import 'package:pms_admin/features/permissions/presentation/widgets/components/leaving_permissions_table.dart';

class LeavingPermissionsPage extends StatelessWidget {
  const LeavingPermissionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollablePage(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const PageTitle(
              title: 'Permisos de salida',
              iconData: Icons.door_sliding_outlined,
            ),
            const SizedBox(width: 30),
            Consumer(
              builder: (context, ref, child) {
                return IconButton(
                  onPressed: () {
                    ref.invalidate(periodLeavingPermissionsProvider);
                  },
                  icon: const Icon(Icons.refresh),
                );
              },
            ),
            const SizedBox(width: 30),
            const Expanded(child: CustomSearchBar()),
            const SizedBox(width: 30),
            const CreateLeavingPermissionButton(),
          ],
        ),
        const SizedBox(height: 25),
        const LeavingPermissionsTable(),
      ],
    );
  }
}
