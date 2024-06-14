// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'time_slot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TimeSlot {
  int get id => throw _privateConstructorUsedError;
  int get periodId => throw _privateConstructorUsedError;
  String get tag => throw _privateConstructorUsedError;
  TimeOfDay get startTime => throw _privateConstructorUsedError;
  TimeOfDay get endTime => throw _privateConstructorUsedError;
  bool get isAcademic => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TimeSlotCopyWith<TimeSlot> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeSlotCopyWith<$Res> {
  factory $TimeSlotCopyWith(TimeSlot value, $Res Function(TimeSlot) then) =
      _$TimeSlotCopyWithImpl<$Res, TimeSlot>;
  @useResult
  $Res call(
      {int id,
      int periodId,
      String tag,
      TimeOfDay startTime,
      TimeOfDay endTime,
      bool isAcademic});
}

/// @nodoc
class _$TimeSlotCopyWithImpl<$Res, $Val extends TimeSlot>
    implements $TimeSlotCopyWith<$Res> {
  _$TimeSlotCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? periodId = null,
    Object? tag = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? isAcademic = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      periodId: null == periodId
          ? _value.periodId
          : periodId // ignore: cast_nullable_to_non_nullable
              as int,
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      isAcademic: null == isAcademic
          ? _value.isAcademic
          : isAcademic // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimeSlotImplCopyWith<$Res>
    implements $TimeSlotCopyWith<$Res> {
  factory _$$TimeSlotImplCopyWith(
          _$TimeSlotImpl value, $Res Function(_$TimeSlotImpl) then) =
      __$$TimeSlotImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int periodId,
      String tag,
      TimeOfDay startTime,
      TimeOfDay endTime,
      bool isAcademic});
}

/// @nodoc
class __$$TimeSlotImplCopyWithImpl<$Res>
    extends _$TimeSlotCopyWithImpl<$Res, _$TimeSlotImpl>
    implements _$$TimeSlotImplCopyWith<$Res> {
  __$$TimeSlotImplCopyWithImpl(
      _$TimeSlotImpl _value, $Res Function(_$TimeSlotImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? periodId = null,
    Object? tag = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? isAcademic = null,
  }) {
    return _then(_$TimeSlotImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      periodId: null == periodId
          ? _value.periodId
          : periodId // ignore: cast_nullable_to_non_nullable
              as int,
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      isAcademic: null == isAcademic
          ? _value.isAcademic
          : isAcademic // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TimeSlotImpl implements _TimeSlot {
  const _$TimeSlotImpl(
      {required this.id,
      required this.periodId,
      required this.tag,
      required this.startTime,
      required this.endTime,
      required this.isAcademic});

  @override
  final int id;
  @override
  final int periodId;
  @override
  final String tag;
  @override
  final TimeOfDay startTime;
  @override
  final TimeOfDay endTime;
  @override
  final bool isAcademic;

  @override
  String toString() {
    return 'TimeSlot(id: $id, periodId: $periodId, tag: $tag, startTime: $startTime, endTime: $endTime, isAcademic: $isAcademic)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeSlotImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.periodId, periodId) ||
                other.periodId == periodId) &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.isAcademic, isAcademic) ||
                other.isAcademic == isAcademic));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, periodId, tag, startTime, endTime, isAcademic);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeSlotImplCopyWith<_$TimeSlotImpl> get copyWith =>
      __$$TimeSlotImplCopyWithImpl<_$TimeSlotImpl>(this, _$identity);
}

abstract class _TimeSlot implements TimeSlot {
  const factory _TimeSlot(
      {required final int id,
      required final int periodId,
      required final String tag,
      required final TimeOfDay startTime,
      required final TimeOfDay endTime,
      required final bool isAcademic}) = _$TimeSlotImpl;

  @override
  int get id;
  @override
  int get periodId;
  @override
  String get tag;
  @override
  TimeOfDay get startTime;
  @override
  TimeOfDay get endTime;
  @override
  bool get isAcademic;
  @override
  @JsonKey(ignore: true)
  _$$TimeSlotImplCopyWith<_$TimeSlotImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
