import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/features/periods/data/abstract_repositories/periods_repository.dart';
import 'package:pms_admin/features/periods/data/repositories/mock_periods_repository.dart';

final periodsRepositoryProvider = Provider<IPeriodsRepository>((ref) {
  return MockPeriodsRepository();
});
