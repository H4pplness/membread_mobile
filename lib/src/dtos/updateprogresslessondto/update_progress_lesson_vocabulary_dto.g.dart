// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_progress_lesson_vocabulary_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdateProgressLessonVocabularyDTOImpl
    _$$UpdateProgressLessonVocabularyDTOImplFromJson(
            Map<String, dynamic> json) =>
        _$UpdateProgressLessonVocabularyDTOImpl(
          score: (json['score'] as num?)?.toInt() ?? 0,
          listVocabulary: (json['listVocabulary'] as List<dynamic>?)
                  ?.map((e) =>
                      ProgressVocabularyDTO.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              const [],
          course_id: (json['course_id'] as num?)?.toInt(),
          lesson_id: (json['lesson_id'] as num?)?.toInt(),
        );

Map<String, dynamic> _$$UpdateProgressLessonVocabularyDTOImplToJson(
        _$UpdateProgressLessonVocabularyDTOImpl instance) =>
    <String, dynamic>{
      'score': instance.score,
      'listVocabulary': instance.listVocabulary,
      'course_id': instance.course_id,
      'lesson_id': instance.lesson_id,
    };
