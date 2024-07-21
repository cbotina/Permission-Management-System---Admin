import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/common/models/paginated_response.dart';
import 'package:pms_admin/common/providers/active_period_provider.dart';
import 'package:pms_admin/common/providers/repository_providers.dart';
import 'package:pms_admin/common/providers/search_query_provider.dart';
import 'package:pms_admin/features/permissions/domain/models/permission_with_student_view.dart';

final periodPermissionsProvider =
    FutureProvider.family<Pagination<PermissionWithStudentView>, int>(
        (ref, page) async {
  final periodId = ref.watch(activePeriodProvider).id;

  final searchQuery = ref.watch(searchQueryController);

  return await ref
      .watch(permissionWithStudentRepositoryProvider)
      .getPeriodPermissions(periodId, page, searchQuery, '');
});

final periodLeavingPermissionsProvider =
    FutureProvider.family<Pagination<PermissionWithStudentView>, int>(
        (ref, page) async {
  final periodId = ref.watch(activePeriodProvider).id;

  final searchQuery = ref.watch(searchQueryController);

  return await ref
      .watch(permissionWithStudentRepositoryProvider)
      .getPeriodPermissions(periodId, page, searchQuery, 'L');
});
