import 'package:pms_admin/features/time_slots/data/dto/create_time_slot_dto.dart';

class UpdateTimeSlotDto extends CreateTimeSlotDto {
  UpdateTimeSlotDto({
    required super.label,
    required super.startTime,
    required super.endTime,
    required super.isAcademic,
  });
}
