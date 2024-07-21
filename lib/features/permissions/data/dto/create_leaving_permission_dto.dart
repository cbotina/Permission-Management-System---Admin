import 'dart:collection';
import 'package:pms_admin/features/permissions/domain/models/selectable_absence_time_slot.dart';

class CreateLeavingPermissionDto extends MapView<String, dynamic> {
  final String reason;
  final DateTime justificationDeadline;
  final List<AbsenceTimeSlot> absenceTimeSlots;

  CreateLeavingPermissionDto({
    required this.reason,
    required this.justificationDeadline,
    required this.absenceTimeSlots,
  }) : super({
          "reason": reason,
          "justificationDeadline": justificationDeadline.toString(),
          "absenceTimeSlots": absenceTimeSlots,
        });
}

class AbsenceTimeSlot extends MapView<String, dynamic> {
  final int subjectGroupTimeSlotId;
  final DateTime absenceDate;

  AbsenceTimeSlot({
    required this.subjectGroupTimeSlotId,
    required this.absenceDate,
  }) : super({
          "subjectGroupTimeSlotId": subjectGroupTimeSlotId,
          "absenceDate": absenceDate.toString(),
        });

  factory AbsenceTimeSlot.fromSelectableAbsenceTimeSlot(
      SelectableAbsenceTimeSlot selectable) {
    return AbsenceTimeSlot(
      subjectGroupTimeSlotId: selectable.subjectGroupTimeSlotId,
      absenceDate: selectable.date,
    );
  }
}
