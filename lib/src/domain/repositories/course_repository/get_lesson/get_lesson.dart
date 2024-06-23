import 'package:dio/dio.dart';
import 'package:membreadflutter/src/domain/models/multichoice.dart';
import 'package:membreadflutter/src/domain/models/short_answer.dart';
import 'package:membreadflutter/src/domain/models/test_lesson.dart';
import 'package:membreadflutter/src/domain/models/vocabulary.dart';
import 'package:membreadflutter/src/domain/models/vocabulary_lesson.dart';
import 'package:membreadflutter/src/dtos/learningdto/multichoicedto/multichoicedto.dart';
import 'package:membreadflutter/src/dtos/learningdto/shortanswerdto/shortanswerdto.dart';
import 'package:membreadflutter/src/dtos/lessondto/lessonvocabularydto.dart';
import 'package:membreadflutter/src/dtos/lessondto/test_lesson/lessontestdto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network.dart';
import '../../../models/lesson.dart';

part 'get_lesson.g.dart';

@riverpod
Future<Lesson> getLesson(ref, int lessonId) async {
  final dio = await ref.read(dioProviderWithAccessToken.future);
  Response response = await dio.get('/study/course/lesson?lesson_id=$lessonId');
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
              progress: vocabulary.progress ?? 0);
        }).toList();

        print("LIST LEARNING : ${listLearning?.first.vocabulary}");

        Lesson lesson = VocabularyLesson(
            title: result.title,
            description: result.description ?? "",
            listLearning: listLearning);
        return lesson;
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
        return TestLesson(
            title: result.title,
            description: result.description ?? "",
            listLearning: listLearning);
      default:
        throw Exception();
    }
  } else {
    throw Exception("Error : ${response.statusMessage}");
  }
}
