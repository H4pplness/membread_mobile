import 'package:freezed_annotation/freezed_annotation.dart';

part 'vocabularydto.freezed.dart';
part 'vocabularydto.g.dart';

@freezed
class VocabularyDTO with _$VocabularyDTO {
  const factory VocabularyDTO({
    int? id,
    required String vocabulary,
    required String mean,
    int? progress
  }) = _VocbularyDTO;

  factory VocabularyDTO.fromJson(Map<String, dynamic> json) => _$VocabularyDTOFromJson(json);
}