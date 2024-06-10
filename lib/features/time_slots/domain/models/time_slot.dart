import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'time_slot.freezed.dart';

@Freezed()
class TimeSlot with _$TimeSlot {
  const factory TimeSlot({
    required int periodId,
    required String tag,
    required TimeOfDay startTime,
    required TimeOfDay endTime,
    required bool isAcademic,
  }) = _TimeSlot;
}
