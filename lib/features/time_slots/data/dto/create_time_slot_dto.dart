import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:pms_admin/common/extensions/time_to_military_time.dart';

class CreateTimeSlotDto extends MapView<String, dynamic> {
  final String label;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final bool isAcademic;

  CreateTimeSlotDto({
    required this.label,
    required this.startTime,
    required this.endTime,
    required this.isAcademic,
  }) : super({
          'label': label,
          'startTime': startTime.toMilitary(),
          'endTime': endTime.toMilitary(),
          'isAcademic': isAcademic,
        });
}
