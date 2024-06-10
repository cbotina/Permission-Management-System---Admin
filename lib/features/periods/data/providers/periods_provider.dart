import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/features/periods/domain/models/period.dart';
import 'package:pms_admin/providers/providers.dart';

final periodsProvider = FutureProvider<List<Period>>((ref) async {
  return ref.watch(periodsRepositoryProvider).getAll();
});
