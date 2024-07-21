import 'package:pms_admin/features/permissions/data/dto/create_leaving_permission_dto.dart';
import 'package:pms_admin/features/permissions/data/dto/update_permission_dto.dart';
import 'package:pms_admin/features/permissions/domain/models/permission.dart';

abstract class IPermissionsRepository {
  Future<Permission> getPermission(int permissionId);

  Future<void> updatePermission(int id, UpdatePermissionDto newValues);

  Future<void> createLeavingPermission(
      int studentId, CreateLeavingPermissionDto dto);
}
