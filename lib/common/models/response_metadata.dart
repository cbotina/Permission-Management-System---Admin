import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_metadata.freezed.dart';
part 'response_metadata.g.dart';

@Freezed()
@immutable
class ResponseMetadata with _$ResponseMetadata {
  const factory ResponseMetadata({
    required int totalItems,
    required int itemCount,
    required int itemsPerPage,
    required int totalPages,
    required int currentPage,
  }) = _ResponseMetadata;

  factory ResponseMetadata.fromJson(Map<String, dynamic> json) =>
      _$ResponseMetadataFromJson(json);
}
