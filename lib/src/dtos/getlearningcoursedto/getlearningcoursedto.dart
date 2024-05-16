import 'package:freezed_annotation/freezed_annotation.dart';

part 'getlearningcoursedto.freezed.dart';
part 'getlearningcoursedto.g.dart';

@freezed
class GetLearningCourseDTO with _$GetLearningCourseDTO {
  const factory GetLearningCourseDTO({
    int? id,
    required String title,
    String? description,
    double? rating
  }) = _GetLearningCourseDTO;

  factory GetLearningCourseDTO.fromJson(Map<String,dynamic> json) => _$GetLearningCourseDTOFromJson(json);
}