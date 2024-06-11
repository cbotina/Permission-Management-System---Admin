import 'package:pms_admin/common/constants/strings.dart';

const maxLength = 10;

String? Function(String?) timeSlotLabelValidator = (String? value) {
  if (value == null || value == '') {
    return Strings.requiredField;
  } else if (value.length > maxLength) {
    return Strings.maxCharsAllowed;
  }
  return null;
};
