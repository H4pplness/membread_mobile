
import 'package:membreadflutter/src/dtos/updateprogresslessondto/update_progress_lesson_vocabulary_dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../dtos/progressvocabularydto/progress_vocabulary_dto.dart';

part 'result_notifier.g.dart';

@riverpod
class ResultNotifier extends _$ResultNotifier {
  @override
  UpdateProgressLessonVocabularyDTO build(){
    return const UpdateProgressLessonVocabularyDTO();
  }

  void setCourseId(int courseId){
    state = UpdateProgressLessonVocabularyDTO(course_id: courseId);
  }

  void setResult(int result){
    state = UpdateProgressLessonVocabularyDTO(course_id: state.course_id,score: result,listVocabulary: state.listVocabulary);
  }

  void setLearningProgress(List<ProgressVocabularyDTO> listLearning){
    state = UpdateProgressLessonVocabularyDTO(course_id: state.course_id,score: state.score,listVocabulary: listLearning);
  }
}