
import 'package:membreadflutter/src/dtos/edit_course_dto/edit_course_dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'course_edit_notifier.g.dart';

@riverpod
class CourseEditNotifier extends _$CourseEditNotifier {
  @override
  EditCourseDTO build(){
    return EditCourseDTO();
  }

  void setInitial(String? title,String? description){
    state = EditCourseDTO(title: title,description: description);
  }

  void setTitle(String? title){
    state = EditCourseDTO(title: title,description: state.description);
  }

  void setDescription(String? description){
    state = EditCourseDTO(title: state.title,description: description);
  }

}