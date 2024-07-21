import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/features/absences/data/abstract_repositories/absences_repository.dart';
import 'package:pms_admin/features/absences/data/repositories/impl_absences_repository.dart';
import 'package:pms_admin/features/auth/data/abstract_repositories/auth_repository.dart';
import 'package:pms_admin/features/auth/data/repositories/impl_auth_repository.dart';
import 'package:pms_admin/features/periods/data/abstract_repositories/periods_repository.dart';
import 'package:pms_admin/features/periods/data/repositories/impl_periods_repository.dart';
import 'package:pms_admin/features/permissions/data/abstract_repositories/permission_absences_repository.dart';
import 'package:pms_admin/features/permissions/data/abstract_repositories/permission_with_student_repository.dart';
import 'package:pms_admin/features/permissions/data/abstract_repositories/permissions_repository.dart';
import 'package:pms_admin/features/permissions/data/repositories/impl_permission_absences_repository.dart';
import 'package:pms_admin/features/permissions/data/repositories/impl_permission_with_student_repository.dart';
import 'package:pms_admin/features/permissions/data/repositories/impl_permissions_repository.dart';
import 'package:pms_admin/features/time_slots/data/abstract_repositories/time_slots_repository.dart';
import 'package:pms_admin/features/time_slots/data/repositories/impl_time_slots_repository.dart';

final periodsRepositoryProvider = Provider<IPeriodsRepository>((ref) {
  return ImplPeriodsRepository(ref: ref);
});

final timeSlotsRepositoryProvider = Provider<ITimeSlotsRepository>((ref) {
  return ImplTimeSlotsRepository(ref: ref);
});

final permissionsRepositoryProvider = Provider<IPermissionsRepository>((ref) {
  return ImplPermissionsRepository(ref: ref);
});

final permissionAbsencesRepositoryProvider =
    Provider<IPermissionAbsencesRepository>((ref) {
  return ImplPermissionAbsencesRepository(ref: ref);
});

final authRepositoryProvider = Provider<IAuthRepository>((ref) {
  return ImplAuthRepository();
});

final permissionWithStudentRepositoryProvider =
    Provider<IPermissionWithStudentRepository>((ref) {
  return ImplPermissionWithStudentRepository(ref: ref);
});

final absencesRepositoryProvider = Provider<IAbsencesRepository>((ref) {
  return ImplAbsencesRepository(ref: ref);
});
