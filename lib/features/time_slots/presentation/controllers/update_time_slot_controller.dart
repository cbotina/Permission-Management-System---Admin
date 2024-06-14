import 'dart:async';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/common/providers/repository_providers.dart';
import 'package:pms_admin/features/time_slots/data/abstract_repositories/time_slots_repository.dart';
import 'package:pms_admin/features/time_slots/data/dto/update_time_slot_dto.dart';

class UpdateTimeSlotController extends AsyncNotifier<void> {
  late final ITimeSlotsRepository _repository =
      ref.watch(timeSlotsRepositoryProvider);

  @override
  FutureOr<void> build() {}

  Future<void> updateTimeSlot(
    int timeSlotId,
    UpdateTimeSlotDto newValues,
  ) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => _repository.update(timeSlotId, newValues),
    );
  }
}

final updateTimeSlotControllerProvider =
    AsyncNotifierProvider<UpdateTimeSlotController, void>(
  () => UpdateTimeSlotController(),
);
