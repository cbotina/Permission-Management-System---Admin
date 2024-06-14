import 'package:pms_admin/common/models/paginated_response.dart';
import 'package:pms_admin/common/models/response_metadata.dart';
import 'package:pms_admin/features/periods/data/abstract_repositories/periods_repository.dart';
import 'package:pms_admin/features/periods/domain/models/period.dart';

class MockPeriodsRepository implements IPeriodsRepository {
  @override
  Future<List<Period>> getAllPeriods() async {
    const Duration(seconds: 2);
    return mockPeriods;
  }

  @override
  Future<PaginatedResponse<Period>> getPaginatedPeriods(int page) async {
    return PaginatedResponse(
      items: mockPeriods.sublist(0, 9),
      meta: const ResponseMetadata(
        totalItems: 10,
        itemCount: 10,
        itemsPerPage: 10,
        totalPages: 1,
        currentPage: 1,
      ),
    );
  }
}

final List<Period> mockPeriods = [
  Period(
    id: 1,
    name: 'TEST-A',
    startDate: DateTime(2022, 1),
    endDate: DateTime(2022, 6),
  ),
  Period(
    id: 2,
    name: '2022-B',
    startDate: DateTime(2022, 7),
    endDate: DateTime(2022, 12),
  ),
  Period(
    id: 3,
    name: '2023-A',
    startDate: DateTime(2023, 1),
    endDate: DateTime(2023, 6),
  ),
  Period(
    id: 4,
    name: '2023-B',
    startDate: DateTime(2023, 7),
    endDate: DateTime(2023, 12),
  ),
  Period(
    id: 5,
    name: '2024-A',
    startDate: DateTime(2023, 1),
    endDate: DateTime(2023, 6),
  ),
  Period(
    id: 6,
    name: '2024-B',
    startDate: DateTime(2024, 7),
    endDate: DateTime(2024, 12),
  ),
  Period(
    id: 7,
    name: '2025-A',
    startDate: DateTime(2025, 1),
    endDate: DateTime(2025, 6),
  ),
  Period(
    id: 8,
    name: '2025-B',
    startDate: DateTime(2025, 7),
    endDate: DateTime(2025, 12),
  ),
  Period(
    id: 9,
    name: '2026-A',
    startDate: DateTime(2026, 1),
    endDate: DateTime(2026, 6),
  ),
  Period(
    id: 10,
    name: '2026-B',
    startDate: DateTime(2026, 7),
    endDate: DateTime(2026, 12),
  ),
];
