// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'selectable_absence_time_slot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SelectableAbsenceTimeSlot {
  DateTime get date => throw _privateConstructorUsedError;
  int get subjectGroupTimeSlotId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SelectableAbsenceTimeSlotCopyWith<SelectableAbsenceTimeSlot> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectableAbsenceTimeSlotCopyWith<$Res> {
  factory $SelectableAbsenceTimeSlotCopyWith(SelectableAbsenceTimeSlot value,
          $Res Function(SelectableAbsenceTimeSlot) then) =
      _$SelectableAbsenceTimeSlotCopyWithImpl<$Res, SelectableAbsenceTimeSlot>;
  @useResult
  $Res call({DateTime date, int subjectGroupTimeSlotId});
}

/// @nodoc
class _$SelectableAbsenceTimeSlotCopyWithImpl<$Res,
        $Val extends SelectableAbsenceTimeSlot>
    implements $SelectableAbsenceTimeSlotCopyWith<$Res> {
  _$SelectableAbsenceTimeSlotCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? subjectGroupTimeSlotId = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      subjectGroupTimeSlotId: null == subjectGroupTimeSlotId
          ? _value.subjectGroupTimeSlotId
          : subjectGroupTimeSlotId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SelectableAbsenceTimeSlotImplCopyWith<$Res>
    implements $SelectableAbsenceTimeSlotCopyWith<$Res> {
  factory _$$SelectableAbsenceTimeSlotImplCopyWith(
          _$SelectableAbsenceTimeSlotImpl value,
          $Res Function(_$SelectableAbsenceTimeSlotImpl) then) =
      __$$SelectableAbsenceTimeSlotImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date, int subjectGroupTimeSlotId});
}

/// @nodoc
class __$$SelectableAbsenceTimeSlotImplCopyWithImpl<$Res>
    extends _$SelectableAbsenceTimeSlotCopyWithImpl<$Res,
        _$SelectableAbsenceTimeSlotImpl>
    implements _$$SelectableAbsenceTimeSlotImplCopyWith<$Res> {
  __$$SelectableAbsenceTimeSlotImplCopyWithImpl(
      _$SelectableAbsenceTimeSlotImpl _value,
      $Res Function(_$SelectableAbsenceTimeSlotImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? subjectGroupTimeSlotId = null,
  }) {
    return _then(_$SelectableAbsenceTimeSlotImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      subjectGroupTimeSlotId: null == subjectGroupTimeSlotId
          ? _value.subjectGroupTimeSlotId
          : subjectGroupTimeSlotId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SelectableAbsenceTimeSlotImpl implements _SelectableAbsenceTimeSlot {
  const _$SelectableAbsenceTimeSlotImpl(
      {required this.date, required this.subjectGroupTimeSlotId});

  @override
  final DateTime date;
  @override
  final int subjectGroupTimeSlotId;

  @override
  String toString() {
    return 'SelectableAbsenceTimeSlot(date: $date, subjectGroupTimeSlotId: $subjectGroupTimeSlotId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectableAbsenceTimeSlotImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.subjectGroupTimeSlotId, subjectGroupTimeSlotId) ||
                other.subjectGroupTimeSlotId == subjectGroupTimeSlotId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date, subjectGroupTimeSlotId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectableAbsenceTimeSlotImplCopyWith<_$SelectableAbsenceTimeSlotImpl>
      get copyWith => __$$SelectableAbsenceTimeSlotImplCopyWithImpl<
          _$SelectableAbsenceTimeSlotImpl>(this, _$identity);
}

abstract class _SelectableAbsenceTimeSlot implements SelectableAbsenceTimeSlot {
  const factory _SelectableAbsenceTimeSlot(
          {required final DateTime date,
          required final int subjectGroupTimeSlotId}) =
      _$SelectableAbsenceTimeSlotImpl;

  @override
  DateTime get date;
  @override
  int get subjectGroupTimeSlotId;
  @override
  @JsonKey(ignore: true)
  _$$SelectableAbsenceTimeSlotImplCopyWith<_$SelectableAbsenceTimeSlotImpl>
      get copyWith => throw _privateConstructorUsedError;
}
