
import 'package:dio/dio.dart';

// import '../../../../core/network.dart';
// import '../../../models/lesson.dart';
//
// Future<List<Lesson>> getListLesson(ref,int courseId){
//   final dio = ref.read(dioProvider);
//   Response response = await dio.get(
//       'course/learning?user_id=$courseId');
//   if (response.statusCode == 200) {
//     final result = response.data as List;
//     final learningCourses = result.map((course) {
//       final getCourseInfoDTO =  GetCourseInfoDTO.fromJson(course);
//       return Course(id: getCourseInfoDTO.id,title: getCourseInfoDTO.title,description: getCourseInfoDTO.title);
//     }).toList();
//     return learningCourses;
//   } else {
//     throw Exception("Error : ${response.statusMessage}");
//   }
// }