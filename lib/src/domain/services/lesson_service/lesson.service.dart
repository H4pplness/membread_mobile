import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

import '../../../dtos/lessondto/lessonvocabularydto.dart';

class LessonService {
  String endpoint = 'http://10.0.2.2:3000/lesson/vocabulary-lesson/';
  Future<LessonVocabularyDTO> getLesson(int id) async {
    Response response = await get(Uri.parse(endpoint+id.toString()));
    if(response.statusCode == 200){
      final result = jsonDecode(response.body);
      return LessonVocabularyDTO.fromJson(result);
    }else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final lessonService =  Provider<LessonService>((ref)=>LessonService());

final getLessonProvider = FutureProvider.family<LessonVocabularyDTO,int>((ref,id) async {
  return ref.watch(lessonService).getLesson(id);
});