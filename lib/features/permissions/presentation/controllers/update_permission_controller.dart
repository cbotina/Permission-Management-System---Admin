import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/common/providers/repository_providers.dart';
import 'package:pms_admin/features/permissions/data/abstract_repositories/permissions_repository.dart';
import 'package:pms_admin/features/permissions/data/dto/update_permission_dto.dart';

class UpdatePermissionController extends AsyncNotifier<void> {
  late final IPermissionsRepository _repository =
      ref.watch(permissionsRepositoryProvider);

  @override
  FutureOr<void> build() {}

  Future<void> updatePermission(
      int permissionId, UpdatePermissionDto dto) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => _repository.updatePermission(permissionId, dto),
    );
  }
}

final updatePermissionControllerProvider =
    AsyncNotifierProvider<UpdatePermissionController, void>(() {
  return UpdatePermissionController();
});
