import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/common/providers/repository_providers.dart';
import 'package:pms_admin/features/absences/data/providers/period_absences_provider.dart';
import 'package:pms_admin/features/permissions/data/abstract_repositories/permissions_repository.dart';
import 'package:pms_admin/features/permissions/data/dto/create_leaving_permission_dto.dart';
import 'package:pms_admin/features/permissions/data/providers/period_permissions_repository.dart';

class CreateLeavingPermissionController extends AsyncNotifier<void> {
  late final IPermissionsRepository _repository =
      ref.watch(permissionsRepositoryProvider);

  @override
  FutureOr<void> build() {}

  Future<void> createLeavingPermission(
    int studentId,
    CreateLeavingPermissionDto dto,
  ) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => _repository.createLeavingPermission(studentId, dto),
    );

    ref.invalidate(periodLeavingPermissionsProvider);
    ref.invalidate(periodPermissionsProvider);
    ref.invalidate(absencesProvider);
  }
}

final createLeavingPermissionControllerProvider =
    AsyncNotifierProvider<CreateLeavingPermissionController, void>(() {
  return CreateLeavingPermissionController();
});
