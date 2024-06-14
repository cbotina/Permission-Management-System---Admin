import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/features/periods/domain/models/period.dart';

class ActivePeriodNotifier extends StateNotifier<Period> {
  ActivePeriodNotifier()
      : super(
          Period(
            id: 45,
            name: '2024-A',
            startDate: DateTime(2024, 2, 1),
            endDate: DateTime(2024, 5, 30),
          ),
        );
  void setPeriod(Period period) {
    state = period;
  }
}

final activePeriodProvider =
    StateNotifierProvider<ActivePeriodNotifier, Period>((ref) {
  return ActivePeriodNotifier();
});
