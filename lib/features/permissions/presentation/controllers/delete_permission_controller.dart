import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/common/providers/repository_providers.dart';
import 'package:pms_admin/features/permissions/data/abstract_repositories/permissions_repository.dart';
import 'package:pms_admin/features/permissions/data/providers/period_permissions_repository.dart';

class DeletePermissionController extends AsyncNotifier<void> {
  late final IPermissionsRepository _repository =
      ref.watch(permissionsRepositoryProvider);

  @override
  FutureOr<void> build() {}

  Future<void> deletePermission(int permissionId) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
        () => _repository.deletePermission(permissionId));
    ref.invalidate(periodLeavingPermissionsProvider);
    ref.invalidate(periodPermissionRequestsProvider);
  }
}

final deletePermissionControllerProvider =
    AsyncNotifierProvider<DeletePermissionController, void>(() {
  return DeletePermissionController();
});
