import 'package:pms_admin/common/constants/strings.dart';

const maxLength = 15;

String? Function(String?) periodNameValidator = (String? value) {
  if (value == null || value == '') {
    return Strings.requiredField;
  } else if (value.length > maxLength) {
    return Strings.maxCharsAllowed;
  }
  return null;
};
