import 'package:freezed_annotation/freezed_annotation.dart';

part 'lessoninfodto.freezed.dart';
part 'lessoninfodto.g.dart';

@freezed
class LessonInfoDTO with _$LessonInfoDTO{
  const factory LessonInfoDTO({
    int? id,
    String? title,
    String? description,
    String? type
  }) = _LessonDTO;

  factory LessonInfoDTO.fromJson(Map<String,dynamic> json) => _$LessonInfoDTOFromJson(json);
}