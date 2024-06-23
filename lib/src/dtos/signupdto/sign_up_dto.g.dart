// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignUpInfoImpl _$$SignUpInfoImplFromJson(Map<String, dynamic> json) =>
    _$SignUpInfoImpl(
      email: json['email'] as String,
      password: json['password'] as String,
      username: json['username'] as String,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
    );

Map<String, dynamic> _$$SignUpInfoImplToJson(_$SignUpInfoImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'username': instance.username,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };
