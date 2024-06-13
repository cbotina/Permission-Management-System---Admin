import 'package:pms_admin/common/models/paginated_response.dart';
import 'package:pms_admin/features/periods/domain/models/period.dart';

abstract class IPeriodsRepository {
  Future<List<Period>> getAll();
  Future<PaginatedResponse<Period>> getPage(int page);
}
