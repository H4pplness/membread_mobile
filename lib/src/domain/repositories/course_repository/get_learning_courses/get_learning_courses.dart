import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:membreadflutter/src/domain/models/course.dart';
import 'package:membreadflutter/src/dtos/getcourseinfodto/getcourseinfodto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network.dart';
import '../../../models/user.dart';
part 'get_learning_courses.g.dart';

@riverpod
Future<List<Course>> getLearningCourse(ref) async {
  final dio = await ref.read(dioProviderWithAccessToken.future);
  Response response = await dio.get(
      'study/course/learning');
  if (response.statusCode == 200) {
    final result = response.data as List;
    final learningCourses = result.map((course) {
      final getCourseInfoDTO =  GetCourseInfoDTO.fromJson(course);
      return Course(id: getCourseInfoDTO.id,title: getCourseInfoDTO.title,description: getCourseInfoDTO.title,author: User(id: getCourseInfoDTO.author?.id));
    }).toList();
    return learningCourses;
  } else {
    throw Exception("Error : ${response.statusMessage}");
  }
}
