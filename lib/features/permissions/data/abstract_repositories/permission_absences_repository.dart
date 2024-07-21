import 'package:pms_admin/common/models/paginated_response.dart';
import 'package:pms_admin/features/permissions/domain/models/permission_absence_view.dart';

abstract class IPermissionAbsencesRepository {
  Future<Pagination<PermissionAbsenceView>> getStudentPermissionAbsences(
    int permissionId,
    int page,
  );
}
