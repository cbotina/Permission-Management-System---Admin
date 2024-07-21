import 'package:freezed_annotation/freezed_annotation.dart';

part 'student.freezed.dart';
part 'student.g.dart';

enum Gender {
  @JsonValue('M')
  male,
  @JsonValue('F')
  female,
}

@freezed
class Student with _$Student {
  const factory Student({
    required int id,
    required String cc,
    required String firstName,
    required String lastName,
    required String email,
    required Gender gender,
  }) = _Student;

  factory Student.fromJson(Map<String, dynamic> json) =>
      _$StudentFromJson(json);
}
