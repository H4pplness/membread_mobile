// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userscore_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserScoreDTOImpl _$$UserScoreDTOImplFromJson(Map<String, dynamic> json) =>
    _$UserScoreDTOImpl(
      score: (json['score'] as num?)?.toInt(),
      userInfo: json['userInfo'] == null
          ? null
          : GetUserInfoDTO.fromJson(json['userInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserScoreDTOImplToJson(_$UserScoreDTOImpl instance) =>
    <String, dynamic>{
      'score': instance.score,
      'userInfo': instance.userInfo,
    };
