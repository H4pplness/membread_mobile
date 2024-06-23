import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:membreadflutter/src/dtos/lesson_type_dto/learning_dto.dart';

part 'vocabularydto.freezed.dart';
part 'vocabularydto.g.dart';

@freezed
class VocabularyDTO extends LearningDTO with _$VocabularyDTO {
  const factory VocabularyDTO({
    int? id,
    String? vocabulary,
    String? mean,
    int? progress
  }) = _VocbularyDTO;

  factory VocabularyDTO.fromJson(Map<String, dynamic> json) => _$VocabularyDTOFromJson(json);
}