import 'dart:convert';
import 'dart:io';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:pms_admin/common/environment/environment.dart';
import 'package:pms_admin/common/errors/session_expired_error.dart';
import 'package:pms_admin/common/models/paginated_response.dart';
import 'package:pms_admin/common/models/response_metadata.dart';
import 'package:pms_admin/common/utils/query_params_builder.dart';
import 'package:pms_admin/features/auth/presentation/controllers/auth_controller.dart';
import 'package:pms_admin/features/permissions/data/abstract_repositories/permission_with_student_repository.dart';
import 'package:pms_admin/features/permissions/domain/models/permission_with_student_view.dart';
import 'package:pms_admin/features/time_slots/domain/models/time_slot.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImplPermissionWithStudentRepository
    implements IPermissionWithStudentRepository {
  final ProviderRef ref;

  ImplPermissionWithStudentRepository({required this.ref});

  @override
  Future<Pagination<PermissionWithStudentView>> getPeriodPermissions(
      int periodId, int page, String searchQuery, String status) async {
    final queryParams = buildQueryParams(
        {'page': '$page', 'search': searchQuery, 'status': status});

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    final uri = Uri.parse(
        '${ENV.backendUrl}/periods/$periodId/permissions/$queryParams');

    final response = await http.get(
      uri,
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );

    final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;

    if (jsonResponse['message'] == 'Unauthorized') {
      await ref.read(authControllerProvider.notifier).logout();
      throw SessionExpiredError('Sesión expirada. Vuelva a Iniciar Sesión');
    }

    final jsonItems = jsonResponse['items'] as List<dynamic>;
    final items =
        jsonItems.map((e) => PermissionWithStudentView.fromJson(e)).toList();
    final meta = ResponseMetadata.fromJson(jsonResponse['meta']);

    return Pagination(items: items, meta: meta);
  }
}
