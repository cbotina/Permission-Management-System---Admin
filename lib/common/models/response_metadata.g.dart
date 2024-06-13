// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResponseMetadataImpl _$$ResponseMetadataImplFromJson(
        Map<String, dynamic> json) =>
    _$ResponseMetadataImpl(
      totalItems: (json['totalItems'] as num).toInt(),
      itemCount: (json['itemCount'] as num).toInt(),
      itemsPerPage: (json['itemsPerPage'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
      currentPage: (json['currentPage'] as num).toInt(),
    );

Map<String, dynamic> _$$ResponseMetadataImplToJson(
        _$ResponseMetadataImpl instance) =>
    <String, dynamic>{
      'totalItems': instance.totalItems,
      'itemCount': instance.itemCount,
      'itemsPerPage': instance.itemsPerPage,
      'totalPages': instance.totalPages,
      'currentPage': instance.currentPage,
    };
