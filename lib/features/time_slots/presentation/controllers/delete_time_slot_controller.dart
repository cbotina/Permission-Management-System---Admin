import 'dart:async';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/common/providers/repository_providers.dart';
import 'package:pms_admin/features/time_slots/data/abstract_repositories/time_slots_repository.dart';

class DeleteTimeSlotController extends AsyncNotifier<void> {
  late final ITimeSlotsRepository _repository =
      ref.watch(timeSlotsRepositoryProvider);

  @override
  FutureOr<void> build() {}

  Future<void> delteTimeSlot(int timeSlotId) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _repository.delete(timeSlotId));
  }
}

final deleteTimeSlotControllerProvider =
    AsyncNotifierProvider<DeleteTimeSlotController, void>(
  () => DeleteTimeSlotController(),
);
