import 'package:freezed_annotation/freezed_annotation.dart';
part 'period.freezed.dart';
part 'period.g.dart';

@Freezed()
@immutable
class Period with _$Period {
  const factory Period({
    required int id,
    required String name,
    required DateTime startDate,
    required DateTime endDate,
  }) = _Period;

  factory Period.fromJson(Map<String, dynamic> json) => _$PeriodFromJson(json);

  @override
  String toString() {
    return name;
  }
}
