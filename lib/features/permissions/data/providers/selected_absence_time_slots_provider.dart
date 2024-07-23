import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/features/permissions/domain/models/selectable_absence_time_slot.dart';

class SelectedAbsenceTimeSlotsProvider extends ChangeNotifier {
  List<SelectableAbsenceTimeSlot> absenceTimeSlots = [];

  void add(SelectableAbsenceTimeSlot absenceTimeSlot) {
    absenceTimeSlots.insert(0, absenceTimeSlot);
    notifyListeners();
  }

  void remove(SelectableAbsenceTimeSlot absenceTimeSlot) {
    absenceTimeSlots.remove(absenceTimeSlot);

    notifyListeners();
  }

  void reset() {
    absenceTimeSlots = [];
    notifyListeners();
  }
}

final selectedAbsenceTimeSlotsProvider =
    ChangeNotifierProvider<SelectedAbsenceTimeSlotsProvider>((ref) {
  return SelectedAbsenceTimeSlotsProvider();
});
