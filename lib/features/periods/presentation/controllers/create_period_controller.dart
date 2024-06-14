import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/features/periods/data/abstract_repositories/periods_repository.dart';
import 'package:pms_admin/features/periods/data/dto/create_period_dto.dart';
import 'package:pms_admin/providers/repository_providers.dart';

class CreatePeriodController extends AsyncNotifier<void> {
  late final IPeriodsRepository _repository =
      ref.watch(periodsRepositoryProvider);

  @override
  FutureOr<void> build() {}

  Future<void> createPeriod(CreatePeriodDto dto) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _repository.create(dto));
  }
}

final createPeriodControllerProvider =
    AsyncNotifierProvider<CreatePeriodController, void>(
  () => CreatePeriodController(),
);
