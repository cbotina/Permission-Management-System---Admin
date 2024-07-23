import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pms_admin/features/permissions/domain/models/day_time_slots.dart';
import 'package:pms_admin/features/permissions/presentation/widgets/components/create_leaving_permission/subject_group_time_slot_check_box.dart';

class DateRangeTimeSlotsWidget extends StatelessWidget {
  final List<DayTimeSlots> dayTimeSlots;

  const DateRangeTimeSlotsWidget({
    super.key,
    required this.dayTimeSlots,
  });

  @override
  Widget build(BuildContext context) {
    if (dayTimeSlots.isEmpty) {
      return const SizedBox();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "A continuación, marque las franjas horarias en las que se ausentará el estudiante",
          style: TextStyle(
            fontWeight: FontWeight.normal,
            color: Color.fromARGB(255, 87, 87, 87),
          ),
        ),
        const SizedBox(height: 20),
        Column(
          children: dayTimeSlots.map((e) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  DateFormat.yMMMMEEEEd().format(e.date).toUpperCase(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(height: 10),
                    ...e.subjectGroupTimeSlots.map((i) {
                      return SubjectGroupTimeSlotCheckBox(
                        date: e.date,
                        subjectGroupTimeSlot: i,
                      );
                    }),
                  ],
                ),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}
