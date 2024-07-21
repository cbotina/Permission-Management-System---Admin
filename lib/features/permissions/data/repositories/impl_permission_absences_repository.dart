import 'dart:convert';
import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/common/environment/environment.dart';
import 'package:pms_admin/common/errors/session_expired_error.dart';
import 'package:pms_admin/common/models/paginated_response.dart';
import 'package:pms_admin/common/models/response_metadata.dart';
import 'package:pms_admin/common/utils/query_params_builder.dart';
import 'package:pms_admin/features/permissions/data/abstract_repositories/permission_absences_repository.dart';
import 'package:pms_admin/features/permissions/domain/models/permission_absence_view.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ImplPermissionAbsencesRepository
    implements IPermissionAbsencesRepository {
  final ProviderRef ref;

  ImplPermissionAbsencesRepository({required this.ref});

  @override
  Future<Pagination<PermissionAbsenceView>> getStudentPermissionAbsences(
    int permissionId,
    int page,
  ) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    final queryParams = buildQueryParams({'page': '$page', 'limit': '20'});

    final uri = Uri.parse(
        "${ENV.backendUrl}/permissions/$permissionId/absences$queryParams");

    final response = await http.get(
      uri,
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );

    final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;

    if (jsonResponse['message'] == 'Unauthorized') {
      // await ref.read(authControllerProvider.notifier).logout();
      throw SessionExpiredError();
    }

    if (response.statusCode != 200) {
      throw Exception(jsonResponse['messsage']);
    }

    final jsonItems = jsonResponse['items'] as List<dynamic>;
    final items =
        jsonItems.map((e) => PermissionAbsenceView.fromJson(e)).toList();
    final meta = ResponseMetadata.fromJson(jsonResponse['meta']);

    return Pagination(items: items, meta: meta);
  }
}
