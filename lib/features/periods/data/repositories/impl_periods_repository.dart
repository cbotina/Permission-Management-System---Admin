import 'dart:convert';

import 'package:pms_admin/common/environment/environment.dart';
import 'package:pms_admin/common/models/response_metadata.dart';
import 'package:pms_admin/common/models/paginated_response.dart';
import 'package:pms_admin/features/periods/data/abstract_repositories/periods_repository.dart';
import 'package:pms_admin/features/periods/domain/models/period.dart';
import 'package:http/http.dart' as http;

class ImplPeriodsRepository implements IPeriodsRepository {
  @override
  Future<List<Period>> getAll() async {
    final uri = Uri.http(
      ENV.backendUrl,
      '/periods/',
      {'page': '5'},
    );

    final response = await http.get(
      uri,
    );

    final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
    final items = jsonResponse['items'] as List<dynamic>;

    return items.map((e) => Period.fromJson(e)).toList();
  }

  @override
  Future<PaginatedResponse<Period>> getPage(int page) async {
    final uri = Uri.http(
      ENV.backendUrl,
      '/periods/',
      {'page': '$page'},
    );

    final response = await http.get(
      uri,
    );

    final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
    final jsonItems = jsonResponse['items'] as List<dynamic>;
    final items = jsonItems.map((e) => Period.fromJson(e)).toList();
    final meta = ResponseMetadata.fromJson(jsonResponse['meta']);

    return PaginatedResponse(items: items, meta: meta);
  }
}
