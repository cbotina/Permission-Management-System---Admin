import 'package:flutter/material.dart';
import 'package:pms_admin/common/components/icon_buttons/edit_icon_button.dart';
import 'package:pms_admin/features/time_slots/domain/models/time_slot.dart';
import 'package:pms_admin/features/time_slots/presentation/widgets/components/forms/edit_time_slot_form.dart';

class EditTimeSlotIconButton extends StatelessWidget {
  final TimeSlot timeSlot;
  final bool enabled;

  const EditTimeSlotIconButton({
    super.key,
    required this.timeSlot,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return EditIconButton(
      enabled: enabled,
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: EditTimeSlotForm(
                timeSlot: timeSlot,
                startTimeText: timeSlot.startTime.format(context),
                endTimeText: timeSlot.endTime.format(context),
                isRestTime: !timeSlot.isAcademic,
              ),
            );
          },
        );
      },
    );
  }
}
