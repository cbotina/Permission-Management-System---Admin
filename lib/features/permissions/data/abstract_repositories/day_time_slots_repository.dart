import 'package:pms_admin/features/permissions/data/dto/schedule_range_dates_dto.dart';
import 'package:pms_admin/features/permissions/domain/models/day_time_slots.dart';

abstract class IDayTimeSlotsRepository {
  Future<List<DayTimeSlots>> getRangeTimeSlots(
    int periodId,
    int studentId,
    ScheduleRangeDatesDto dto,
  );
}
