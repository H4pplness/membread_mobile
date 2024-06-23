
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../lesson_type_dto/vocabularydto/vocabularydto.dart';

part 'create_vocabulary_lesson_dto.g.dart';
part 'create_vocabulary_lesson_dto.freezed.dart';

@freezed
class CreateVocabularyLessonDTO with _$CreateVocabularyLessonDTO {
  const factory CreateVocabularyLessonDTO({
    String? title,
    String? description,
    int? courseId,
    List<VocabularyDTO>? listVocabulary
  }) = _CreateVocabularyLessonDTO;

  factory CreateVocabularyLessonDTO.fromJson(Map<String, dynamic> json) => _$CreateVocabularyLessonDTOFromJson(json);
}