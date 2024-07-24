import 'dart:convert';
import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/common/environment/environment.dart';
import 'package:pms_admin/common/errors/session_expired_error.dart';
import 'package:pms_admin/features/auth/presentation/controllers/auth_controller.dart';
import 'package:pms_admin/features/permissions/data/abstract_repositories/permissions_repository.dart';
import 'package:pms_admin/features/permissions/data/dto/create_leaving_permission_dto.dart';
import 'package:pms_admin/features/permissions/data/dto/update_permission_dto.dart';
import 'package:pms_admin/features/permissions/domain/models/permission.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ImplPermissionsRepository implements IPermissionsRepository {
  final ProviderRef ref;

  ImplPermissionsRepository({required this.ref});

  @override
  Future<Permission> getPermission(int permissionId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    final uri = Uri.parse("${ENV.backendUrl}/permissions/$permissionId");

    final response = await http.get(
      uri,
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );

    final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;

    if (jsonResponse['message'] == 'Unauthorized') {
      await ref.read(authControllerProvider.notifier).logout();
      throw SessionExpiredError('Sesión expirada. Vuelva a Iniciar Sesión');
    }

    return Permission.fromJson(jsonResponse);
  }

  @override
  Future<void> updatePermission(int id, UpdatePermissionDto newValues) async {
    final uri = Uri.parse('${ENV.backendUrl}/permissions/$id');

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    final response = await http.patch(
      uri,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token'
      },
      body: json.encode(newValues.toMap()),
    );

    final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;

    if (response.statusCode != 200) {
      throw Exception(jsonResponse['message']);
    }
  }

  @override
  Future<void> createLeavingPermission(
    int studentId,
    CreateLeavingPermissionDto dto,
  ) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    final uri =
        Uri.parse('${ENV.backendUrl}/students/$studentId/leaving-permissions');

    final response = await http.post(
      uri,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token'
      },
      body: jsonEncode(dto),
    );

    final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;

    if (jsonResponse['message'] == 'Unauthorized') {
      await ref.read(authControllerProvider.notifier).logout();
      throw SessionExpiredError('Sesión expirada. Vuelva a Iniciar Sesión');
    }

    if (response.statusCode != 201) {
      throw Exception(jsonResponse['message']);
    }
  }

  @override
  Future<void> deletePermission(int permissionId) async {
    final uri = Uri.parse('${ENV.backendUrl}/permissions/$permissionId');

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    await http.delete(
      uri,
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );
  }
}
