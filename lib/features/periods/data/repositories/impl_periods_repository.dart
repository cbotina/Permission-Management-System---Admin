import 'dart:convert';
import 'dart:io';

import 'package:pms_admin/common/environment/environment.dart';
import 'package:pms_admin/common/models/response_metadata.dart';
import 'package:pms_admin/common/models/paginated_response.dart';
import 'package:pms_admin/features/periods/data/abstract_repositories/periods_repository.dart';
import 'package:pms_admin/features/periods/data/dto/create_period_dto.dart';
import 'package:pms_admin/features/periods/domain/models/period.dart';
import 'package:http/http.dart' as http;
import 'package:pms_admin/utils/query_params_builder.dart';

class ImplPeriodsRepository implements IPeriodsRepository {
  @override
  Future<List<Period>> getAllPeriods() async {
    final queryParams = buildQueryParams({'page': '5'});

    final uri = Uri.parse('${ENV.backendUrl}/periods/$queryParams');

    final response = await http.get(uri);

    final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
    final items = jsonResponse['items'] as List<dynamic>;

    return items.map((e) => Period.fromJson(e)).toList();
  }

  @override
  Future<PaginatedResponse<Period>> getPaginatedPeriods(int page) async {
    final queryParams = buildQueryParams({'page': '$page'});

    final uri = Uri.parse('${ENV.backendUrl}/periods/$queryParams');

    final response = await http.get(uri);

    final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
    final jsonItems = jsonResponse['items'] as List<dynamic>;
    final items = jsonItems.map((e) => Period.fromJson(e)).toList();
    final meta = ResponseMetadata.fromJson(jsonResponse['meta']);

    return PaginatedResponse(items: items, meta: meta);
  }

  @override
  Future<void> create(CreatePeriodDto dto) async {
    final uri = Uri.parse('${ENV.backendUrl}/periods');

    final response = await http.post(
      uri,
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
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

    await http.delete(uri);
  }

  @override
  Future<void> update(int periodId, Map<String, dynamic> newValues) async {
    final uri = Uri.parse('${ENV.backendUrl}/periods/$periodId');

    final response = await http.post(
      uri,
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      body: json.encode(newValues),
    );

    final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;

    if (response.statusCode != 200) {
      throw Exception(jsonResponse['message']);
    }
  }
}
