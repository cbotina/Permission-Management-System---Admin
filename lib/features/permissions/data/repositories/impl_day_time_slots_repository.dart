import 'dart:convert';
import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/common/environment/environment.dart';
import 'package:pms_admin/common/errors/session_expired_error.dart';
import 'package:pms_admin/common/utils/query_params_builder.dart';
import 'package:pms_admin/features/auth/presentation/controllers/auth_controller.dart';
import 'package:pms_admin/features/permissions/data/abstract_repositories/day_time_slots_repository.dart';
import 'package:pms_admin/features/permissions/data/dto/schedule_range_dates_dto.dart';
import 'package:pms_admin/features/permissions/domain/models/day_time_slots.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ImplDayTimeSlotsRepository implements IDayTimeSlotsRepository {
  final ProviderRef ref;

  ImplDayTimeSlotsRepository({required this.ref});

  @override
  Future<List<DayTimeSlots>> getRangeTimeSlots(
    int periodId,
    int studentId,
    ScheduleRangeDatesDto dto,
  ) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    final queryParams = buildQueryParams({
      "startDate": dto.startDate.toString(),
      "endDate": dto.endDate.toString(),
    });

    final uri = Uri.parse(
        "${ENV.backendUrl}/periods/$periodId/students/$studentId/range-schedule/$queryParams");

    final response = await http.get(
      uri,
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );

    if (response.statusCode != 200) {
      throw Exception('Ha ocurrido un error');
    }

    if (response.statusCode == 401) {
      await ref.read(authControllerProvider.notifier).logout();
      throw SessionExpiredError('Sesión expirada. Vuelva a Iniciar Sesión');
    }

    final jsonResponse = jsonDecode(response.body) as List<dynamic>;

    return jsonResponse.map((e) => DayTimeSlots.fromJson(e)).toList();
  }
}
