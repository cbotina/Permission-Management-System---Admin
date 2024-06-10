import 'package:pms_admin/common/constants/strings.dart';

String? Function(String?) deletePeriodConfirmationValidator = (String? value) {
  if (value == null || value == '') {
    return Strings.mustConfirm;
  }
  return null;
};
