// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lessoninfodto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LessonDTOImpl _$$LessonDTOImplFromJson(Map<String, dynamic> json) =>
    _$LessonDTOImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$LessonDTOImplToJson(_$LessonDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
    };
