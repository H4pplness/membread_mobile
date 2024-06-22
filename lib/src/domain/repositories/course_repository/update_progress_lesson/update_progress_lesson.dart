
import 'package:dio/dio.dart';
import 'package:membreadflutter/src/core/network.dart';
import 'package:membreadflutter/src/dtos/updateprogresslessondto/update_progress_lesson_vocabulary_dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'update_progress_lesson.g.dart';

@riverpod
Future<dynamic> updateProgressLesson(ref , UpdateProgressLessonVocabularyDTO learned) async{
  final dio = await ref.read(dioProviderWithAccessToken.future);
  print("LEARNED : ${learned.toJson()}");
  Response response = await dio.post('/study/course/update-progress/vocabulary-lesson',
    data : learned.toJson()
  );

  if(response.statusCode == 201){
    return {"message" : response.statusMessage};
  }else{
    print("RESPONSE : ${response.statusMessage}");
    return {"message" : response.statusMessage};
  }
}