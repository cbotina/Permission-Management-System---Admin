import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/features/periods/data/abstract_repositories/periods_repository.dart';
import 'package:pms_admin/features/periods/data/repositories/impl_periods_repository.dart';
import 'package:pms_admin/features/time_slots/data/abstract_repositories/time_slots_repository.dart';
import 'package:pms_admin/features/time_slots/data/repositories/mock_time_slots_repository.dart';

final periodsRepositoryProvider = Provider<IPeriodsRepository>((ref) {
  return ImplPeriodsRepository();
});

final timeSlotsRepositoryProvider = Provider<ITimeSlotsRepository>((ref) {
  return MockTimeSlotsRepository();
});
