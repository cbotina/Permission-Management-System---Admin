import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/common/models/paginated_response.dart';
import 'package:pms_admin/features/periods/domain/models/period.dart';
import 'package:pms_admin/common/providers/repository_providers.dart';

final allPeriodsProvider =
    FutureProvider<PaginatedResponse<Period>>((ref) async {
  return await ref.watch(periodsRepositoryProvider).getPaginatedPeriods(4);
});

final paginatedPeriodsProvider =
    FutureProvider.family<PaginatedResponse<Period>, int>((ref, page) async {
  return await ref.watch(periodsRepositoryProvider).getPaginatedPeriods(page);
});
