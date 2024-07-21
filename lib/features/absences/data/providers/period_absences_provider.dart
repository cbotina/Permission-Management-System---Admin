import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/common/models/paginated_response.dart';
import 'package:pms_admin/common/providers/active_period_provider.dart';
import 'package:pms_admin/common/providers/repository_providers.dart';
import 'package:pms_admin/common/providers/search_query_provider.dart';
import 'package:pms_admin/features/absences/domain/models/absence_with_student_view.dart';

final absencesProvider =
    FutureProvider.family<Pagination<AbsenceWithStudentView>, int>(
        (ref, page) async {
  final activePeriodId = ref.watch(activePeriodProvider).id;

  final searchQuery = ref.watch(searchQueryController);

  return await ref.watch(absencesRepositoryProvider).getPeriodAbsences(
        activePeriodId,
        page,
        searchQuery,
      );
});
