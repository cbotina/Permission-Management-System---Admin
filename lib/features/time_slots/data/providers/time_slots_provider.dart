import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/features/time_slots/domain/models/time_slot.dart';
import 'package:pms_admin/providers/repository_providers.dart';

final timeSlotsProvider = FutureProvider<List<TimeSlot>>((ref) async {
  return await ref.watch(timeSlotsRepositoryProvider).getAll();
});
