import 'dart:async';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/common/providers/repository_providers.dart';
import 'package:pms_admin/features/time_slots/data/abstract_repositories/time_slots_repository.dart';
import 'package:pms_admin/features/time_slots/data/dto/create_time_slot_dto.dart';

class AddTimeSlotToPeriodController extends AsyncNotifier<void> {
  late final ITimeSlotsRepository _repository =
      ref.watch(timeSlotsRepositoryProvider);

  @override
  FutureOr<void> build() {}

  Future<void> addTimeSlotToPeriod(int periodId, CreateTimeSlotDto dto) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
        () => _repository.addTimeSlotToPeriod(periodId, dto));
  }
}

final addTimeSlotToPeriodControllerProvider =
    AsyncNotifierProvider<AddTimeSlotToPeriodController, void>(
  () => AddTimeSlotToPeriodController(),
);
