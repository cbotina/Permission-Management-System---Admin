import 'package:pms_admin/features/periods/domain/models/period.dart';

abstract class IPeriodsRepository {
  Future<List<Period>> getAll();
}
