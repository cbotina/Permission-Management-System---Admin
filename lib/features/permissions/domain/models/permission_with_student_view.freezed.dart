// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'permission_with_student_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PermissionWithStudentView _$PermissionWithStudentViewFromJson(
    Map<String, dynamic> json) {
  return _PermissionWithStudentView.fromJson(json);
}

/// @nodoc
mixin _$PermissionWithStudentView {
  int get permissionId => throw _privateConstructorUsedError;
  int get studentId => throw _privateConstructorUsedError;
  DateTime get requestDate => throw _privateConstructorUsedError;
  String get student => throw _privateConstructorUsedError;
  String get reason => throw _privateConstructorUsedError;
  PermissionStatus get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PermissionWithStudentViewCopyWith<PermissionWithStudentView> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermissionWithStudentViewCopyWith<$Res> {
  factory $PermissionWithStudentViewCopyWith(PermissionWithStudentView value,
          $Res Function(PermissionWithStudentView) then) =
      _$PermissionWithStudentViewCopyWithImpl<$Res, PermissionWithStudentView>;
  @useResult
  $Res call(
      {int permissionId,
      int studentId,
      DateTime requestDate,
      String student,
      String reason,
      PermissionStatus status});
}

/// @nodoc
class _$PermissionWithStudentViewCopyWithImpl<$Res,
        $Val extends PermissionWithStudentView>
    implements $PermissionWithStudentViewCopyWith<$Res> {
  _$PermissionWithStudentViewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? permissionId = null,
    Object? studentId = null,
    Object? requestDate = null,
    Object? student = null,
    Object? reason = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      permissionId: null == permissionId
          ? _value.permissionId
          : permissionId // ignore: cast_nullable_to_non_nullable
              as int,
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as int,
      requestDate: null == requestDate
          ? _value.requestDate
          : requestDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      student: null == student
          ? _value.student
          : student // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PermissionStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PermissionWithStudentViewImplCopyWith<$Res>
    implements $PermissionWithStudentViewCopyWith<$Res> {
  factory _$$PermissionWithStudentViewImplCopyWith(
          _$PermissionWithStudentViewImpl value,
          $Res Function(_$PermissionWithStudentViewImpl) then) =
      __$$PermissionWithStudentViewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int permissionId,
      int studentId,
      DateTime requestDate,
      String student,
      String reason,
      PermissionStatus status});
}

/// @nodoc
class __$$PermissionWithStudentViewImplCopyWithImpl<$Res>
    extends _$PermissionWithStudentViewCopyWithImpl<$Res,
        _$PermissionWithStudentViewImpl>
    implements _$$PermissionWithStudentViewImplCopyWith<$Res> {
  __$$PermissionWithStudentViewImplCopyWithImpl(
      _$PermissionWithStudentViewImpl _value,
      $Res Function(_$PermissionWithStudentViewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? permissionId = null,
    Object? studentId = null,
    Object? requestDate = null,
    Object? student = null,
    Object? reason = null,
    Object? status = null,
  }) {
    return _then(_$PermissionWithStudentViewImpl(
      permissionId: null == permissionId
          ? _value.permissionId
          : permissionId // ignore: cast_nullable_to_non_nullable
              as int,
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as int,
      requestDate: null == requestDate
          ? _value.requestDate
          : requestDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      student: null == student
          ? _value.student
          : student // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PermissionStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PermissionWithStudentViewImpl implements _PermissionWithStudentView {
  const _$PermissionWithStudentViewImpl(
      {required this.permissionId,
      required this.studentId,
      required this.requestDate,
      required this.student,
      required this.reason,
      required this.status});

  factory _$PermissionWithStudentViewImpl.fromJson(Map<String, dynamic> json) =>
      _$$PermissionWithStudentViewImplFromJson(json);

  @override
  final int permissionId;
  @override
  final int studentId;
  @override
  final DateTime requestDate;
  @override
  final String student;
  @override
  final String reason;
  @override
  final PermissionStatus status;

  @override
  String toString() {
    return 'PermissionWithStudentView(permissionId: $permissionId, studentId: $studentId, requestDate: $requestDate, student: $student, reason: $reason, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PermissionWithStudentViewImpl &&
            (identical(other.permissionId, permissionId) ||
                other.permissionId == permissionId) &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.requestDate, requestDate) ||
                other.requestDate == requestDate) &&
            (identical(other.student, student) || other.student == student) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, permissionId, studentId,
      requestDate, student, reason, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PermissionWithStudentViewImplCopyWith<_$PermissionWithStudentViewImpl>
      get copyWith => __$$PermissionWithStudentViewImplCopyWithImpl<
          _$PermissionWithStudentViewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PermissionWithStudentViewImplToJson(
      this,
    );
  }
}

abstract class _PermissionWithStudentView implements PermissionWithStudentView {
  const factory _PermissionWithStudentView(
          {required final int permissionId,
          required final int studentId,
          required final DateTime requestDate,
          required final String student,
          required final String reason,
          required final PermissionStatus status}) =
      _$PermissionWithStudentViewImpl;

  factory _PermissionWithStudentView.fromJson(Map<String, dynamic> json) =
      _$PermissionWithStudentViewImpl.fromJson;

  @override
  int get permissionId;
  @override
  int get studentId;
  @override
  DateTime get requestDate;
  @override
  String get student;
  @override
  String get reason;
  @override
  PermissionStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$PermissionWithStudentViewImplCopyWith<_$PermissionWithStudentViewImpl>
      get copyWith => throw _privateConstructorUsedError;
}
