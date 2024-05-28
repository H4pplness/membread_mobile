
import 'package:dio/dio.dart';
import 'package:membreadflutter/src/core/network.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_course.g.dart';

class CreateCourseDTO{
  String title;
  String? description;

  CreateCourseDTO({required this.title,this.description});
}

@riverpod
Future<void> createCourse(ref,CreateCourseDTO createCourseDTO) async {
  final dio = await ref.read(dioProviderWithAccessToken.future);
  Response response = await dio.post('study/course',
    data : {
      'title' : createCourseDTO.title,
      'description' : createCourseDTO.description
    }
  );

  print(response);
}