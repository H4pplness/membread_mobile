import 'package:freezed_annotation/freezed_annotation.dart';

part 'createcoursedto.freezed.dart';
part 'createcoursedto.g.dart';

@freezed
class CreateCourseDTO with _$CreateCourseDTO {
  const factory CreateCourseDTO({
    required String title,
    String? description,
    int? author_id
  }) = _CreateCourseDTO ;

  factory CreateCourseDTO.fromJson(Map<String, dynamic> json) => _$CreateCourseDTOFromJson(json);
}