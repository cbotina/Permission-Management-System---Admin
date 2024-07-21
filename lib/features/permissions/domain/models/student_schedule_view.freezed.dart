// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'student_schedule_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StudentScheduleView {
  int get subjectGroupTimeSlotId => throw _privateConstructorUsedError;
  TimeOfDay get startTime => throw _privateConstructorUsedError;
  TimeOfDay get endTime => throw _privateConstructorUsedError;
  String get subjectName => throw _privateConstructorUsedError;
  String get day => throw _privateConstructorUsedError;
  String get teacherName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StudentScheduleViewCopyWith<StudentScheduleView> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentScheduleViewCopyWith<$Res> {
  factory $StudentScheduleViewCopyWith(
          StudentScheduleView value, $Res Function(StudentScheduleView) then) =
      _$StudentScheduleViewCopyWithImpl<$Res, StudentScheduleView>;
  @useResult
  $Res call(
      {int subjectGroupTimeSlotId,
      TimeOfDay startTime,
      TimeOfDay endTime,
      String subjectName,
      String day,
      String teacherName});
}

/// @nodoc
class _$StudentScheduleViewCopyWithImpl<$Res, $Val extends StudentScheduleView>
    implements $StudentScheduleViewCopyWith<$Res> {
  _$StudentScheduleViewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subjectGroupTimeSlotId = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? subjectName = null,
    Object? day = null,
    Object? teacherName = null,
  }) {
    return _then(_value.copyWith(
      subjectGroupTimeSlotId: null == subjectGroupTimeSlotId
          ? _value.subjectGroupTimeSlotId
          : subjectGroupTimeSlotId // ignore: cast_nullable_to_non_nullable
              as int,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      subjectName: null == subjectName
          ? _value.subjectName
          : subjectName // ignore: cast_nullable_to_non_nullable
              as String,
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String,
      teacherName: null == teacherName
          ? _value.teacherName
          : teacherName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StudentScheduleViewImplCopyWith<$Res>
    implements $StudentScheduleViewCopyWith<$Res> {
  factory _$$StudentScheduleViewImplCopyWith(_$StudentScheduleViewImpl value,
          $Res Function(_$StudentScheduleViewImpl) then) =
      __$$StudentScheduleViewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int subjectGroupTimeSlotId,
      TimeOfDay startTime,
      TimeOfDay endTime,
      String subjectName,
      String day,
      String teacherName});
}

/// @nodoc
class __$$StudentScheduleViewImplCopyWithImpl<$Res>
    extends _$StudentScheduleViewCopyWithImpl<$Res, _$StudentScheduleViewImpl>
    implements _$$StudentScheduleViewImplCopyWith<$Res> {
  __$$StudentScheduleViewImplCopyWithImpl(_$StudentScheduleViewImpl _value,
      $Res Function(_$StudentScheduleViewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subjectGroupTimeSlotId = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? subjectName = null,
    Object? day = null,
    Object? teacherName = null,
  }) {
    return _then(_$StudentScheduleViewImpl(
      subjectGroupTimeSlotId: null == subjectGroupTimeSlotId
          ? _value.subjectGroupTimeSlotId
          : subjectGroupTimeSlotId // ignore: cast_nullable_to_non_nullable
              as int,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      subjectName: null == subjectName
          ? _value.subjectName
          : subjectName // ignore: cast_nullable_to_non_nullable
              as String,
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String,
      teacherName: null == teacherName
          ? _value.teacherName
          : teacherName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$StudentScheduleViewImpl implements _StudentScheduleView {
  const _$StudentScheduleViewImpl(
      {required this.subjectGroupTimeSlotId,
      required this.startTime,
      required this.endTime,
      required this.subjectName,
      required this.day,
      required this.teacherName});

  @override
  final int subjectGroupTimeSlotId;
  @override
  final TimeOfDay startTime;
  @override
  final TimeOfDay endTime;
  @override
  final String subjectName;
  @override
  final String day;
  @override
  final String teacherName;

  @override
  String toString() {
    return 'StudentScheduleView(subjectGroupTimeSlotId: $subjectGroupTimeSlotId, startTime: $startTime, endTime: $endTime, subjectName: $subjectName, day: $day, teacherName: $teacherName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentScheduleViewImpl &&
            (identical(other.subjectGroupTimeSlotId, subjectGroupTimeSlotId) ||
                other.subjectGroupTimeSlotId == subjectGroupTimeSlotId) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.subjectName, subjectName) ||
                other.subjectName == subjectName) &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.teacherName, teacherName) ||
                other.teacherName == teacherName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, subjectGroupTimeSlotId,
      startTime, endTime, subjectName, day, teacherName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentScheduleViewImplCopyWith<_$StudentScheduleViewImpl> get copyWith =>
      __$$StudentScheduleViewImplCopyWithImpl<_$StudentScheduleViewImpl>(
          this, _$identity);
}

abstract class _StudentScheduleView implements StudentScheduleView {
  const factory _StudentScheduleView(
      {required final int subjectGroupTimeSlotId,
      required final TimeOfDay startTime,
      required final TimeOfDay endTime,
      required final String subjectName,
      required final String day,
      required final String teacherName}) = _$StudentScheduleViewImpl;

  @override
  int get subjectGroupTimeSlotId;
  @override
  TimeOfDay get startTime;
  @override
  TimeOfDay get endTime;
  @override
  String get subjectName;
  @override
  String get day;
  @override
  String get teacherName;
  @override
  @JsonKey(ignore: true)
  _$$StudentScheduleViewImplCopyWith<_$StudentScheduleViewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
