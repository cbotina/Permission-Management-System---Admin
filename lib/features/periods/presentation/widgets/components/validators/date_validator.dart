import 'package:pms_admin/common/constants/strings.dart';

String? Function(String?) dateValidator = (String? value) {
  if (value == null || value == '') {
    return Strings.requiredField;
  }
  return null;
};
