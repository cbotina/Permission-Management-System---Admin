import 'package:pms_admin/common/models/paginated_response.dart';
import 'package:pms_admin/features/time_slots/domain/models/time_slot.dart';

abstract class ITimeSlotsRepository {
  Future<PaginatedResponse<TimeSlot>> getPaginatedTimeSlots(
    int periodId,
    int page,
    String searchQuery,
  );
}
