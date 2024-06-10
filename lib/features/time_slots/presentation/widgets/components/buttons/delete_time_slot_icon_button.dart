import 'package:flutter/material.dart';
import 'package:pms_admin/common/components/icon_buttons/delete_icon_button.dart';
import 'package:pms_admin/features/time_slots/domain/models/time_slot.dart';

class DeleteTimeSlotIconButton extends StatelessWidget {
  final TimeSlot timeSlot;
  final bool enabled;

  const DeleteTimeSlotIconButton({
    super.key,
    required this.timeSlot,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return DeleteIconButton(
        enabled: enabled,
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog();
            },
          );
        });
  }
}
