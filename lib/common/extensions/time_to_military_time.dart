import 'package:flutter/material.dart';

extension ToMilitary on TimeOfDay {
  String toMilitary() {
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  }
}
