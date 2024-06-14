import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/common/models/paginated_response.dart';
import 'package:pms_admin/common/providers/active_period_provider.dart';
import 'package:pms_admin/features/time_slots/domain/models/time_slot.dart';
import 'package:pms_admin/common/providers/repository_providers.dart';

final paginatedTimeSlotsProvider =
    FutureProvider.family<PaginatedResponse<TimeSlot>, int>((ref, page) async {
  final activePeriodId = ref.watch(activePeriodProvider).id;
  return await ref
      .watch(timeSlotsRepositoryProvider)
      .getPaginatedTimeSlots(activePeriodId, page);
});
