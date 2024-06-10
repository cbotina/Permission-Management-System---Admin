import 'package:flutter/material.dart';
import 'package:pms_admin/features/time_slots/domain/models/time_slot.dart';
import 'package:pms_admin/features/time_slots/presentation/widgets/components/buttons/delete_time_slot_icon_button.dart';
import 'package:pms_admin/features/time_slots/presentation/widgets/components/buttons/edit_time_slot_icon_button.dart';

class TimeSlotActionButtons extends StatelessWidget {
  final TimeSlot timeSlot;
  const TimeSlotActionButtons({
    super.key,
    required this.timeSlot,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        EditTimeSlotIconButton(timeSlot: timeSlot),
        const SizedBox(width: 10),
        DeleteTimeSlotIconButton(timeSlot: timeSlot)
      ],
    );
  }
}
