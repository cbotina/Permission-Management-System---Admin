// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response_metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ResponseMetadata _$ResponseMetadataFromJson(Map<String, dynamic> json) {
  return _ResponseMetadata.fromJson(json);
}

/// @nodoc
mixin _$ResponseMetadata {
  int get totalItems => throw _privateConstructorUsedError;
  int get itemCount => throw _privateConstructorUsedError;
  int get itemsPerPage => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResponseMetadataCopyWith<ResponseMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseMetadataCopyWith<$Res> {
  factory $ResponseMetadataCopyWith(
          ResponseMetadata value, $Res Function(ResponseMetadata) then) =
      _$ResponseMetadataCopyWithImpl<$Res, ResponseMetadata>;
  @useResult
  $Res call(
      {int totalItems,
      int itemCount,
      int itemsPerPage,
      int totalPages,
      int currentPage});
}

/// @nodoc
class _$ResponseMetadataCopyWithImpl<$Res, $Val extends ResponseMetadata>
    implements $ResponseMetadataCopyWith<$Res> {
  _$ResponseMetadataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalItems = null,
    Object? itemCount = null,
    Object? itemsPerPage = null,
    Object? totalPages = null,
    Object? currentPage = null,
  }) {
    return _then(_value.copyWith(
      totalItems: null == totalItems
          ? _value.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
      itemCount: null == itemCount
          ? _value.itemCount
          : itemCount // ignore: cast_nullable_to_non_nullable
              as int,
      itemsPerPage: null == itemsPerPage
          ? _value.itemsPerPage
          : itemsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResponseMetadataImplCopyWith<$Res>
    implements $ResponseMetadataCopyWith<$Res> {
  factory _$$ResponseMetadataImplCopyWith(_$ResponseMetadataImpl value,
          $Res Function(_$ResponseMetadataImpl) then) =
      __$$ResponseMetadataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalItems,
      int itemCount,
      int itemsPerPage,
      int totalPages,
      int currentPage});
}

/// @nodoc
class __$$ResponseMetadataImplCopyWithImpl<$Res>
    extends _$ResponseMetadataCopyWithImpl<$Res, _$ResponseMetadataImpl>
    implements _$$ResponseMetadataImplCopyWith<$Res> {
  __$$ResponseMetadataImplCopyWithImpl(_$ResponseMetadataImpl _value,
      $Res Function(_$ResponseMetadataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalItems = null,
    Object? itemCount = null,
    Object? itemsPerPage = null,
    Object? totalPages = null,
    Object? currentPage = null,
  }) {
    return _then(_$ResponseMetadataImpl(
      totalItems: null == totalItems
          ? _value.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
      itemCount: null == itemCount
          ? _value.itemCount
          : itemCount // ignore: cast_nullable_to_non_nullable
              as int,
      itemsPerPage: null == itemsPerPage
          ? _value.itemsPerPage
          : itemsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResponseMetadataImpl implements _ResponseMetadata {
  const _$ResponseMetadataImpl(
      {required this.totalItems,
      required this.itemCount,
      required this.itemsPerPage,
      required this.totalPages,
      required this.currentPage});

  factory _$ResponseMetadataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResponseMetadataImplFromJson(json);

  @override
  final int totalItems;
  @override
  final int itemCount;
  @override
  final int itemsPerPage;
  @override
  final int totalPages;
  @override
  final int currentPage;

  @override
  String toString() {
    return 'ResponseMetadata(totalItems: $totalItems, itemCount: $itemCount, itemsPerPage: $itemsPerPage, totalPages: $totalPages, currentPage: $currentPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseMetadataImpl &&
            (identical(other.totalItems, totalItems) ||
                other.totalItems == totalItems) &&
            (identical(other.itemCount, itemCount) ||
                other.itemCount == itemCount) &&
            (identical(other.itemsPerPage, itemsPerPage) ||
                other.itemsPerPage == itemsPerPage) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, totalItems, itemCount,
      itemsPerPage, totalPages, currentPage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseMetadataImplCopyWith<_$ResponseMetadataImpl> get copyWith =>
      __$$ResponseMetadataImplCopyWithImpl<_$ResponseMetadataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseMetadataImplToJson(
      this,
    );
  }
}

abstract class _ResponseMetadata implements ResponseMetadata {
  const factory _ResponseMetadata(
      {required final int totalItems,
      required final int itemCount,
      required final int itemsPerPage,
      required final int totalPages,
      required final int currentPage}) = _$ResponseMetadataImpl;

  factory _ResponseMetadata.fromJson(Map<String, dynamic> json) =
      _$ResponseMetadataImpl.fromJson;

  @override
  int get totalItems;
  @override
  int get itemCount;
  @override
  int get itemsPerPage;
  @override
  int get totalPages;
  @override
  int get currentPage;
  @override
  @JsonKey(ignore: true)
  _$$ResponseMetadataImplCopyWith<_$ResponseMetadataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
