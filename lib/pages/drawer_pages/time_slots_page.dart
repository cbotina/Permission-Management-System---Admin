import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/common/components/page_title.dart';
import 'package:pms_admin/common/components/scrollable_page.dart';
import 'package:pms_admin/common/components/search_bar.dart';
import 'package:pms_admin/common/providers/active_period_provider.dart';
import 'package:pms_admin/features/time_slots/data/providers/time_slots_provider.dart';
import 'package:pms_admin/features/time_slots/presentation/widgets/components/buttons/create_time_slot_button.dart';
import 'package:pms_admin/features/time_slots/presentation/widgets/time_slots_table.dart';

class TimeSlots extends StatelessWidget {
  const TimeSlots({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollablePage(
      children: [
        Row(
          children: [
            Consumer(builder: (context, ref, child) {
              final activePeriod = ref.watch(activePeriodProvider);
              return PageTitle(
                title: 'Franjas Horarias ${activePeriod.name}',
                iconData: Icons.timer_rounded,
              );
            }),
            const SizedBox(width: 30),
            Consumer(
              builder: (context, ref, child) {
                return IconButton(
                  onPressed: () {
                    ref.invalidate(paginatedTimeSlotsProvider);
                  },
                  icon: const Icon(Icons.refresh),
                );
              },
            ),
            const SizedBox(width: 30),
            const Expanded(child: CustomSearchBar()),
            const SizedBox(width: 30),
            const CreateTimeSlotButton(),
          ],
        ),
        const SizedBox(height: 25),
        const TimeSlotsTable()
      ],
    );
  }
}
