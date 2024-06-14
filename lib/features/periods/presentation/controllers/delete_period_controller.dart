import 'dart:async';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/features/periods/data/abstract_repositories/periods_repository.dart';
import 'package:pms_admin/common/providers/repository_providers.dart';

class DeletePeriodController extends AsyncNotifier<void> {
  late final IPeriodsRepository _repository =
      ref.watch(periodsRepositoryProvider);

  @override
  FutureOr<void> build() {}

  Future<void> deletePeriod(int periodId) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _repository.delete(periodId));
  }
}

final deletePeriodControllerProvider =
    AsyncNotifierProvider<DeletePeriodController, void>(
  () => DeletePeriodController(),
);
