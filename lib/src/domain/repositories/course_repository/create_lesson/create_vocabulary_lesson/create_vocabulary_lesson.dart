
import 'package:dio/dio.dart';
import 'package:membreadflutter/src/core/network.dart';
import 'package:membreadflutter/src/dtos/create_lesson_dto/create_vocabulary_lesson_dto/create_vocabulary_lesson_dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../dtos/create_lesson_dto/create_lesson_dto.dart';

part 'create_vocabulary_lesson.g.dart';

@riverpod
Future<bool> createVocabularyLesson(ref,CreateLessonDTO lesson) async{
  final dio = await ref.read(dioProviderWithAccessToken.future);
  Response response = await dio.post('/study/course/add-lesson-vocabulary',
    data : lesson.toJson()
  );

  print(lesson.toString());

  if(response.statusCode == 201){
    return true;
  }else{
    print(response.statusMessage);
    return false;
  }
}