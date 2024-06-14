import 'package:pms_admin/common/models/paginated_response.dart';
import 'package:pms_admin/features/periods/data/dto/create_period_dto.dart';
import 'package:pms_admin/features/periods/domain/models/period.dart';

abstract class IPeriodsRepository {
  Future<List<Period>> getAllPeriods();

  Future<PaginatedResponse<Period>> getPaginatedPeriods(
    int page,
    String searchQuery,
  );

  Future<void> create(CreatePeriodDto dto);

  Future<void> delete(int id);

  Future<void> update(int id, Map<String, dynamic> newValues);
}
