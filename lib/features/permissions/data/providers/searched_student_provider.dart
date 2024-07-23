import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/common/providers/repository_providers.dart';
import 'package:pms_admin/features/students/domain/models/student.dart';

final searchedStudentProvider =
    FutureProvider.family<List<Student>, String?>((ref, search) async {
  if (search == null) {
    return [];
  }
  return await ref.watch(studentsRepositoryProvider).findStudentByCC(search);
});
