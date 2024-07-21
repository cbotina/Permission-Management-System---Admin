import 'package:pms_admin/common/models/paginated_response.dart';
import 'package:pms_admin/features/permissions/domain/models/permission_with_student_view.dart';

abstract class IPermissionWithStudentRepository {
  Future<Pagination<PermissionWithStudentView>> getPeriodPermissions(
    int periodId,
    int page,
    String searchQuery,
    String status,
  );
}
