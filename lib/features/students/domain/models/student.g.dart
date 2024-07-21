// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StudentImpl _$$StudentImplFromJson(Map<String, dynamic> json) =>
    _$StudentImpl(
      id: (json['id'] as num).toInt(),
      cc: json['cc'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      gender: $enumDecode(_$GenderEnumMap, json['gender']),
    );

Map<String, dynamic> _$$StudentImplToJson(_$StudentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cc': instance.cc,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'gender': _$GenderEnumMap[instance.gender]!,
    };

const _$GenderEnumMap = {
  Gender.male: 'M',
  Gender.female: 'F',
};
