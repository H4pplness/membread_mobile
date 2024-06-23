
import 'package:membreadflutter/src/domain/models/learning.dart';
import 'package:membreadflutter/src/dtos/create_lesson_dto/create_lesson_dto.dart';
import 'package:membreadflutter/src/dtos/create_lesson_dto/create_vocabulary_lesson_dto/create_vocabulary_lesson_dto.dart';
import 'package:membreadflutter/src/dtos/lesson_type_dto/learning_dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../../dtos/lesson_type_dto/vocabularydto/vocabularydto.dart';

part 'create_lesson_notifier.g.dart';

@riverpod
class CreateLessonNotifier extends _$CreateLessonNotifier{
  @override
  CreateLessonDTO build()
  {
    return CreateLessonDTO();
  }

  void setTitleAndDescription(String title,String? description,int courseId)
  {
    state = CreateLessonDTO(title: title,description: description,courseId: courseId);
  }

  void setListLearning(List<LearningDTO> listLearning)
  {
    state = CreateLessonDTO(
      title : state.title,
      description: state.description,
      courseId: state.courseId,
      listLearning: listLearning
    );
  }

  void addLearning(LearningDTO learning){
    if(state.listLearning==null){
      state = CreateLessonDTO(
          title : state.title,
          description: state.description,
          courseId: state.courseId,
          listLearning: [learning]
      );
    }else{
      state = CreateLessonDTO(
          title : state.title,
          description: state.description,
          courseId: state.courseId,
          listLearning: [...state.listLearning??[],learning]
      );
    }
  }
}