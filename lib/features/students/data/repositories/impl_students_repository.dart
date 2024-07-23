import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/common/environment/environment.dart';
import 'package:pms_admin/common/errors/session_expired_error.dart';
import 'package:pms_admin/common/utils/query_params_builder.dart';
import 'package:pms_admin/features/auth/presentation/controllers/auth_controller.dart';
import 'package:pms_admin/features/students/data/abstract_repositories/students_repository.dart';
import 'package:pms_admin/features/students/domain/models/student.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ImplStudentsRepository implements IStudentsRepository {
  final ProviderRef ref;

  ImplStudentsRepository({required this.ref});

  @override
  Future<List<Student>> findStudentByCC(String search) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    final queryParams = buildQueryParams({
      'page': '1',
      'limit': '3',
      'search': search,
    });

    final uri = Uri.parse("${ENV.backendUrl}/students$queryParams");

    log(uri.toString());
    final response = await http.get(
      uri,
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );

    final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
    final jsonItems = jsonResponse['items'] as List<dynamic>;
    final items = jsonItems.map((e) => Student.fromJson(e)).toList();

    if (jsonResponse['message'] == 'Unauthorized') {
      await ref.read(authControllerProvider.notifier).logout();
      throw SessionExpiredError('Sesión expirada. Vuelva a Iniciar Sesión');
    }

    return items;
  }
}
