
import 'package:dio/dio.dart';
import 'package:membreadflutter/src/core/network.dart';
import 'package:membreadflutter/src/dtos/create_lesson_dto/create_vocabulary_lesson_dto/create_vocabulary_lesson_dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_vocabulary_lesson.g.dart';

@riverpod
Future<bool> createVocabularyLesson(ref,CreateVocabularyLessonDTO vocabularyLesson) async{
  final dio = await ref.read(dioProviderWithAccessToken.future);
  Response response = dio.post('/study/course/add-lesson-vocabulary',
    data : vocabularyLesson.toJson()
  );

  print(vocabularyLesson.toString());

  if(response.statusCode == 201){
    return true;
  }else{
    print(response.statusMessage);
    return false;
  }
}