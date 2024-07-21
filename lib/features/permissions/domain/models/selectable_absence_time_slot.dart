import 'package:freezed_annotation/freezed_annotation.dart';

part 'selectable_absence_time_slot.freezed.dart';

@freezed
class SelectableAbsenceTimeSlot with _$SelectableAbsenceTimeSlot {
  const factory SelectableAbsenceTimeSlot({
    required DateTime date,
    required int subjectGroupTimeSlotId,
  }) = _SelectableAbsenceTimeSlot;
}
