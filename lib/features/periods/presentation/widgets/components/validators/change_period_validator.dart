import 'package:pms_admin/common/constants/strings.dart';
import 'package:pms_admin/features/periods/domain/models/period.dart';

String? Function(Period?) changePeriodValidator = (Period? selectedPeriod) {
  if (selectedPeriod == null) return Strings.requiredField;
  return null;
};
