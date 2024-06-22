import 'package:freezed_annotation/freezed_annotation.dart';
import '../vocabularydto/vocabularydto.dart';

part 'lessonvocabularydto.freezed.dart';
part 'lessonvocabularydto.g.dart';

@freezed
class LessonVocabularyDTO with _$LessonVocabularyDTO{
  const factory LessonVocabularyDTO({
    required String title,
    String? description,
    List<VocabularyDTO>? listLearning
  }) = _LessonVocabularyDTO;

  factory LessonVocabularyDTO.fromJson(Map<String, dynamic> json) => _$LessonVocabularyDTOFromJson(json);
}