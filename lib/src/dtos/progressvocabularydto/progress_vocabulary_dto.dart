import 'package:freezed_annotation/freezed_annotation.dart';

part 'progress_vocabulary_dto.g.dart';
part 'progress_vocabulary_dto.freezed.dart';

@freezed
class ProgressVocabularyDTO with _$ProgressVocabularyDTO {
  const factory ProgressVocabularyDTO({
    required int learning_id,
    required int progress
  }) = _ProgressVocabularyDTO;

  factory ProgressVocabularyDTO.fromJson(Map<String , dynamic> json) => _$ProgressVocabularyDTOFromJson(json);
}