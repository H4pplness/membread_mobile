
import 'package:dio/dio.dart';
import 'package:membreadflutter/src/core/network.dart';
import 'package:membreadflutter/src/dtos/create_lesson_dto/create_vocabulary_lesson_dto/create_vocabulary_lesson_dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../dtos/create_lesson_dto/create_lesson_dto.dart';

part 'create_test_lesson.g.dart';

@riverpod
Future<bool> createTestLesson(ref,CreateLessonDTO lesson) async{
  final dio = await ref.read(dioProviderWithAccessToken.future);
  Response response = await dio.post('/study/course/add-lesson-test',
    data : lesson.toJson()
  );

  print("LESSON SSSSSSSSSSSS : ${lesson.toJson()}");

  if(response.statusCode == 201){
    return true;
  }else{
    print(response.statusMessage);
    return false;
  }
}