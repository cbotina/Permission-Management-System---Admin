import 'package:pms_admin/common/models/paginated_response.dart';
import 'package:pms_admin/features/time_slots/data/dto/create_time_slot_dto.dart';
import 'package:pms_admin/features/time_slots/data/dto/update_time_slot_dto.dart';
import 'package:pms_admin/features/time_slots/domain/models/time_slot.dart';

abstract class ITimeSlotsRepository {
  Future<PaginatedResponse<TimeSlot>> getPaginatedTimeSlots(
    int periodId,
    int page,
    String searchQuery,
  );

  Future<void> addTimeSlotToPeriod(int periodId, CreateTimeSlotDto dto);

  Future<void> delete(int id);

  Future<void> update(int id, UpdateTimeSlotDto newValues);
}
