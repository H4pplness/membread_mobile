import 'package:freezed_annotation/freezed_annotation.dart';

import '../lessoninfodto/lessoninfodto.dart';

part 'getcourseinfodto.freezed.dart';
part 'getcourseinfodto.g.dart';

@freezed
class GetCourseInfoDTO with _$GetCourseInfoDTO{
  const factory GetCourseInfoDTO({
    int? id,
    String? title,
    String? description,
    List<LessonInfoDTO>? listLesson,
    int? currentLesson
  }) = _GetCourseInfoDTO;

  factory GetCourseInfoDTO.fromJson(Map<String,dynamic> json) => _$GetCourseInfoDTOFromJson(json);
}

