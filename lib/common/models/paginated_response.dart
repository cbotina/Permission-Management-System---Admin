import 'package:flutter/foundation.dart';
import 'package:pms_admin/common/models/response_metadata.dart';

@immutable
class Pagination<T> {
  final List<T> items;
  final ResponseMetadata meta;

  const Pagination({
    required this.items,
    required this.meta,
  });
}
