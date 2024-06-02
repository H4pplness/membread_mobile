import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:membreadflutter/src/core/network.dart';
import 'package:membreadflutter/src/domain/models/lesson.dart';
import 'package:membreadflutter/src/domain/models/user.dart';
import 'package:membreadflutter/src/domain/models/vocabulary_lesson.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../dtos/getcourseinfodto/getcourseinfodto.dart';
import '../../../models/course.dart';

part 'get_course_info.g.dart';

class GetCourseInfoParams {
  int courseId;

  GetCourseInfoParams(this.courseId);
}

@riverpod
Future<Course> getCourseInfo(
    ref, GetCourseInfoParams getCourseInfoParams) async {
  final dio = await ref.read(dioProviderWithAccessToken.future);
  Response response = await dio
      .get('study/course/info?course_id=${getCourseInfoParams.courseId}');
  if (response.statusCode == 200) {
    final result = response.data;
    final getCourseInfoDTO = GetCourseInfoDTO.fromJson(result);
    List<Lesson> lessons = [];
    getCourseInfoDTO.listLesson?.forEach((lesson) {
      lessons.add(VocabularyLesson(
          id: lesson.id, title: lesson.title, description: lesson.description));
    });
    Course course = Course(
        id: getCourseInfoParams.courseId,
        title: getCourseInfoDTO.title,
        description: getCourseInfoDTO.description,
        lessons: lessons,
        canStudy: getCourseInfoDTO.canStudy,
        author: User(
            id: getCourseInfoDTO.author?.id ?? "",
            username: getCourseInfoDTO.author?.userName,
            avatar: avatar(getCourseInfoDTO.author?.avatar)),
        avatar: getCourseInfoDTO.avatar);
    return course;
  } else {
    throw Exception("Error : ${response.statusMessage}");
  }
}
