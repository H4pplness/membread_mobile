import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:membreadflutter/src/domain/services/course_service/course.service.dart';
import 'package:membreadflutter/src/dtos/getcourseinfodto/getcourseinfodto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class CourseServiceProvider {
  FutureProviderFamily<GetCourseInfoDTO,int> getCourse = getCourseProvider;

}