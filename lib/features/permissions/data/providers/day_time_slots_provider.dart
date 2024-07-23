import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/common/providers/active_period_provider.dart';
import 'package:pms_admin/common/providers/repository_providers.dart';
import 'package:pms_admin/features/permissions/data/dto/schedule_range_dates_dto.dart';
import 'package:pms_admin/features/permissions/domain/models/day_time_slots.dart';

final dayTimeSlotsProvider =
    FutureProvider.family<List<DayTimeSlots>, ScheduleRangeDatesDto?>(
        (ref, dto) async {
  final periodId = ref.watch(activePeriodProvider);

  if (dto == null) {
    return [];
  }

  final studentId = dto.studentId;

  return await ref
      .read(dayTimeSlotsRepositoryProvider)
      .getRangeTimeSlots(periodId.id, studentId, dto);
});
