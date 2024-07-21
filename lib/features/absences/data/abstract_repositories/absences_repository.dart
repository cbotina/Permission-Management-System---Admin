import 'package:pms_admin/common/models/paginated_response.dart';
import 'package:pms_admin/features/absences/domain/models/absence_with_student_view.dart';

abstract class IAbsencesRepository {
  Future<Pagination<AbsenceWithStudentView>> getPeriodAbsences(
    int periodId,
    int page,
    String search,
  );

  Future<void> deleteAbsence(int absenceId);
}
