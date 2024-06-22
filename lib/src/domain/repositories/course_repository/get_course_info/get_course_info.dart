import 'package:dio/dio.dart';
import 'package:membreadflutter/src/core/network.dart';
import 'package:membreadflutter/src/domain/models/lesson.dart';
import 'package:membreadflutter/src/domain/models/test_lesson.dart';
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
      if (lesson.type == 'vocabulary') {
        print("KHOA HOC TU VUNG : ${lesson.id}");
        lessons.add(VocabularyLesson(
            id: lesson.id,
            title: lesson.title,
            description: lesson.description));
      }
      if (lesson.type == 'test') {
        print("KHOA HOC TEST : ${lesson.id}");
        lessons.add(TestLesson(
            id: lesson.id,
            title: lesson.title,
            description: lesson.description));
      }
    });
    Course course = Course(
        id: getCourseInfoParams.courseId,
        title: getCourseInfoDTO.title,
        description: getCourseInfoDTO.description,
        lessons: lessons,
        canStudy: getCourseInfoDTO.canStudy,
        rating: int.parse(getCourseInfoDTO.rating??"0"),
        author: User(
            id: getCourseInfoDTO.author?.id ?? "",
            username: getCourseInfoDTO.author?.userName,
            avatar: avatar(getCourseInfoDTO.author?.avatar)),
        avatar: avatar(getCourseInfoDTO.avatar));
    return course;
  } else {
    throw Exception("Error : ${response.statusMessage}");
  }
}
