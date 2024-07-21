import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/common/providers/repository_providers.dart';
import 'package:pms_admin/features/permissions/domain/models/permission_absence_view.dart';

final permissionAbsencesProvider =
    FutureProvider.family<List<PermissionAbsenceView>, int>(
  (ref, permissionId) async {
    return await ref
        .watch(permissionAbsencesRepositoryProvider)
        .getStudentPermissionAbsences(permissionId, 1)
        .then(
          (value) => value.items,
        );
  },
);
