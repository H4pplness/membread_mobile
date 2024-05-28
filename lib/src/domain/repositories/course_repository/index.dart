
import 'package:membreadflutter/src/domain/repositories/course_repository/get_course_info/get_course_info.dart';

class CourseRepository {
  final getCourseInfo = getCourseInfoProvider;
}

CourseRepository courseRepository = CourseRepository();