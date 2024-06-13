import 'dart:convert';

import 'package:pms_admin/common/environment/environment.dart';
import 'package:pms_admin/common/models/paginated_response.dart';
import 'package:pms_admin/common/models/response_metadata.dart';
import 'package:pms_admin/features/time_slots/data/abstract_repositories/time_slots_repository.dart';
import 'package:pms_admin/features/time_slots/domain/models/time_slot.dart';
import 'package:http/http.dart' as http;

class ImplTimeSlotsRepository implements ITimeSlotsRepository {
  @override
  Future<List<TimeSlot>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<PaginatedResponse<TimeSlot>> getPaginated(
      int periodId, int page) async {
    final uri = Uri.http(
      ENV.backendUrl,
      'periods/$periodId/time-slots/',
      {'page': '$page'},
    );

    final response = await http.get(
      uri,
    );

    final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
    final jsonItems = jsonResponse['items'] as List<dynamic>;
    final items = jsonItems.map((e) => TimeSlot.fromJson(e)).toList();
    final meta = ResponseMetadata.fromJson(jsonResponse['meta']);

    return PaginatedResponse(items: items, meta: meta);
  }
}
