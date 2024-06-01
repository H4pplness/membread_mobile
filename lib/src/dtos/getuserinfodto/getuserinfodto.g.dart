// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'getuserinfodto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetUserInfoDTOImpl _$$GetUserInfoDTOImplFromJson(Map<String, dynamic> json) =>
    _$GetUserInfoDTOImpl(
      id: json['id'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      userName: json['userName'] as String?,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$$GetUserInfoDTOImplToJson(
        _$GetUserInfoDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'userName': instance.userName,
      'avatar': instance.avatar,
    };
