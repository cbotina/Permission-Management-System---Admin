import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/features/permissions/data/providers/selected_absence_time_slots_provider.dart';
import 'package:pms_admin/features/permissions/domain/models/selectable_absence_time_slot.dart';
import 'package:pms_admin/features/permissions/domain/models/student_schedule_view.dart';

class SubjectGroupTimeSlotCheckBox extends StatefulWidget {
  final StudentScheduleView subjectGroupTimeSlot;
  final DateTime date;
  const SubjectGroupTimeSlotCheckBox({
    super.key,
    required this.subjectGroupTimeSlot,
    required this.date,
  });

  @override
  State<SubjectGroupTimeSlotCheckBox> createState() =>
      _SubjectGroupTimeSlotCheckBoxState();
}

class _SubjectGroupTimeSlotCheckBoxState
    extends State<SubjectGroupTimeSlotCheckBox> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 15),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 213, 232, 240),
                borderRadius: BorderRadius.circular(5),
              ),
              width: 130,
              child: Text(
                '${widget.subjectGroupTimeSlot.startTime.format(context).padLeft(8, '0').substring(0, 5)} -  ${widget.subjectGroupTimeSlot.endTime.format(context).padLeft(8, '0')}',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                widget.subjectGroupTimeSlot.subjectName,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            Consumer(
              builder: (context, ref, child) {
                return Checkbox(
                  value: isSelected,
                  activeColor: Theme.of(context).colorScheme.primary,
                  onChanged: (value) {
                    setState(() {
                      isSelected = value ?? false;
                    });
                    final absenceTimeSlot = SelectableAbsenceTimeSlot(
                      date: widget.date,
                      subjectGroupTimeSlotId:
                          widget.subjectGroupTimeSlot.subjectGroupTimeSlotId,
                    );

                    if (value == false) {
                      ref
                          .read(selectedAbsenceTimeSlotsProvider.notifier)
                          .remove(absenceTimeSlot);
                    } else {
                      ref
                          .read(selectedAbsenceTimeSlotsProvider.notifier)
                          .add(absenceTimeSlot);
                    }
                  },
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
