import 'package:pms_admin/features/time_slots/domain/models/time_slot.dart';

abstract class ITimeSlotsRepository {
  Future<List<TimeSlot>> getAll();
}
