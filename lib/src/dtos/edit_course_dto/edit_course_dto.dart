
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_course_dto.g.dart';
part 'edit_course_dto.freezed.dart';

@freezed
class EditCourseDTO with _$EditCourseDTO {
  const factory EditCourseDTO({
    String? title,
    String? description,
    int? courseId,
}) = _EditCourseDTO;

  factory EditCourseDTO.fromJson(Map<String,dynamic> json) => _$EditCourseDTOFromJson(json);
}