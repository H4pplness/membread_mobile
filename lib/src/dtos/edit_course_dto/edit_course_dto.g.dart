// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_course_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EditCourseDTOImpl _$$EditCourseDTOImplFromJson(Map<String, dynamic> json) =>
    _$EditCourseDTOImpl(
      title: json['title'] as String?,
      description: json['description'] as String?,
      courseId: (json['courseId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$EditCourseDTOImplToJson(_$EditCourseDTOImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'courseId': instance.courseId,
    };
