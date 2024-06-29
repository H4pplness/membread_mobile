// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_vocabulary_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProgressVocabularyDTOImpl _$$ProgressVocabularyDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$ProgressVocabularyDTOImpl(
      learning_id: (json['learning_id'] as num).toInt(),
      progress: (json['progress'] as num).toInt(),
      need_to_review: json['need_to_review'] as bool,
    );

Map<String, dynamic> _$$ProgressVocabularyDTOImplToJson(
        _$ProgressVocabularyDTOImpl instance) =>
    <String, dynamic>{
      'learning_id': instance.learning_id,
      'progress': instance.progress,
      'need_to_review': instance.need_to_review,
    };
