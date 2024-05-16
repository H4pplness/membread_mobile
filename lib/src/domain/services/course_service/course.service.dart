import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:membreadflutter/src/dtos/createcoursedto/createcoursedto.dart';
import 'package:membreadflutter/src/dtos/getcourseinfodto/getcourseinfodto.dart';
import 'package:membreadflutter/src/dtos/getlearningcoursedto/getlearningcoursedto.dart';

class CourseService {
  String endpoint = 'http://10.0.2.2:3000/course/info/';
  Future<GetCourseInfoDTO> getCourseDetail(int id) async {
    Response response = await get(Uri.parse(endpoint+id.toString()));
    if(response.statusCode == 200){
      final result = jsonDecode(response.body);
      print(result);
      return GetCourseInfoDTO.fromJson(result);
    }else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<List<GetLearningCourseDTO>> getLearningCourse(int userId) async {
    Response response = await get(Uri.parse('http://10.0.2.2:3000/course/learning/'+userId.toString()));
    if(response.statusCode == 200){
      final result = jsonDecode(response.body) as List<dynamic>;
      return result.map((course) => GetLearningCourseDTO.fromJson(course)).toList();
    }else {
      throw Exception(response.reasonPhrase);
    }
  }
  
  Future<void> crearteCourse(CreateCourseDTO createCourseDTO) async {
    print(jsonEncode(createCourseDTO.toJson()));
    Response response = await post(Uri.parse('http://10.0.2.2:3000/course/'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(createCourseDTO.toJson())
    );
    if(response.statusCode == 201){
      return;
    }else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final courseService =  Provider<CourseService>((ref)=>CourseService());

final getCourseProvider = FutureProvider.family<GetCourseInfoDTO,int>((ref,id) async {
  return ref.watch(courseService).getCourseDetail(id);
});

final getLearningCourseProvider = FutureProvider.family<List<GetLearningCourseDTO>,int>((ref,id) async {
  return ref.watch(courseService).getLearningCourse(id);
});