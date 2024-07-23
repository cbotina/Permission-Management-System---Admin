import 'package:pms_admin/features/students/domain/models/student.dart';

abstract class IStudentsRepository {
  Future<List<Student>> findStudentByCC(String cc);
}
