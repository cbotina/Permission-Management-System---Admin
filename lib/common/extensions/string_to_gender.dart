import 'package:pms_admin/features/students/domain/models/student.dart';

extension ToGender on String {
  Gender toGender() {
    switch (this) {
      case 'M':
        return Gender.male;
      default:
        return Gender.female;
    }
  }
}
