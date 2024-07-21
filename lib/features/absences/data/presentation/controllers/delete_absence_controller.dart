import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/common/providers/repository_providers.dart';
import 'package:pms_admin/features/absences/data/abstract_repositories/absences_repository.dart';

class DeleteAbsenceController extends AsyncNotifier<void> {
  late final IAbsencesRepository _repository =
      ref.watch(absencesRepositoryProvider);

  @override
  FutureOr<void> build() {}

  Future<void> deleteAbsence(int absenceId) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _repository.deleteAbsence(absenceId));
  }
}

final deleteAbsenceControllerProvider =
    AsyncNotifierProvider<DeleteAbsenceController, void>(() {
  return DeleteAbsenceController();
});
