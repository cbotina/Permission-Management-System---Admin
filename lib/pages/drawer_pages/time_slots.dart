import 'package:flutter/material.dart';
import 'package:pms_admin/common/components/page_title.dart';
import 'package:pms_admin/common/components/scrollable_page.dart';

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
            )
          ],
        ),
      ],
    );
  }
}
