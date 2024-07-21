import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pms_admin/features/permissions/domain/models/permission.dart';

part 'permission_with_student_view.freezed.dart';
part 'permission_with_student_view.g.dart';

@freezed
class PermissionWithStudentView with _$PermissionWithStudentView {
  const factory PermissionWithStudentView({
    required int permissionId,
    required int studentId,
    required DateTime requestDate,
    required String student,
    required String reason,
    required PermissionStatus status,
  }) = _PermissionWithStudentView;

  factory PermissionWithStudentView.fromJson(Map<String, dynamic> json) =>
      _$PermissionWithStudentViewFromJson(json);
}
