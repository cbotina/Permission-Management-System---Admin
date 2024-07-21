// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthState {
  AuthResult get authResult => throw _privateConstructorUsedError;
  int? get userId => throw _privateConstructorUsedError;
  int? get entityId => throw _privateConstructorUsedError;
  int? get periodId => throw _privateConstructorUsedError;
  UserRole? get userRole => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call(
      {AuthResult authResult,
      int? userId,
      int? entityId,
      int? periodId,
      UserRole? userRole});
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authResult = null,
    Object? userId = freezed,
    Object? entityId = freezed,
    Object? periodId = freezed,
    Object? userRole = freezed,
  }) {
    return _then(_value.copyWith(
      authResult: null == authResult
          ? _value.authResult
          : authResult // ignore: cast_nullable_to_non_nullable
              as AuthResult,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      entityId: freezed == entityId
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as int?,
      periodId: freezed == periodId
          ? _value.periodId
          : periodId // ignore: cast_nullable_to_non_nullable
              as int?,
      userRole: freezed == userRole
          ? _value.userRole
          : userRole // ignore: cast_nullable_to_non_nullable
              as UserRole?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthStateImplCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$AuthStateImplCopyWith(
          _$AuthStateImpl value, $Res Function(_$AuthStateImpl) then) =
      __$$AuthStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AuthResult authResult,
      int? userId,
      int? entityId,
      int? periodId,
      UserRole? userRole});
}

/// @nodoc
class __$$AuthStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateImpl>
    implements _$$AuthStateImplCopyWith<$Res> {
  __$$AuthStateImplCopyWithImpl(
      _$AuthStateImpl _value, $Res Function(_$AuthStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authResult = null,
    Object? userId = freezed,
    Object? entityId = freezed,
    Object? periodId = freezed,
    Object? userRole = freezed,
  }) {
    return _then(_$AuthStateImpl(
      null == authResult
          ? _value.authResult
          : authResult // ignore: cast_nullable_to_non_nullable
              as AuthResult,
      freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      freezed == entityId
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as int?,
      freezed == periodId
          ? _value.periodId
          : periodId // ignore: cast_nullable_to_non_nullable
              as int?,
      freezed == userRole
          ? _value.userRole
          : userRole // ignore: cast_nullable_to_non_nullable
              as UserRole?,
    ));
  }
}

/// @nodoc

class _$AuthStateImpl implements _AuthState {
  _$AuthStateImpl(this.authResult, this.userId, this.entityId, this.periodId,
      this.userRole);

  @override
  final AuthResult authResult;
  @override
  final int? userId;
  @override
  final int? entityId;
  @override
  final int? periodId;
  @override
  final UserRole? userRole;

  @override
  String toString() {
    return 'AuthState(authResult: $authResult, userId: $userId, entityId: $entityId, periodId: $periodId, userRole: $userRole)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateImpl &&
            (identical(other.authResult, authResult) ||
                other.authResult == authResult) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.entityId, entityId) ||
                other.entityId == entityId) &&
            (identical(other.periodId, periodId) ||
                other.periodId == periodId) &&
            (identical(other.userRole, userRole) ||
                other.userRole == userRole));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, authResult, userId, entityId, periodId, userRole);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      __$$AuthStateImplCopyWithImpl<_$AuthStateImpl>(this, _$identity);
}

abstract class _AuthState implements AuthState {
  factory _AuthState(
      final AuthResult authResult,
      final int? userId,
      final int? entityId,
      final int? periodId,
      final UserRole? userRole) = _$AuthStateImpl;

  @override
  AuthResult get authResult;
  @override
  int? get userId;
  @override
  int? get entityId;
  @override
  int? get periodId;
  @override
  UserRole? get userRole;
  @override
  @JsonKey(ignore: true)
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
