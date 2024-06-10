import 'package:pms_admin/features/periods/data/abstract_repositories/periods_repository.dart';
import 'package:pms_admin/features/periods/domain/models/period.dart';

class MockPeriodsRepository implements IPeriodsRepository {
  @override
  Future<List<Period>> getAll() async {
    const Duration(seconds: 2);
    return mockPeriods;
  }
}

final List<Period> mockPeriods = [
  Period(
    id: 1,
    name: '2022-A',
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
    startDate: DateTime(2022, 1),
    endDate: DateTime(2022, 6),
  ),
  Period(
    id: 8,
    name: '2025-B',
    startDate: DateTime(2022, 7),
    endDate: DateTime(2022, 12),
  ),
  Period(
    id: 9,
    name: '2026-A',
    startDate: DateTime(2023, 1),
    endDate: DateTime(2023, 6),
  ),
  Period(
    id: 10,
    name: '2026-B',
    startDate: DateTime(2023, 7),
    endDate: DateTime(2023, 12),
  ),
];
