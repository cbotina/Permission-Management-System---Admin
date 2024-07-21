// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'permission_absence_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PermissionAbsenceView {
  DateTime get absenceDate => throw _privateConstructorUsedError;
  TimeOfDay get startTime => throw _privateConstructorUsedError;
  TimeOfDay get endtime => throw _privateConstructorUsedError;
  String? get teacherNote => throw _privateConstructorUsedError;
  String get subjectName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PermissionAbsenceViewCopyWith<PermissionAbsenceView> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermissionAbsenceViewCopyWith<$Res> {
  factory $PermissionAbsenceViewCopyWith(PermissionAbsenceView value,
          $Res Function(PermissionAbsenceView) then) =
      _$PermissionAbsenceViewCopyWithImpl<$Res, PermissionAbsenceView>;
  @useResult
  $Res call(
      {DateTime absenceDate,
      TimeOfDay startTime,
      TimeOfDay endtime,
      String? teacherNote,
      String subjectName});
}

/// @nodoc
class _$PermissionAbsenceViewCopyWithImpl<$Res,
        $Val extends PermissionAbsenceView>
    implements $PermissionAbsenceViewCopyWith<$Res> {
  _$PermissionAbsenceViewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? absenceDate = null,
    Object? startTime = null,
    Object? endtime = null,
    Object? teacherNote = freezed,
    Object? subjectName = null,
  }) {
    return _then(_value.copyWith(
      absenceDate: null == absenceDate
          ? _value.absenceDate
          : absenceDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      endtime: null == endtime
          ? _value.endtime
          : endtime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      teacherNote: freezed == teacherNote
          ? _value.teacherNote
          : teacherNote // ignore: cast_nullable_to_non_nullable
              as String?,
      subjectName: null == subjectName
          ? _value.subjectName
          : subjectName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PermissionAbsenceViewImplCopyWith<$Res>
    implements $PermissionAbsenceViewCopyWith<$Res> {
  factory _$$PermissionAbsenceViewImplCopyWith(
          _$PermissionAbsenceViewImpl value,
          $Res Function(_$PermissionAbsenceViewImpl) then) =
      __$$PermissionAbsenceViewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime absenceDate,
      TimeOfDay startTime,
      TimeOfDay endtime,
      String? teacherNote,
      String subjectName});
}

/// @nodoc
class __$$PermissionAbsenceViewImplCopyWithImpl<$Res>
    extends _$PermissionAbsenceViewCopyWithImpl<$Res,
        _$PermissionAbsenceViewImpl>
    implements _$$PermissionAbsenceViewImplCopyWith<$Res> {
  __$$PermissionAbsenceViewImplCopyWithImpl(_$PermissionAbsenceViewImpl _value,
      $Res Function(_$PermissionAbsenceViewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? absenceDate = null,
    Object? startTime = null,
    Object? endtime = null,
    Object? teacherNote = freezed,
    Object? subjectName = null,
  }) {
    return _then(_$PermissionAbsenceViewImpl(
      absenceDate: null == absenceDate
          ? _value.absenceDate
          : absenceDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      endtime: null == endtime
          ? _value.endtime
          : endtime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      teacherNote: freezed == teacherNote
          ? _value.teacherNote
          : teacherNote // ignore: cast_nullable_to_non_nullable
              as String?,
      subjectName: null == subjectName
          ? _value.subjectName
          : subjectName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PermissionAbsenceViewImpl implements _PermissionAbsenceView {
  const _$PermissionAbsenceViewImpl(
      {required this.absenceDate,
      required this.startTime,
      required this.endtime,
      required this.teacherNote,
      required this.subjectName});

  @override
  final DateTime absenceDate;
  @override
  final TimeOfDay startTime;
  @override
  final TimeOfDay endtime;
  @override
  final String? teacherNote;
  @override
  final String subjectName;

  @override
  String toString() {
    return 'PermissionAbsenceView(absenceDate: $absenceDate, startTime: $startTime, endtime: $endtime, teacherNote: $teacherNote, subjectName: $subjectName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PermissionAbsenceViewImpl &&
            (identical(other.absenceDate, absenceDate) ||
                other.absenceDate == absenceDate) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endtime, endtime) || other.endtime == endtime) &&
            (identical(other.teacherNote, teacherNote) ||
                other.teacherNote == teacherNote) &&
            (identical(other.subjectName, subjectName) ||
                other.subjectName == subjectName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, absenceDate, startTime, endtime, teacherNote, subjectName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PermissionAbsenceViewImplCopyWith<_$PermissionAbsenceViewImpl>
      get copyWith => __$$PermissionAbsenceViewImplCopyWithImpl<
          _$PermissionAbsenceViewImpl>(this, _$identity);
}

abstract class _PermissionAbsenceView implements PermissionAbsenceView {
  const factory _PermissionAbsenceView(
      {required final DateTime absenceDate,
      required final TimeOfDay startTime,
      required final TimeOfDay endtime,
      required final String? teacherNote,
      required final String subjectName}) = _$PermissionAbsenceViewImpl;

  @override
  DateTime get absenceDate;
  @override
  TimeOfDay get startTime;
  @override
  TimeOfDay get endtime;
  @override
  String? get teacherNote;
  @override
  String get subjectName;
  @override
  @JsonKey(ignore: true)
  _$$PermissionAbsenceViewImplCopyWith<_$PermissionAbsenceViewImpl>
      get copyWith => throw _privateConstructorUsedError;
}
