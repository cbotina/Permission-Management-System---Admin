import 'dart:convert';
import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/common/environment/environment.dart';
import 'package:pms_admin/common/models/paginated_response.dart';
import 'package:pms_admin/common/models/response_metadata.dart';
import 'package:pms_admin/features/time_slots/data/abstract_repositories/time_slots_repository.dart';
import 'package:pms_admin/features/time_slots/data/dto/create_time_slot_dto.dart';
import 'package:pms_admin/features/time_slots/data/dto/update_time_slot_dto.dart';
import 'package:pms_admin/features/time_slots/domain/models/time_slot.dart';
import 'package:http/http.dart' as http;
import 'package:pms_admin/common/utils/query_params_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImplTimeSlotsRepository implements ITimeSlotsRepository {
  final ProviderRef ref;

  ImplTimeSlotsRepository({required this.ref});

  @override
  Future<Pagination<TimeSlot>> getPaginatedTimeSlots(
    int periodId,
    int page,
    String searchQuery,
  ) async {
    final queryParams = buildQueryParams({
      'page': '$page',
      'search': searchQuery,
    });

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    final uri = Uri.parse(
        '${ENV.backendUrl}/periods/$periodId/time-slots/$queryParams');

    final response = await http.get(
      uri,
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );

    final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
    final jsonItems = jsonResponse['items'] as List<dynamic>;
    final items = jsonItems.map((e) => TimeSlot.fromJson(e)).toList();
    final meta = ResponseMetadata.fromJson(jsonResponse['meta']);

    return Pagination(items: items, meta: meta);
  }

  @override
  Future<void> addTimeSlotToPeriod(int periodId, CreateTimeSlotDto dto) async {
    final uri = Uri.parse('${ENV.backendUrl}/periods/$periodId/time-slots');

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
  Future<void> delete(int id) async {
    final uri = Uri.parse('${ENV.backendUrl}/time-slots/$id');

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    await http.delete(
      uri,
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );
  }

  @override
  Future<void> update(int id, UpdateTimeSlotDto newValues) async {
    final uri = Uri.parse('${ENV.backendUrl}/time-slots/$id');

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
}
