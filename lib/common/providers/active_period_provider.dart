import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/features/periods/domain/models/period.dart';

final activePeriodProvider = Provider<Period>((ref) {
  return Period(
      id: 4,
      name: 'ACTIVO',
      startDate: DateTime.now(),
      endDate: DateTime.now());
});
