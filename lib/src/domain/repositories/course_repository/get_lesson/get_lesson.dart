
import 'package:dio/dio.dart';
import 'package:membreadflutter/src/domain/models/vocabulary.dart';
import 'package:membreadflutter/src/domain/models/vocabulary_lesson.dart';
import 'package:membreadflutter/src/dtos/lessondto/lessonvocabularydto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network.dart';
import '../../../models/lesson.dart';

part 'get_lesson.g.dart';

@riverpod
Future<Lesson> getLesson(ref,int lessonId) async{
  final dio = await ref.read(dioProviderWithAccessToken.future);
  Response response = await dio.get(
      '/study/course/vocabulary-lesson?lesson_id=$lessonId');
  if (response.statusCode == 200) {
    final result = LessonVocabularyDTO.fromJson(response.data);
    final listLearning =  result.listVocabulary?.map((vocabulary){
      return Vocabulary(id: vocabulary.id,vocabulary: vocabulary.vocabulary,mean: vocabulary.mean,progress: vocabulary.progress);
    }).toList();

    print("LIST LEARNING : ${listLearning?.first.vocabulary}");

    Lesson lesson = VocabularyLesson(title: result.title,description: result.description??"",listLearning: listLearning);
    return lesson;
  } else {
    throw Exception("Error : ${response.statusMessage}");
  }
}