// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'createcoursedto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateCourseDTOImpl _$$CreateCourseDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateCourseDTOImpl(
      title: json['title'] as String,
      description: json['description'] as String?,
      author_id: (json['author_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$CreateCourseDTOImplToJson(
        _$CreateCourseDTOImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'author_id': instance.author_id,
    };
