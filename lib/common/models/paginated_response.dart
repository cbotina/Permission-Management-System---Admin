import 'package:flutter/foundation.dart';
import 'package:pms_admin/common/models/response_metadata.dart';

@immutable
class PaginatedResponse<T> {
  final List<T> items;
  final ResponseMetadata meta;

  const PaginatedResponse({
    required this.items,
    required this.meta,
  });
}
