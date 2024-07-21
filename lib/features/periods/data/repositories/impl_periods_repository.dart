import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/common/environment/environment.dart';
import 'package:pms_admin/common/errors/session_expired_error.dart';
import 'package:pms_admin/common/models/response_metadata.dart';
import 'package:pms_admin/common/models/paginated_response.dart';
import 'package:pms_admin/features/auth/presentation/controllers/auth_controller.dart';
import 'package:pms_admin/features/periods/data/abstract_repositories/periods_repository.dart';
import 'package:pms_admin/features/periods/data/dto/create_period_dto.dart';
import 'package:pms_admin/features/periods/domain/models/period.dart';
import 'package:http/http.dart' as http;
import 'package:pms_admin/common/utils/query_params_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImplPeriodsRepository implements IPeriodsRepository {
  final ProviderRef ref;

  ImplPeriodsRepository({required this.ref});

  @override
  Future<List<Period>> getAllPeriods() async {
    final queryParams = buildQueryParams({'page': '5'});

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    final uri = Uri.parse('${ENV.backendUrl}/periods/$queryParams');

    final response = await http.get(
      uri,
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );

    final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
    final items = jsonResponse['items'] as List<dynamic>;

    return items.map((e) => Period.fromJson(e)).toList();
  }

  @override
  Future<Pagination<Period>> getPaginatedPeriods(
    int page,
    String searchQuery,
  ) async {
    final queryParams = buildQueryParams({
      'page': '$page',
      'search': searchQuery,
    });

    final uri = Uri.parse('${ENV.backendUrl}/periods/$queryParams');

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    final response = await http.get(
      uri,
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );

    final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
    final jsonItems = jsonResponse['items'] as List<dynamic>;
    final items = jsonItems.map((e) => Period.fromJson(e)).toList();
    final meta = ResponseMetadata.fromJson(jsonResponse['meta']);

    return Pagination(items: items, meta: meta);
  }

  @override
  Future<void> create(CreatePeriodDto dto) async {
    final uri = Uri.parse('${ENV.backendUrl}/periods');

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    final response = await http.post(
      uri,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token'
      },
      body: json.encode(dto),
    );

    final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;

    if (response.statusCode != 201) {
      throw Exception(jsonResponse['message']);
    }
  }

  @override
  Future<void> delete(int periodId) async {
    final uri = Uri.parse('${ENV.backendUrl}/periods/$periodId');

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    await http.delete(
      uri,
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );
  }

  @override
  Future<void> update(int periodId, Map<String, dynamic> newValues) async {
    final uri = Uri.parse('${ENV.backendUrl}/periods/$periodId');

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    final response = await http.patch(
      uri,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token'
      },
      body: json.encode(newValues),
    );

    final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;

    if (response.statusCode != 200) {
      throw Exception(jsonResponse['message']);
    }
  }

  @override
  Future<Period?> getActivePeriod() async {
    final uri = Uri.parse("${ENV.backendUrl}/periods/active");

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    final response = await http.get(
      uri,
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );

    final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;

    if (jsonResponse['message'] == 'Unauthorized') {
      await ref.read(authControllerProvider.notifier).logout();
      throw SessionExpiredError('Sesión expirada. Vuelva a Iniciar Sesión');
    }

    return Period.fromJson(jsonResponse);
  }
}
