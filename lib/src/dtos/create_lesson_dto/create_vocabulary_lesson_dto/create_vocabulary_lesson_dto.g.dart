// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_vocabulary_lesson_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateVocabularyLessonDTOImpl _$$CreateVocabularyLessonDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateVocabularyLessonDTOImpl(
      title: json['title'] as String?,
      description: json['description'] as String?,
      courseId: (json['courseId'] as num?)?.toInt(),
      listVocabulary: (json['listVocabulary'] as List<dynamic>?)
          ?.map((e) => VocabularyDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CreateVocabularyLessonDTOImplToJson(
        _$CreateVocabularyLessonDTOImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'courseId': instance.courseId,
      'listVocabulary': instance.listVocabulary,
    };
