
import 'package:membreadflutter/src/domain/models/learning.dart';
import 'package:membreadflutter/src/dtos/create_lesson_dto/create_vocabulary_lesson_dto/create_vocabulary_lesson_dto.dart';
import 'package:membreadflutter/src/dtos/vocabularydto/vocabularydto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/models/lesson.dart';

part 'create_lesson_notifier.g.dart';

@riverpod
class CreateLessonNotifier extends _$CreateLessonNotifier{
  @override
  CreateVocabularyLessonDTO build()
  {
    return CreateVocabularyLessonDTO();
  }

  void setTitleAndDescription(String title,String? description,int courseId)
  {
    state = CreateVocabularyLessonDTO(title: title,description: description,courseId: courseId);
  }

  void setListLearning(List<VocabularyDTO> listLearning)
  {
    state = CreateVocabularyLessonDTO(
      title : state.title,
      description: state.description,
      listVocabulary: listLearning
    );
  }
}