import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:membreadflutter/src/domain/models/multichoice.dart';
import 'package:membreadflutter/src/domain/models/short_answer.dart';
import 'package:membreadflutter/src/domain/models/test_lesson.dart';
import 'package:membreadflutter/src/domain/models/vocabulary.dart';
import 'package:membreadflutter/src/domain/models/vocabulary_lesson.dart';
import 'package:membreadflutter/src/domain/repositories/course_repository/update_progress_lesson/update_progress_lesson.dart';
import 'package:membreadflutter/src/dtos/learningdto/multichoicedto/multichoicedto.dart';
import 'package:membreadflutter/src/dtos/learningdto/shortanswerdto/shortanswerdto.dart';
import 'package:membreadflutter/src/dtos/lessondto/lessonvocabularydto.dart';
import 'package:membreadflutter/src/dtos/lessondto/test_lesson/lessontestdto.dart';
import 'package:membreadflutter/src/dtos/progressvocabularydto/progress_vocabulary_dto.dart';
import 'package:membreadflutter/src/dtos/updateprogresslessondto/update_progress_lesson_vocabulary_dto.dart';
import '../../../../core/network.dart';
import '../../../models/learning.dart';
import '../../../models/lesson.dart';

class LessonProvider extends StateNotifier<Lesson?> {
  Lesson? lesson;
  final Ref ref;

  LessonProvider(this.ref) : super(null);

  fetchLesson(int lessonId) async {
    final dio = await ref.read(dioProviderWithAccessToken.future);
    Response response =
        await dio.get('/study/course/lesson?lesson_id=$lessonId');
    if (response.statusCode == 200) {
      final type = response.data['type'];
      switch (type) {
        case "vocabulary":
          final result = LessonVocabularyDTO.fromJson(response.data);
          final listLearning = result.listLearning?.map((vocabulary) {
            return Vocabulary(
                id: vocabulary.id,
                vocabulary: vocabulary.vocabulary,
                mean: vocabulary.mean,
                progress: vocabulary.progress ?? 0,
                needToReview: vocabulary.need_to_review?? false,
                lastUpdated: vocabulary.last_updated != null
                    ? DateFormat('yyyy-MM-dd HH:mm:ss.SSS')
                        .parse(vocabulary.last_updated!.replaceAll('T', ' '))
                    : null);
          }).toList();
          print("FETCHING VOCABULARY");
          state = VocabularyLesson(
              id: lessonId,
              title: result.title,
              description: result.description ?? "",
              listLearning: listLearning);
          break;
        case "test":
          final result = LessonTestDTO.fromJson(response.data);
          final listLearning = result.listLearning?.map((e) {
            if (e is MultiChoiceDTO) {
              return MultiChoice(
                  id: e.id,
                  question: e.question,
                  choice1: e.choice1,
                  choice2: e.choice2,
                  choice3: e.choice3,
                  choice4: e.choice4,
                  correctAnswer: e.correctAnswer,
                  progress: e.progress);
            }
            if (e is ShortAnswerDTO) {
              return ShortAnswer(
                  id: e.id,
                  question: e.question,
                  progress: e.progress,
                  shortAnswer: e.shortAnswer);
            }
            throw Exception();
          }).toList();
          print("FETCHING TEST");
          state = TestLesson(
              id: lessonId,
              title: result.title,
              description: result.description ?? "",
              listLearning: listLearning);
          break;
        default:
          throw Exception();
      }
    } else {
      throw Exception("Error : ${response.statusMessage}");
    }
  }

  updateProgress(
      List<Learning> learnings, int score, int course_id, int lesson_id) async {
    if (learnings is List<Vocabulary>) {
      List<ProgressVocabularyDTO> listUpdate = learnings
          .map((e) => ProgressVocabularyDTO(
              learning_id: e.id!,
              progress: e.progress,
              need_to_review: e.needToReview))
          .toList();
      UpdateProgressLessonVocabularyDTO updateProgress =
          UpdateProgressLessonVocabularyDTO(
              score: score,
              course_id: course_id,
              lesson_id: lesson_id,
              listVocabulary: listUpdate);
      await ref.read(updateProgressLessonProvider(updateProgress).future);
    }

    if (lesson != null) {
      lesson!.updateLearningList(learnings);
      state = lesson; // Cập nhật state với lesson mới
    }
  }
}

final getLessonProvider = StateNotifierProvider<LessonProvider, Lesson?>((ref) {
  return LessonProvider(ref);
});
