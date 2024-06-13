import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/common/models/paginated_response.dart';
import 'package:pms_admin/features/periods/domain/models/period.dart';
import 'package:pms_admin/providers/repository_providers.dart';

final periodsResponseProvider =
    FutureProvider<PaginatedResponse<Period>>((ref) async {
  final response = await ref.watch(periodsRepositoryProvider).getPage(4);
  return response;
});

final periodsFamilyProvider =
    FutureProvider.family<PaginatedResponse<Period>, int>((ref, page) async {
  return await ref.watch(periodsRepositoryProvider).getPage(page);
});
