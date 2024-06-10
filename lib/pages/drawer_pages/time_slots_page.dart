import 'package:flutter/material.dart';
import 'package:pms_admin/common/components/form_fields/search_bar.dart';
import 'package:pms_admin/common/components/page_title.dart';
import 'package:pms_admin/common/components/scrollable_page.dart';
import 'package:pms_admin/features/time_slots/presentation/widgets/components/buttons/create_time_slot_button.dart';
import 'package:pms_admin/features/time_slots/presentation/widgets/time_slots_table.dart';

class TimeSlots extends StatelessWidget {
  const TimeSlots({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScrollablePage(
      children: [
        Row(
          children: [
            PageTitle(
              title: 'Franjas Horarias 2024-A',
              iconData: Icons.timer_rounded,
            ),
            SizedBox(width: 30),
            Expanded(child: OutlinedSearchBar(label: "Buscar")),
            SizedBox(width: 30),
            CreateTimeSlotButton(),
          ],
        ),
        SizedBox(height: 25),
        TimeSlotsTable()
      ],
    );
  }
}
