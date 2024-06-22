// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'getcourseinfodto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetCourseInfoDTOImpl _$$GetCourseInfoDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$GetCourseInfoDTOImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      listLesson: (json['listLesson'] as List<dynamic>?)
          ?.map((e) => LessonInfoDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentLesson: (json['currentLesson'] as num?)?.toInt(),
      author: json['author'] == null
          ? null
          : GetUserInfoDTO.fromJson(json['author'] as Map<String, dynamic>),
      canStudy: json['canStudy'] as bool?,
      avatar: json['avatar'] as String?,
      rating: json['rating'] as String?,
      numberOfParticipant: (json['numberOfParticipant'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$GetCourseInfoDTOImplToJson(
        _$GetCourseInfoDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'listLesson': instance.listLesson,
      'currentLesson': instance.currentLesson,
      'author': instance.author,
      'canStudy': instance.canStudy,
      'avatar': instance.avatar,
      'rating': instance.rating,
      'numberOfParticipant': instance.numberOfParticipant,
    };
