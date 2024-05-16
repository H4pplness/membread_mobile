
import '../../models/course.dart';

Future<List<Course>> getRecentCourses(ref) async {
  return [];
}

// Future<Course> getCourseInfo(ref) async{
//   final dio = ref.read(dioProvider);
//   Response response = await dio.get('course/info?course_id=1&user_id=b4d8a4d1-ed79-4905-a3d5-fc7b98799037');
//   if(response.statusCode == 200){
//     final result = response.data;
//     final getCourseInfoDTO = GetCourseInfoDTO.fromJson(result);
//     List<Lesson> lessons = [];
//     getCourseInfoDTO.listLesson?.forEach((lesson) {
//       print("LESSON : $lesson");
//       lessons.add(Lesson(id: lesson.id,title: lesson.title,description: lesson.description));
//     });
//     Course course = Course(id: 1,title: getCourseInfoDTO.title,description: getCourseInfoDTO.description,lessons: lessons);
//     return course;
//   }else {
//     throw Exception("Error : ${response.statusMessage}");
//   }
// }
//
// final getCourseInfoProvider = FutureProvider((ref) => getCourseInfo(ref));