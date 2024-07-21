import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/common/providers/repository_providers.dart';
import 'package:pms_admin/features/permissions/domain/models/permission.dart';

final permissionDetailsProvider =
    FutureProvider.family<Permission, int>((ref, permissionId) async {
  return ref.watch(permissionsRepositoryProvider).getPermission(permissionId);
});
