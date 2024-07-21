import 'package:flutter/material.dart';
import 'package:pms_admin/common/models/paginated_response.dart';
import 'package:pms_admin/common/models/response_metadata.dart';
import 'package:pms_admin/features/time_slots/data/abstract_repositories/time_slots_repository.dart';
import 'package:pms_admin/features/time_slots/data/dto/create_time_slot_dto.dart';
import 'package:pms_admin/features/time_slots/data/dto/update_time_slot_dto.dart';
import 'package:pms_admin/features/time_slots/domain/models/time_slot.dart';

class MockTimeSlotsRepository implements ITimeSlotsRepository {
  @override
  Future<Pagination<TimeSlot>> getPaginatedTimeSlots(
      int periodId, int page, String searchQuery) async {
    return Pagination(
      items: mockTimeSlots.sublist(0, 9),
      meta: const ResponseMetadata(
        totalItems: 10,
        itemCount: 10,
        itemsPerPage: 10,
        totalPages: 1,
        currentPage: 1,
      ),
    );
  }

  @override
  Future<void> addTimeSlotToPeriod(int periodId, CreateTimeSlotDto dto) async {}

  @override
  Future<void> delete(int id) async {}

  @override
  Future<void> update(int id, UpdateTimeSlotDto newValues) async {}
}

List<TimeSlot> mockTimeSlots = [
  const TimeSlot(
    periodId: 1,
    id: 1,
    startTime: TimeOfDay(hour: 7, minute: 0),
    endTime: TimeOfDay(hour: 7, minute: 55),
    isAcademic: true,
    tag: '1',
  ),
  const TimeSlot(
    periodId: 1,
    id: 1,
    startTime: TimeOfDay(hour: 7, minute: 55),
    endTime: TimeOfDay(hour: 8, minute: 50),
    isAcademic: true,
    tag: '2',
  ),
  const TimeSlot(
    periodId: 1,
    id: 1,
    startTime: TimeOfDay(hour: 8, minute: 50),
    endTime: TimeOfDay(hour: 9, minute: 45),
    isAcademic: true,
    tag: '3',
  ),
  const TimeSlot(
    periodId: 1,
    id: 1,
    startTime: TimeOfDay(hour: 9, minute: 45),
    endTime: TimeOfDay(hour: 10, minute: 40),
    isAcademic: true,
    tag: '4',
  ),
  const TimeSlot(
    periodId: 1,
    id: 1,
    startTime: TimeOfDay(hour: 10, minute: 40),
    endTime: TimeOfDay(hour: 11, minute: 10),
    isAcademic: false,
    tag: '5',
  ),
  const TimeSlot(
    periodId: 1,
    id: 1,
    startTime: TimeOfDay(hour: 11, minute: 10),
    endTime: TimeOfDay(hour: 12, minute: 5),
    isAcademic: true,
    tag: '6',
  ),
  const TimeSlot(
    periodId: 1,
    id: 1,
    startTime: TimeOfDay(hour: 12, minute: 5),
    endTime: TimeOfDay(hour: 12, minute: 55),
    isAcademic: true,
    tag: '7',
  ),
  const TimeSlot(
    periodId: 1,
    id: 1,
    startTime: TimeOfDay(hour: 12, minute: 55),
    endTime: TimeOfDay(hour: 13, minute: 0),
    isAcademic: false,
    tag: '8',
  ),
  const TimeSlot(
    periodId: 1,
    id: 1,
    startTime: TimeOfDay(hour: 13, minute: 0),
    endTime: TimeOfDay(hour: 13, minute: 55),
    isAcademic: true,
    tag: '9',
  ),
  const TimeSlot(
    periodId: 1,
    id: 1,
    startTime: TimeOfDay(hour: 13, minute: 55),
    endTime: TimeOfDay(hour: 14, minute: 50),
    isAcademic: true,
    tag: '10',
  ),
  const TimeSlot(
    periodId: 1,
    id: 1,
    startTime: TimeOfDay(hour: 14, minute: 50),
    endTime: TimeOfDay(hour: 15, minute: 45),
    isAcademic: true,
    tag: '11',
  ),
  const TimeSlot(
    periodId: 1,
    id: 1,
    startTime: TimeOfDay(hour: 15, minute: 45),
    endTime: TimeOfDay(hour: 16, minute: 40),
    isAcademic: true,
    tag: '12',
  ),
  const TimeSlot(
    periodId: 1,
    id: 1,
    startTime: TimeOfDay(hour: 16, minute: 40),
    endTime: TimeOfDay(hour: 17, minute: 35),
    isAcademic: true,
    tag: '13',
  ),
  const TimeSlot(
    periodId: 1,
    id: 1,
    startTime: TimeOfDay(hour: 17, minute: 35),
    endTime: TimeOfDay(hour: 18, minute: 30),
    isAcademic: true,
    tag: '14',
  ),
];
