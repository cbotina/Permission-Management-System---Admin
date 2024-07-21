import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/common/environment/environment.dart';
import 'package:pms_admin/common/models/paginated_response.dart';
import 'package:pms_admin/common/models/response_metadata.dart';
import 'package:pms_admin/common/utils/query_params_builder.dart';
import 'package:pms_admin/features/absences/data/abstract_repositories/absences_repository.dart';
import 'package:pms_admin/features/absences/domain/models/absence_with_student_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ImplAbsencesRepository implements IAbsencesRepository {
  final ProviderRef ref;

  ImplAbsencesRepository({required this.ref});

  @override
  Future<Pagination<AbsenceWithStudentView>> getPeriodAbsences(
    int periodId,
    int page,
    String search,
  ) async {
    final queryParams = buildQueryParams({
      'page': '$page',
      'search': search,
    });

    final uri =
        Uri.parse('${ENV.backendUrl}/periods/$periodId/absences$queryParams');

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    final response = await http.get(
      uri,
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );

    if (response.statusCode != 200) {
      log(response.body);
      throw Exception("Ha ocurrido un error");
    }

    final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
    final jsonItems = jsonResponse['items'] as List<dynamic>;
    final items =
        jsonItems.map((e) => AbsenceWithStudentView.fromJson(e)).toList();
    final meta = ResponseMetadata.fromJson(jsonResponse['meta']);

    return Pagination(items: items, meta: meta);
  }

  @override
  Future<void> deleteAbsence(int absenceId) async {
    final uri = Uri.parse('${ENV.backendUrl}/absences/$absenceId');

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    await http.delete(
      uri,
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );
  }
}
