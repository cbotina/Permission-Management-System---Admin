// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'permission.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Permission _$PermissionFromJson(Map<String, dynamic> json) {
  return _Permission.fromJson(json);
}

/// @nodoc
mixin _$Permission {
  int get id => throw _privateConstructorUsedError;
  PermissionStatus get status => throw _privateConstructorUsedError;
  DateTime? get approvalDate => throw _privateConstructorUsedError;
  DateTime? get justificationDeadline => throw _privateConstructorUsedError;
  DateTime get requestDate => throw _privateConstructorUsedError;
  String get reason => throw _privateConstructorUsedError;
  String? get evidenceUrl => throw _privateConstructorUsedError;
  String? get studentNote => throw _privateConstructorUsedError;
  String? get principalNote => throw _privateConstructorUsedError;
  Student get student => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PermissionCopyWith<Permission> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermissionCopyWith<$Res> {
  factory $PermissionCopyWith(
          Permission value, $Res Function(Permission) then) =
      _$PermissionCopyWithImpl<$Res, Permission>;
  @useResult
  $Res call(
      {int id,
      PermissionStatus status,
      DateTime? approvalDate,
      DateTime? justificationDeadline,
      DateTime requestDate,
      String reason,
      String? evidenceUrl,
      String? studentNote,
      String? principalNote,
      Student student});

  $StudentCopyWith<$Res> get student;
}

/// @nodoc
class _$PermissionCopyWithImpl<$Res, $Val extends Permission>
    implements $PermissionCopyWith<$Res> {
  _$PermissionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? approvalDate = freezed,
    Object? justificationDeadline = freezed,
    Object? requestDate = null,
    Object? reason = null,
    Object? evidenceUrl = freezed,
    Object? studentNote = freezed,
    Object? principalNote = freezed,
    Object? student = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PermissionStatus,
      approvalDate: freezed == approvalDate
          ? _value.approvalDate
          : approvalDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      justificationDeadline: freezed == justificationDeadline
          ? _value.justificationDeadline
          : justificationDeadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      requestDate: null == requestDate
          ? _value.requestDate
          : requestDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      evidenceUrl: freezed == evidenceUrl
          ? _value.evidenceUrl
          : evidenceUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      studentNote: freezed == studentNote
          ? _value.studentNote
          : studentNote // ignore: cast_nullable_to_non_nullable
              as String?,
      principalNote: freezed == principalNote
          ? _value.principalNote
          : principalNote // ignore: cast_nullable_to_non_nullable
              as String?,
      student: null == student
          ? _value.student
          : student // ignore: cast_nullable_to_non_nullable
              as Student,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StudentCopyWith<$Res> get student {
    return $StudentCopyWith<$Res>(_value.student, (value) {
      return _then(_value.copyWith(student: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PermissionImplCopyWith<$Res>
    implements $PermissionCopyWith<$Res> {
  factory _$$PermissionImplCopyWith(
          _$PermissionImpl value, $Res Function(_$PermissionImpl) then) =
      __$$PermissionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      PermissionStatus status,
      DateTime? approvalDate,
      DateTime? justificationDeadline,
      DateTime requestDate,
      String reason,
      String? evidenceUrl,
      String? studentNote,
      String? principalNote,
      Student student});

  @override
  $StudentCopyWith<$Res> get student;
}

/// @nodoc
class __$$PermissionImplCopyWithImpl<$Res>
    extends _$PermissionCopyWithImpl<$Res, _$PermissionImpl>
    implements _$$PermissionImplCopyWith<$Res> {
  __$$PermissionImplCopyWithImpl(
      _$PermissionImpl _value, $Res Function(_$PermissionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? approvalDate = freezed,
    Object? justificationDeadline = freezed,
    Object? requestDate = null,
    Object? reason = null,
    Object? evidenceUrl = freezed,
    Object? studentNote = freezed,
    Object? principalNote = freezed,
    Object? student = null,
  }) {
    return _then(_$PermissionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PermissionStatus,
      approvalDate: freezed == approvalDate
          ? _value.approvalDate
          : approvalDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      justificationDeadline: freezed == justificationDeadline
          ? _value.justificationDeadline
          : justificationDeadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      requestDate: null == requestDate
          ? _value.requestDate
          : requestDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      evidenceUrl: freezed == evidenceUrl
          ? _value.evidenceUrl
          : evidenceUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      studentNote: freezed == studentNote
          ? _value.studentNote
          : studentNote // ignore: cast_nullable_to_non_nullable
              as String?,
      principalNote: freezed == principalNote
          ? _value.principalNote
          : principalNote // ignore: cast_nullable_to_non_nullable
              as String?,
      student: null == student
          ? _value.student
          : student // ignore: cast_nullable_to_non_nullable
              as Student,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PermissionImpl implements _Permission {
  const _$PermissionImpl(
      {required this.id,
      required this.status,
      required this.approvalDate,
      required this.justificationDeadline,
      required this.requestDate,
      required this.reason,
      required this.evidenceUrl,
      required this.studentNote,
      required this.principalNote,
      required this.student});

  factory _$PermissionImpl.fromJson(Map<String, dynamic> json) =>
      _$$PermissionImplFromJson(json);

  @override
  final int id;
  @override
  final PermissionStatus status;
  @override
  final DateTime? approvalDate;
  @override
  final DateTime? justificationDeadline;
  @override
  final DateTime requestDate;
  @override
  final String reason;
  @override
  final String? evidenceUrl;
  @override
  final String? studentNote;
  @override
  final String? principalNote;
  @override
  final Student student;

  @override
  String toString() {
    return 'Permission(id: $id, status: $status, approvalDate: $approvalDate, justificationDeadline: $justificationDeadline, requestDate: $requestDate, reason: $reason, evidenceUrl: $evidenceUrl, studentNote: $studentNote, principalNote: $principalNote, student: $student)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PermissionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.approvalDate, approvalDate) ||
                other.approvalDate == approvalDate) &&
            (identical(other.justificationDeadline, justificationDeadline) ||
                other.justificationDeadline == justificationDeadline) &&
            (identical(other.requestDate, requestDate) ||
                other.requestDate == requestDate) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.evidenceUrl, evidenceUrl) ||
                other.evidenceUrl == evidenceUrl) &&
            (identical(other.studentNote, studentNote) ||
                other.studentNote == studentNote) &&
            (identical(other.principalNote, principalNote) ||
                other.principalNote == principalNote) &&
            (identical(other.student, student) || other.student == student));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      status,
      approvalDate,
      justificationDeadline,
      requestDate,
      reason,
      evidenceUrl,
      studentNote,
      principalNote,
      student);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PermissionImplCopyWith<_$PermissionImpl> get copyWith =>
      __$$PermissionImplCopyWithImpl<_$PermissionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PermissionImplToJson(
      this,
    );
  }
}

abstract class _Permission implements Permission {
  const factory _Permission(
      {required final int id,
      required final PermissionStatus status,
      required final DateTime? approvalDate,
      required final DateTime? justificationDeadline,
      required final DateTime requestDate,
      required final String reason,
      required final String? evidenceUrl,
      required final String? studentNote,
      required final String? principalNote,
      required final Student student}) = _$PermissionImpl;

  factory _Permission.fromJson(Map<String, dynamic> json) =
      _$PermissionImpl.fromJson;

  @override
  int get id;
  @override
  PermissionStatus get status;
  @override
  DateTime? get approvalDate;
  @override
  DateTime? get justificationDeadline;
  @override
  DateTime get requestDate;
  @override
  String get reason;
  @override
  String? get evidenceUrl;
  @override
  String? get studentNote;
  @override
  String? get principalNote;
  @override
  Student get student;
  @override
  @JsonKey(ignore: true)
  _$$PermissionImplCopyWith<_$PermissionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
