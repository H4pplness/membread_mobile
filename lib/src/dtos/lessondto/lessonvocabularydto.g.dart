// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lessonvocabularydto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LessonVocabularyDTOImpl _$$LessonVocabularyDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$LessonVocabularyDTOImpl(
      title: json['title'] as String,
      description: json['description'] as String,
      listVocabulary: (json['listVocabulary'] as List<dynamic>?)
          ?.map((e) => VocabularyDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$LessonVocabularyDTOImplToJson(
        _$LessonVocabularyDTOImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'listVocabulary': instance.listVocabulary,
    };
